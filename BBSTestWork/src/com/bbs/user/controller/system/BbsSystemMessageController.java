package com.bbs.user.controller.system;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Page;

import com.bbs.user.bean.BbsSystemMessage;
import com.bbs.user.service.systemMessage.BbsSystemMessageService;

@Controller
@RequestMapping("/system")
public class BbsSystemMessageController {

	@Autowired
	private BbsSystemMessageService bbsSystemMessageService;
	/**
	 * 获取所有消息列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/findSystemMessageList")
	public String getAllUser(HttpServletRequest request,HttpServletResponse response,BbsSystemMessage bbsSystemMessage,String isAdmin){
		if(StringUtils.isNotEmpty(isAdmin)){
			bbsSystemMessage.setRes02("1");
		}
		Page<BbsSystemMessage> findAll = bbsSystemMessageService.findAll(new Page<BbsSystemMessage>(request, response), bbsSystemMessage);
		request.setAttribute("page", findAll);
		return "/admin/systemMessageList";
	}
	
	/**
	 * 新增
	 * @param request
	 * @return
	 */
	@RequestMapping("/insert")
	public String  insert(HttpServletRequest request,HttpServletResponse response,BbsSystemMessage bbsSystemMessage){
		bbsSystemMessage.setDelFlag("0");
		bbsSystemMessage.setCjsj(new Date());
		bbsSystemMessage.setRes02("1");
		bbsSystemMessageService.insert(bbsSystemMessage);
		BbsSystemMessage bbsSystemMessage2=new BbsSystemMessage();
		bbsSystemMessage2.setRes02("1");
		Page<BbsSystemMessage> findAll = bbsSystemMessageService.findAll(new Page<BbsSystemMessage>(request, response), bbsSystemMessage);
		request.setAttribute("page", findAll);
		return "/admin/systemMessageList";
	}
	
	/**
	 * 新增
	 * @param request
	 * @return
	 */
	@RequestMapping("/update")
	public void update(HttpServletRequest request,HttpServletResponse response,BbsSystemMessage bbsSystemMessage,String isAdmin,String toolStyle){
		  if("delete".equals(toolStyle)){
			bbsSystemMessage.setDelFlag("1");
		   }
		bbsSystemMessageService.updateByPrimaryKey(bbsSystemMessage);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
