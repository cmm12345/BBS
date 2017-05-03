package com.bbs.user.controller.note;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import util.Page;

import com.bbs.user.bean.BbsFile;
import com.bbs.user.bean.BbsNote;
import com.bbs.user.bean.BbsReplyNote;
import com.bbs.user.bean.BbsSmallSection;
import com.bbs.user.bean.BbsSystemMessage;
import com.bbs.user.bean.BbsUser;
import com.bbs.user.service.file.BbsFileService;
import com.bbs.user.service.note.BbsNoteService;
import com.bbs.user.service.replyNote.ReplyNoteService;
import com.bbs.user.service.smallSection.BbsSmallSectionService;
import com.bbs.user.service.systemMessage.BbsSystemMessageService;
import com.bbs.user.service.user.BbsUserService;

@Controller
@RequestMapping("/note")
public class BbsNoteController {

	@Autowired
	private BbsNoteService bbsNoteService;
	@Autowired
	private ReplyNoteService replyNoteService;
	@Autowired
	private BbsUserService bbsUserService;
	
	@Autowired
	private BbsFileService bbsFileService;
	@Autowired
	private BbsSystemMessageService bbsSystemMessageService;
	@Autowired
	private BbsSmallSectionService bbsSmallSectionService;
	/**
	 * 获取帖子前20点赞数的用于前台显示
	 * @param request
	 * @return
	 */
	@RequestMapping("/findHotNoteList")
	public String findHotList(HttpServletRequest request,HttpServletResponse response,BbsNote bbsNote){
		List<BbsNote> list=bbsNoteService.findHotList(bbsNote);
		request.setAttribute("hotNoteList", list);
		return "Common/indexListIframe";
	}
	/**
	 * 获取小版块下的所有帖子
	 * @param request
	 * @return
	 */
	@RequestMapping("/findNoteList")
	public String findNoteList(HttpServletRequest request,HttpServletResponse response,BbsNote bbsNote,String isAdmin,String userString,String userRole){
		//如果是后台过来的
		String smallSectionIdString="";
		if(StringUtils.isNotEmpty(userString)&!"2".equals(userRole)){
			BbsSmallSection bbsSmallSection=new BbsSmallSection();
			bbsSmallSection.setDelFlag("0");
			bbsSmallSection.setUserid(userString);
			BbsSmallSection bbsSmallSection2=bbsSmallSectionService.selectSmallSectionById(bbsSmallSection);
			smallSectionIdString=bbsSmallSection2.getSmallSectionId();
			bbsNote.setSmallSectionId(smallSectionIdString);
		}
		Page<BbsNote> findAll = bbsNoteService.findAll(new Page<BbsNote>(request, response), bbsNote);
		request.setAttribute("page", findAll);
		request.setAttribute("smallSectionId", bbsNote.getSmallSectionId());
		request.setAttribute("bigSectionId", bbsNote.getBigSectionId());
		if(StringUtils.isNotEmpty(isAdmin)){
			return "admin/noteList";
		}else{
		    return "Common/indexPageListIframe";
		}
	}
	
