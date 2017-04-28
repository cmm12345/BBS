package com.bbs.user.controller.note;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Page;

import com.bbs.user.bean.BbsFile;
import com.bbs.user.bean.BbsNote;
import com.bbs.user.bean.BbsReplyNote;
import com.bbs.user.bean.BbsUser;
import com.bbs.user.service.file.BbsFileService;
import com.bbs.user.service.note.BbsNoteService;
import com.bbs.user.service.replyNote.ReplyNoteService;
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
	public String findNoteList(HttpServletRequest request,HttpServletResponse response,BbsNote bbsNote){
		Page<BbsNote> findAll = bbsNoteService.findAll(new Page<BbsNote>(request, response), bbsNote);
		request.setAttribute("page", findAll);
		request.setAttribute("smallSectionId", bbsNote.getSmallSectionId());
		request.setAttribute("bigSectionId", bbsNote.getBigSectionId());
		return "Common/indexPageListIframe";
	}
	
	/**
	 * 查看帖子信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/findNoteById")
	public String findNoteById(HttpServletRequest request,HttpServletResponse response,BbsNote bbsNote,String userString){
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
		return "Common/noteDetail";
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
		bbsNoteService.insert(bbsNote);
		BbsUser bbsUser=bbsUserService.findById(bbsNote.getUserId());
		bbsUser.setUserPoint(String.valueOf(Integer.parseInt(bbsUser.getUserPoint())+3));
		bbsUserService.update(bbsUser);
		Page<BbsNote> findAll = bbsNoteService.findAll(new Page<BbsNote>(request, response), bbsNote);
		request.setAttribute("page", findAll);
		return "Common/indexPageListIframe";
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
			bbsNote2.setNoteAnswerNum(String.valueOf(Integer.parseInt(bbsNote2.getNoteAnswerNum())+1));
			bbsNoteService.update(bbsNote2);
			request.setAttribute("bbsNote2", bbsNote2);
		}
		replyNoteService.insert(bbsReplyNote);
		BbsUser bbsUser=bbsUserService.findById(bbsReplyNote.getUserId());
		bbsUser.setUserPoint(String.valueOf(Integer.parseInt(bbsUser.getUserPoint())+2));
		bbsUserService.update(bbsUser);
		List<BbsReplyNote> bbsReplyNoteList=replyNoteService.findList(bbsReplyNote);
		request.setAttribute("replyNoteList", bbsReplyNoteList);
		if("yes".equals(sfFile)){
			return "Common/fileDetail";
		}else{
		return "Common/noteDetail";
		}
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
}
