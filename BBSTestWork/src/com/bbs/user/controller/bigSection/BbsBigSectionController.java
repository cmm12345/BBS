package com.bbs.user.controller.bigSection;


import java.text.ParseException;
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

import util.Page;

import com.bbs.user.bean.BbsBigSection;
import com.bbs.user.bean.BbsSmallSection;
import com.bbs.user.service.bigSection.BbsBigSectionService;
import com.bbs.user.service.smallSection.BbsSmallSectionService;

@Controller
@RequestMapping("/bigSection")
public class BbsBigSectionController {

	@Autowired
	private BbsBigSectionService bbsBigSectionService;
	@Autowired
	private BbsSmallSectionService bbsSmallSectionService;
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
	 * 获取所有用户列表
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("findList")
	public List<BbsBigSection> findList(HttpServletRequest request,HttpServletResponse response,BbsBigSection bbsBigSection){
		bbsBigSection.setDelFlag("0");
		List<BbsBigSection> findAll = bbsBigSectionService.findList(bbsBigSection);
		return findAll;
	}
	
	/**
	 * 获取所有用户列表
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/findListByName", method=RequestMethod.GET, produces = "text/html;charset=UTF-8")
	public String findListByName(HttpServletRequest request,HttpServletResponse response,BbsBigSection bbsBigSection){
		bbsBigSection.setDelFlag("0");
		List<BbsBigSection> findAll = bbsBigSectionService.findList(bbsBigSection);
		String message="";
		if(findAll!=null&&findAll.size()>0){
			message = "该版块已存在！";
		}
		return message;
	}
	/**
	 * 新增大版块
	 * @param request
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("/insert")
	public String insert(HttpServletRequest request,HttpServletResponse response,BbsBigSection bbsBigSection) throws ParseException{
		if(StringUtils.isNotEmpty(bbsBigSection.getBigSectionId())){
			bbsBigSectionService.update(bbsBigSection);
		}else{
		  bbsBigSection.setCjsj(new Date());
		  bbsBigSection.setDelFlag("0");
		  bbsBigSectionService.insert(bbsBigSection);
		  bbsBigSection.setBigSectionId("");
		  Page<BbsBigSection> findAll = bbsBigSectionService.findAll(new Page<BbsBigSection>(request, response), bbsBigSection);
		  request.setAttribute("page", findAll);
		}
		return "/admin/bigSection";
	}
	
	/**
	 * 修改大版块
	 * @param request
	 * @return
	 */
	@RequestMapping("/update")
	public void update(HttpServletRequest request,HttpServletResponse response,BbsBigSection bbsBigSection){
			bbsBigSectionService.update(bbsBigSection);
			BbsSmallSection bbsSmallSection=new BbsSmallSection();
			bbsSmallSection.setDelFlag("0");
			bbsSmallSection.setBigSectionId(bbsBigSection.getBigSectionId());
			List<BbsSmallSection> list=bbsSmallSectionService.findList(bbsSmallSection);
			for(BbsSmallSection bbsSmallSection2:list){
				if(!bbsSmallSection2.getBigSectionName().equals(bbsBigSection.getBigSectionName())){
					bbsSmallSection2.setBigSectionName(bbsBigSection.getBigSectionName());
					bbsSmallSectionService.update(bbsSmallSection2);
				}
			}
	}
	/**
	 *删除大版块
	 * @param request
	 * @return
	 */
	@RequestMapping("/delete")
	public void delete(HttpServletRequest request,HttpServletResponse response,BbsBigSection bbsBigSection){
		bbsBigSection.setDelFlag("1");
		bbsBigSectionService.update(bbsBigSection);
	}
}
