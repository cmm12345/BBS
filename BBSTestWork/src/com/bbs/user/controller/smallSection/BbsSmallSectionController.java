package com.bbs.user.controller.smallSection;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import util.Page;

import com.bbs.user.bean.BbsSmallSection;
import com.bbs.user.bean.BbsSystemMessage;
import com.bbs.user.bean.BbsUser;
import com.bbs.user.service.smallSection.BbsSmallSectionService;
import com.bbs.user.service.systemMessage.BbsSystemMessageService;
import com.bbs.user.service.user.BbsUserService;

@Controller
@RequestMapping("/smallSection")
public class BbsSmallSectionController {

	@Autowired
	private BbsSmallSectionService bbsSmallSectionService;
	@Autowired
	private BbsUserService bbsUserService;
	@Autowired
	private BbsSystemMessageService bbsSystemMessageService;
	/**
	 * 获取所有版块列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getAll")
	public String getAllUser(HttpServletRequest request,HttpServletResponse response,BbsSmallSection bbsSmallSection){
		bbsSmallSection.setDelFlag("0");
		Page<BbsSmallSection> findAll = bbsSmallSectionService.findAll(new Page<BbsSmallSection>(request, response), bbsSmallSection);
		request.setAttribute("page", findAll);
		return "/admin/smallSection";
	}
	
	/**
	 * 获取所有版块列表
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getList", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String getList(HttpServletRequest request,HttpServletResponse response,BbsSmallSection bbsSmallSection){
		bbsSmallSection.setDelFlag("0");
		List<BbsSmallSection> findAllList = bbsSmallSectionService.findList(bbsSmallSection);
		String message="";
		if(findAllList!=null&&findAllList.size()>0){
			message = "该版块已存在！";
		}
		return message;
	}
	
	
	
	
	/**
	 * 新增小版块
	 * @param request
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("/insert")
	public String insert(HttpServletRequest request,HttpServletResponse response,BbsSmallSection bbsSmallSection) throws ParseException{
		 BbsUser bbsUser=new BbsUser();
		if(StringUtils.isNotEmpty(bbsSmallSection.getSmallSectionId())){
			bbsSmallSectionService.update(bbsSmallSection);
			BbsSmallSection bbsSmallSection3=new BbsSmallSection();
			bbsSmallSection3.setSmallSectionId(bbsSmallSection.getSmallSectionId());
			 BbsSmallSection bbsSmallSection2=bbsSmallSectionService.selectSmallSectionById(bbsSmallSection3);
			  String str="您被管理员设置为版块"+bbsSmallSection2.getSmallSectionName()+"的版主";
				BbsSystemMessage bbsSystemMessage=new BbsSystemMessage();
				bbsSystemMessage.setCjsj(new Date());
				bbsSystemMessage.setMessageContains(str);
				bbsSystemMessage.setDelFlag("0");
				bbsSystemMessage.setMessageNamae("账号变动信息");
				bbsSystemMessage.setRes01(bbsSmallSection2.getUserid());
				bbsSystemMessage.setRes02("0");
				bbsSystemMessage.setRes03("0");
				bbsSystemMessageService.insert(bbsSystemMessage);
			if(!bbsSmallSection.getUserid().equals(bbsSmallSection.getRes01())){//原用户Id
				BbsUser bbsUser2=new BbsUser();
					bbsUser.setUserRole("1");
					bbsUser.setUserId(bbsSmallSection.getUserid());
					bbsUser2.setUserRole("0");
					bbsUser2.setUserId(bbsSmallSection.getRes01());
					bbsUserService.update(bbsUser);
					bbsUserService.update(bbsUser2);
					String str1="您被管理员取消为版块"+bbsSmallSection2.getSmallSectionName()+"的版主";
					BbsSystemMessage bbsSystemMessage1=new BbsSystemMessage();
					bbsSystemMessage1.setCjsj(new Date());
					bbsSystemMessage1.setMessageContains(str1);
					bbsSystemMessage1.setDelFlag("0");
					bbsSystemMessage1.setMessageNamae("账号变动信息");
					bbsSystemMessage1.setRes01(bbsSmallSection2.getRes01());
					bbsSystemMessage1.setRes02("0");
					bbsSystemMessage1.setRes03("0");
					bbsSystemMessageService.insert(bbsSystemMessage1);
			}
		}else{
			  bbsSmallSection.setCjsj(new Date());
			  bbsSmallSection.setDelFlag("0");
			  bbsUser.setUserId(bbsSmallSection.getUserid());
			  bbsUser.setUserRole("1");
			  bbsUserService.update(bbsUser);
			  bbsSmallSectionService.insert(bbsSmallSection);
			  bbsSmallSection.setSmallSectionId("");
			  Page<BbsSmallSection> findAll = bbsSmallSectionService.findAll(new Page<BbsSmallSection>(request, response), bbsSmallSection);
			  request.setAttribute("page", findAll);
		}
		findSmallSectionList();
		return "/admin/smallSection";
	}
	
	/**
	 * 修改小版块
	 * @param request
	 * @return
	 */
	@RequestMapping("/update")
	public void update(HttpServletRequest request,HttpServletResponse response,BbsSmallSection BbsSmallSection){
			bbsSmallSectionService.update(BbsSmallSection);
			findSmallSectionList();
	}
	/**
	 *删除大版块
	 * @param request
	 * @return
	 */
	@RequestMapping("/delete")
	public void delete(HttpServletRequest request,HttpServletResponse response,BbsSmallSection BbsSmallSection){
		BbsSmallSection.setDelFlag("1");
		bbsSmallSectionService.update(BbsSmallSection);
		findSmallSectionList();
	}
	
	public void findSmallSectionList(){
		BbsSmallSection bbsSmallSection=new BbsSmallSection();
		bbsSmallSection.setDelFlag("0");
		List<BbsSmallSection> findAll = bbsSmallSectionService.findList(bbsSmallSection);
		 RequestAttributes ra=RequestContextHolder.getRequestAttributes();
		 HttpServletRequest request2=((ServletRequestAttributes)ra).getRequest();
		 request2.getSession().removeAttribute("smallSectionList");
		 request2.getSession().setAttribute("smallSectionList", findAll);
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