	/**
	 * 查看帖子信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/findNoteById")
	public String findNoteById(HttpServletRequest request,HttpServletResponse response,BbsNote bbsNote,String userString,String state){
		BbsNote bbsNote2 = bbsNoteService.findNoteById(bbsNote);
		String str="wdz";
		if(StringUtils.isNotEmpty(bbsNote2.getRes02())){
			if(bbsNote2.getRes02().contains(","+userString+",")){
				str="ydz";
			}
		}
		bbsNote2.setRes03(str);
		BbsReplyNote bbsReplyNote=new BbsReplyNote();
		bbsReplyNote.setNoteId(bbsNote2.getNoteId());
		bbsReplyNote.setDelFlag("0");
		bbsReplyNote.setRes01("0");
		List<BbsReplyNote> bbsReplyNoteList=replyNoteService.findList(bbsReplyNote);
		request.setAttribute("replyNoteList", bbsReplyNoteList);
		request.setAttribute("bbsNote2", bbsNote2);
		request.setAttribute("state", state);
		if("isAdmin".equals(state)){
			return "admin/noteDetail";
		}else{
		return "Common/noteDetail";
		}
	}
	/**
	 * 发帖
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	public String save(HttpServletRequest request,HttpServletResponse response,BbsNote bbsNote){
		bbsNote.setNoteDate(new Date());
		bbsNote.setDelFlag("0");
		bbsNote.setNoteDzs("0");
		bbsNote.setNoteState("0");
		bbsNote.setNoteYnHot("0");
		bbsNote.setNoteAnswerNum("0");
		if(StringUtils.isNotEmpty(bbsNote.getRes04())){
			bbsNote.setRes05("0");
		}
	   if(StringUtils.isNotEmpty(bbsNote.getRes08())){
				bbsNote.setRes07("0");
				bbsNote.setRes09("0");
			}
		bbsNoteService.insert(bbsNote);
		BbsUser bbsUser=bbsUserService.findById(bbsNote.getUserId());
		if(StringUtils.isEmpty(bbsNote.getRes08())){
			if(StringUtils.isNotEmpty(bbsNote.getRes04())){
				bbsUser.setUserPoint(String.valueOf(Integer.parseInt(bbsUser.getUserPoint())+3-Integer.parseInt(bbsNote.getRes04())));
			}
			bbsUserService.update(bbsUser);
			refreshUser(bbsUser.getUserId());
		}
		bbsNote.setUserId("");
		Page<BbsNote> findAll = bbsNoteService.findAll(new Page<BbsNote>(request, response), bbsNote);
		request.setAttribute("page", findAll);
		return "Common/indexPageListIframe";
	}
	/**
	 * 修改,设置热度贴
	 * @param request
	 * @return
	 */
	@RequestMapping("/update")
	public void update(HttpServletRequest request,HttpServletResponse response,BbsNote bbsNote,String toolStyle,String reasonStr){
		BbsNote bbsNote2=bbsNoteService.findNoteById(bbsNote);
		String str="";
		if(toolStyle.equals("delete")){
			bbsNote2.setDelFlag("1");
			bbsNoteService.update(bbsNote2);
			BbsUser bbsUser=bbsUserService.findById(bbsNote2.getUserId());
			if(Integer.parseInt(bbsUser.getUserPoint())<=2){
				bbsUser.setUserPoint("0");
			}else{
				bbsUser.setUserPoint(String.valueOf(Integer.parseInt(bbsUser.getUserPoint())-2));
			}
			bbsUserService.update(bbsUser);
			str="您的帖子被管理员删除，删除原因是"+reasonStr+"您的积分被扣除2分";
			refreshUser(bbsUser.getUserId());
		}
		if(toolStyle.equals("setNoteHot")){
			bbsNote2.setNoteYnHot("1");
			bbsNoteService.update(bbsNote2);
			BbsUser bbsUser=bbsUserService.findById(bbsNote2.getUserId());
	        bbsUser.setUserPoint(String.valueOf(Integer.parseInt(bbsUser.getUserPoint())+2));
			bbsUserService.update(bbsUser);
			str="您的帖子被管理员设为热度贴,您的积分被加2分";
			refreshUser(bbsUser.getUserId());
		}
		if(toolStyle.equals("returnNoteHot")){
			bbsNote2.setNoteYnHot("0");
			bbsNoteService.update(bbsNote2);
		}
		if(StringUtils.isNotEmpty(str)){
			BbsSystemMessage bbsSystemMessage=new BbsSystemMessage();
			bbsSystemMessage.setCjsj(new Date());
			bbsSystemMessage.setMessageContains(str);
			bbsSystemMessage.setDelFlag("0");
			bbsSystemMessage.setMessageNamae("账号变动信息");
			bbsSystemMessage.setRes01(bbsNote2.getUserId());
			bbsSystemMessage.setRes02("0");
			bbsSystemMessage.setRes03("0");
		
		bbsSystemMessageService.insert(bbsSystemMessage);
		}
		
	}
	
