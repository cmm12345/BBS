package com.bbs.user.controller.system;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
	public String getAllUser(HttpServletRequest request,HttpServletResponse response,BbsSystemMessage bbsSystemMessage,String isAdmin,String userString){
		if(StringUtils.isNotEmpty(isAdmin)){
			bbsSystemMessage.setRes02("1");
		}else{
			bbsSystemMessage.setRes05("admin");
		}
		Page<BbsSystemMessage> findAll = bbsSystemMessageService.findAll(new Page<BbsSystemMessage>(request, response), bbsSystemMessage);
		List<BbsSystemMessage> list=new ArrayList<BbsSystemMessage>();
		if(StringUtils.isNotEmpty(isAdmin)){
			request.setAttribute("page", findAll);
			return "/admin/systemMessageList";
		}else{
			if(findAll.getList()!=null&&findAll.getList().size()>0){
				for(BbsSystemMessage message:findAll.getList()){
						if(StringUtils.isEmpty(message.getRes03())){
							if(StringUtils.isNotEmpty(message.getSeeMessageUser())){
								if(message.getSeeMessageUser().contains(","+bbsSystemMessage.getRes01()+",")){
									message.setRes03("1");
								}else{
									message.setRes03("0");
								}
								
							}else{
								message.setRes03("0");
							}
						}
						String str="";
						if(StringUtils.isNotEmpty(message.getRes05())){
						       if(message.getRes05().contains(userString)){
						          str="delete";
							    }
						 }
						if(StringUtils.isEmpty(str)){
						   list.add(message);
						}
				}
			}
			findAll.setList(list);
			request.setAttribute("page", findAll);
			return "/Common/systemMessageList";
		}
		
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
		bbsSystemMessage.setRes01("admin");
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
	
	/**
	 * 查看系统消息
	 * @param request
	 * @return
	 */
	@RequestMapping("/findMessageById")
	public String findMessageById(HttpServletRequest request,HttpServletResponse response,BbsSystemMessage bbsSystemMessage,String userString){
		BbsSystemMessage bbsSystemMessage2=bbsSystemMessageService.selectByPrimaryId(bbsSystemMessage);
		if(!"admin".equals(bbsSystemMessage2.getRes01())){
			if("0".equals(bbsSystemMessage2.getRes03())){
				bbsSystemMessage2.setRes03("1");
				bbsSystemMessage2.setSeeMessageUser(","+userString+",");
			}
		}else{
			if(StringUtils.isNotEmpty(bbsSystemMessage2.getSeeMessageUser())){
				if(!bbsSystemMessage2.getSeeMessageUser().contains(","+userString+",")){
				bbsSystemMessage2.setSeeMessageUser(bbsSystemMessage2.getSeeMessageUser()+","+userString+",");
				}
			}else{
				bbsSystemMessage2.setSeeMessageUser(","+userString+",");
			}
		}
		 bbsSystemMessageService.updateByPrimaryKey(bbsSystemMessage2);
		 request.setAttribute("bbsSystemMessage2",bbsSystemMessage2);
		return "/Common/messageDetail";
	}
	/**
	 * 用户删除系统消息
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteMessage")
	public void deleteMessage(HttpServletRequest request,HttpServletResponse response,BbsSystemMessage bbsSystemMessage,String userString){
		BbsSystemMessage bbsMessage=bbsSystemMessageService.selectByPrimaryId(bbsSystemMessage);
		if(!"admin".equals(bbsMessage.getRes01())){
			bbsMessage.setDelFlag("1");
		}else{
			if(StringUtils.isNotEmpty(bbsMessage.getRes05())){
				bbsMessage.setRes05(bbsMessage.getRes05()+","+userString+",");
			}else{
				bbsMessage.setRes05(","+userString+",");
			}
		}
		bbsSystemMessageService.updateByPrimaryKey(bbsMessage);
	}
	
}
