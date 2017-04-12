package com.bbs.user.controller.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import util.UserCommonTools;

import com.bbs.user.bean.BbsUser;
import com.bbs.user.service.user.BbsUserService;

@Controller
@RequestMapping("/user")
public class BbsUserController {

	@Autowired
	private BbsUserService bbsUserService;
	
	/**
	 * 获取所有用户列表
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/getAllUser")
	public List<BbsUser> getAllUser(HttpServletRequest request){
		BbsUser bbsUser=new BbsUser();
		bbsUser.setDelFlag("0");
		bbsUser.setUserRole("0");
		List<BbsUser> findAll =bbsUserService.findAll(bbsUser);
		request.setAttribute("userList", findAll);
		return findAll;
	}
	
	/**
	 * 跳转到添加用户界面
	 * @param request
	 * @return
	 */
	@RequestMapping("/toAddUser")
	public String toAddUser(HttpServletRequest request){
		
		return "/addUser";
	}
	/**
	 * 跳转到添加用户界面
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/beforeRegister")
	public void beforeRegister(BbsUser bbsUser,HttpServletRequest request,HttpServletResponse response, HttpSession session){
		bbsUser.setDelFlag("0");
		BbsUser bbsUser2=bbsUserService.getUserByNumberOrLxdh(bbsUser);
		String message="";
		if(bbsUser2!=null){
			try {
				PrintWriter out = response.getWriter();
				response.setContentType("text/html;charset=UTF-8");
				message = "{\"message\":\""+"该账号已注册！"+"\"}";
				out.write(message);
				out.close();
		    } catch (IOException e) {
				e.printStackTrace();
		    }
		}
	}
	/**
	 * 添加用户或修改
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/addUser")
	public String addUser(BbsUser bbsUser,HttpServletRequest request,HttpSession session){
		if(StringUtils.isNoneEmpty(bbsUser.getUserPassword())){
		 if(StringUtils.isEmpty(bbsUser.getUserId())){
			bbsUser.setUserRegisterDate(new Date());
			bbsUser.setUserPoint("0");
			bbsUser.setDelFlag("0");
			bbsUser.setUserYnVip("0");
			bbsUser.setUserRole("0");
			bbsUser.setUserState("0");
			//密码MD5加密
			bbsUser.setUserPassword(UserCommonTools.getMD5String(bbsUser.getUserPassword()));
			bbsUserService.insert(bbsUser);
			request.setAttribute("user", bbsUser);
		 }else{
			bbsUserService.update(bbsUser);
			request.setAttribute("user", bbsUser);
		 }
		 return "/userView/index";
		}else{
			return "/userView/login";
		}
		
	}
	
	/**
	 *编辑用户
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateUser")
	public String updateUser(BbsUser user,HttpServletRequest request){
		if(bbsUserService.update(user)){
			user = bbsUserService.findById(user.getUserId());
			request.setAttribute("user", user);
			return "redirect:/user/getAllUser";
		}else{
			return "/error";
		}
	}
	/**
	 *注销
	 * @param null
	 * @param request
	 * @return
	 */
	@RequestMapping("/resetUser")
	public String  resetUser(HttpSession session){
		session.removeAttribute("user");
		return "/index";
	}
	/**
	 * 根据账号查询单个用户
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/getUser")
	public String getUserByNumber(BbsUser user,String imageCode,HttpServletRequest request,Model model,HttpSession session){
		 String sRand=(String) session.getAttribute("sRand");
		   if(StringUtils.isNotEmpty(imageCode)){
			   user.setUserPassword(UserCommonTools.getMD5String(user.getUserPassword()));
			    if(!imageCode.equals(sRand)){
			    	 session.setAttribute("message", "验证码错误！");
			    	return "/userView/login";
			    }else{
			    	   user.setDelFlag("0");
			           BbsUser bbsUser=bbsUserService.getUserByNumber(user);
			          if(bbsUser==null){
			        	  session.setAttribute("message", "账号密码错误！");
			        	   return "/userView/login";
			           }else{
			                session.setAttribute("user", bbsUser);
			                return "/index";
			           }
			    }
		   }else{
			   return "/userView/login"; 
		   }
		   
		
	}
}