	/**
	 * 修改,设置热度贴
	 * @param request
	 * @return
	 */
	@RequestMapping("/userDelete")
	public void  userDelete(HttpServletRequest request,HttpServletResponse response,BbsNote bbsNote){
		BbsNote bbsNote2=bbsNoteService.findNoteById(bbsNote);
		bbsNote2.setDelFlag("1");
		bbsNoteService.update(bbsNote2);
	}
	/**
	 * 回帖
	 * @param request
	 * @return
	 */
	@RequestMapping("/replySave")
	public String replySave(HttpServletRequest request,HttpServletResponse response,BbsReplyNote bbsReplyNote,String sfFile){
		bbsReplyNote.setDelFlag("0");
		bbsReplyNote.setReplyDate(new Date());
		BbsUser bbsUser=bbsUserService.findById(bbsReplyNote.getUserId());
		if("yes".equals(sfFile)){
			//如果是文件评论
			bbsReplyNote.setRes01("1");
			BbsFile bbsFile=new BbsFile();
			bbsFile.setFileId(bbsReplyNote.getRes02());
			BbsFile bbsFile2=bbsFileService.getFileById(bbsFile);
			bbsFile2.setRes03(String.valueOf(Integer.parseInt(bbsFile2.getRes03())+1));
			bbsFileService.update(bbsFile2);
			request.setAttribute("file", bbsFile2);
		}else{
			bbsReplyNote.setRes01("0");
			BbsNote bbsNote=new BbsNote();
			bbsNote.setDelFlag("0");
			bbsNote.setNoteId(bbsReplyNote.getNoteId());
			BbsNote bbsNote2 = bbsNoteService.findNoteById(bbsNote);
			if(StringUtils.isNotEmpty(bbsNote2.getRes08())){
				if(bbsNote2.getRes07().equals(String.valueOf(Integer.parseInt(bbsNote2.getRes06())-1))){
					bbsNote2.setRes09("1");
					bbsUser.setUserPoint(String.valueOf(Integer.parseInt(bbsUser.getUserPoint())+Integer.parseInt(bbsNote2.getRes08())));
					request.setAttribute("getPoint", "获得积分："+bbsNote2.getRes08());
				}
				bbsNote2.setRes07(String.valueOf(Integer.parseInt(bbsNote2.getRes07())+1));
				
			}
			bbsNote2.setNoteAnswerNum(String.valueOf(Integer.parseInt(bbsNote2.getNoteAnswerNum())+1));
			bbsNoteService.update(bbsNote2);
			request.setAttribute("bbsNote2", bbsNote2);
		}
		replyNoteService.insert(bbsReplyNote);
		bbsUser.setUserPoint(String.valueOf(Integer.parseInt(bbsUser.getUserPoint())+2));
		bbsUserService.update(bbsUser);
		refreshUser(bbsReplyNote.getUserId());
		List<BbsReplyNote> bbsReplyNoteList=replyNoteService.findList(bbsReplyNote);
		request.setAttribute("replyNoteList", bbsReplyNoteList);
		if("yes".equals(sfFile)){
			return "Common/fileDetail";
		}else{
		return "Common/noteDetail";
		}
	}
	
