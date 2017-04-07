package com.bbs.user.controller.bigSection;


import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import util.Page;

import com.bbs.user.bean.BbsBigSection;
import com.bbs.user.service.bigSection.BbsBigSectionService;

@Controller
@RequestMapping("/bigSection")
public class BbsBigSectionController {

	@Autowired
	private BbsBigSectionService bbsBigSectionService;
	
	/**
	 * 获取所有用户列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/getAll")
	public String getAllUser(HttpServletRequest request,HttpServletResponse response,BbsBigSection bbsBigSection){
		bbsBigSection.setDelFlag("0");
		Page<BbsBigSection> findAll = bbsBigSectionService.findAll(new Page<BbsBigSection>(request, response), bbsBigSection);
		request.setAttribute("page", findAll);
		return "/admin/bigSection";
	}
	
	/**
	 * 新增大版块
	 * @param request
	 * @return
	 */
	@RequestMapping("/insert")
	public String insert(HttpServletRequest request,HttpServletResponse response,BbsBigSection bbsBigSection){
		bbsBigSection.setCjsj(new Date());
		bbsBigSection.setDelFlag("0");
		bbsBigSectionService.insert(bbsBigSection);
		Page<BbsBigSection> findAll = bbsBigSectionService.findAll(new Page<BbsBigSection>(request, response), bbsBigSection);
		request.setAttribute("page", findAll);
		return "/admin/bigSection";
	}
	
	

}
