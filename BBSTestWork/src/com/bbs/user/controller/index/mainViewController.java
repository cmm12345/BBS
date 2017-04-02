package com.bbs.user.controller.index;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/Common")
public class mainViewController {

	
	/**
	 * 获取所有用户列表
	 * @param request
	 * @return
	 */
	@RequestMapping("/firstView")
	public String getAllUser(HttpServletRequest request){
		return "/index";
	}
	
}