	/**
	 * 采纳
	 * @param request
	 * @return
	 */
	@RequestMapping("/getReplyAnswer")
	public void getReplyAnswer(HttpServletRequest request,HttpServletResponse response,BbsReplyNote bbsReplyNote){
		BbsReplyNote bbsReplyNote2=replyNoteService.findBbsReplyNoteById(bbsReplyNote);
		bbsReplyNote2.setRes02("1");
		replyNoteService.update(bbsReplyNote2);
		
		BbsNote bbsNote1=new BbsNote();
		bbsNote1.setDelFlag("0");
		bbsNote1.setNoteId(bbsReplyNote.getNoteId());
		BbsNote bbsNote=bbsNoteService.findNoteById(bbsNote1);
		bbsNote.setRes05("1");
		bbsNoteService.update(bbsNote);
		
		BbsUser bbsUser=bbsUserService.findById(bbsReplyNote.getUserId());
		bbsUser.setUserPoint(String.valueOf(Integer.parseInt(bbsUser.getUserPoint())+Integer.parseInt(bbsNote.getRes04())));
		bbsUserService.update(bbsUser);
		String str="您对于帖子"+bbsNote.getNoteName()+"的回复被楼主采纳，您的积分加"+bbsNote.getRes04()+"分";
		BbsSystemMessage bbsSystemMessage=new BbsSystemMessage();
		bbsSystemMessage.setCjsj(new Date());
		bbsSystemMessage.setMessageContains(str);
		bbsSystemMessage.setDelFlag("0");
		bbsSystemMessage.setMessageNamae("积分变动信息");
		bbsSystemMessage.setRes01(bbsReplyNote.getUserId());
		bbsSystemMessage.setRes02("0");
		bbsSystemMessage.setRes03("0");
		bbsSystemMessageService.insert(bbsSystemMessage);
		
	}
	
	
	/**
	 *点赞
	 * @param request
	 * @return
	 */
	@RequestMapping("/addDzs")
	public String addDzs(HttpServletRequest request,HttpServletResponse response,BbsNote bbsNote,String sfdz,String userString){
		bbsNote.setDelFlag("0");
		BbsNote bbsNote2 = bbsNoteService.findNoteById(bbsNote);
		String str="";
		if("wdz".equals(sfdz)){
			if(StringUtils.isNotEmpty(bbsNote2.getRes02())){
			   str=bbsNote2.getRes02()+userString+",";
		    }else{
				str=","+userString+",";
			}
			bbsNote2.setNoteDzs(String.valueOf(Integer.parseInt(bbsNote2.getNoteDzs())+1));
		}else{
			String[] ssStrings=bbsNote2.getRes02().split(",");
			str+=",";
			for(int i=0;i<ssStrings.length;i++){
				if(ssStrings[i].equals(userString)){
					continue;
				}
				str+=ssStrings[i]+",";
			}
			bbsNote2.setNoteDzs(String.valueOf(Integer.parseInt(bbsNote2.getNoteDzs())-1));
		}
		bbsNote2.setRes02(str);
		bbsNoteService.update(bbsNote2);
		return "Common/noteDetail";
	}
	/**
	 *删除回帖
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteReply")
	public void deleteReply(HttpServletRequest request,HttpServletResponse response,BbsReplyNote bbsReplyNote){
		bbsReplyNote.setDelFlag("1");
		replyNoteService.update(bbsReplyNote);
		BbsNote bbsNote=new BbsNote();
		bbsNote.setNoteId(bbsReplyNote.getNoteId());
		bbsNote.setDelFlag("0");
		BbsNote bbsNote2=bbsNoteService.findNoteById(bbsNote);
        bbsNote2.setNoteAnswerNum(String.valueOf(Integer.parseInt(bbsNote2.getNoteAnswerNum())-1));		
        bbsNoteService.update(bbsNote2);
		
	}
	
	public void refreshUser(String userId){
		 RequestAttributes ra=RequestContextHolder.getRequestAttributes();
		 HttpServletRequest request2=((ServletRequestAttributes)ra).getRequest();
		 BbsUser bbsUser2=bbsUserService.findById(userId);
		 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		 bbsUser2.setRes02(sdf.format(bbsUser2.getUserBornDate()));
		 request2.getSession().removeAttribute("user");
		 request2.getSession().setAttribute("user", bbsUser2);
	}
}
