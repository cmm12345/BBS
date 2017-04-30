package com.bbs.user.controller.user;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import util.Page;
import util.UserCommonTools;

import com.bbs.user.bean.BbsSystemMessage;
import com.bbs.user.bean.BbsUser;
import com.bbs.user.service.systemMessage.BbsSystemMessageService;
import com.bbs.user.service.user.BbsUserService;

@Controller
@RequestMapping("/user")
public class BbsUserController {

	@Autowired
	private BbsUserService bbsUserService;
	@Autowired
	private BbsSystemMessageService bbsSystemMessageService;
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
		bbsUser.setUserState("0");
		List<BbsUser> findAll =bbsUserService.findAll(bbsUser);
		request.setAttribute("userList", findAll);
		return findAll;
	}
	/**
	 * 获取所有用户列表,后台管理
	 * @param request
	 * @return
	 */
	@RequestMapping("/getAllUserList")
	public String getAllUserList(HttpServletRequest request,HttpServletResponse response,BbsUser bbsUser){
		bbsUser.setDelFlag("0");
		if(StringUtils.isNotEmpty(bbsUser.getRes01())){
			if(bbsUser.getRes01().contains("版主")){
				bbsUser.setUserRole("1");
			}
			if(bbsUser.getRes01().contains("普通用户")){
				bbsUser.setUserRole("0");
			}
		}
		Page<BbsUser> findAll = bbsUserService.findList(new Page<BbsUser>(request, response), bbsUser);
		request.setAttribute("page", findAll);
		request.setAttribute("userList", findAll);
		return "admin/user";
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
	public String addUser(@RequestParam(value="upload",required=false)MultipartFile file,BbsUser bbsUser,HttpServletRequest request,HttpSession session){
		 String path=request.getSession().getServletContext().getRealPath("/upload");
		 String fileName="";
		 if(StringUtils.isNotEmpty(file.getOriginalFilename())){
		     fileName=file.getOriginalFilename();
		  File targetFile=new File(path,fileName);
			if(!targetFile.exists()){
			  targetFile.mkdirs();
			   }
			try{
			  file.transferTo(targetFile);
			}catch(Exception e){
			  e.printStackTrace();
			}
			bbsUser.setUserPicture("upload/"+fileName);
		 }
		if(StringUtils.isNoneEmpty(bbsUser.getUserPassword())){
			bbsUser.setUserRegisterDate(new Date());
			bbsUser.setUserPoint("0");
			bbsUser.setDelFlag("0");
			bbsUser.setUserYnVip("0");
			bbsUser.setUserRole("0");
			bbsUser.setUserState("0");
			//密码MD5加密
			bbsUser.setUserPassword(UserCommonTools.getMD5String(bbsUser.getUserPassword()));
			bbsUserService.insert(bbsUser);
			 SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
  		   bbsUser.setRes02(sdf.format(bbsUser.getUserBornDate()));
			session.setAttribute("user", bbsUser);
		 return "/userView/loginSuccess";
		}else{
			return "/userView/login";
		}
		
	}
	/**
	 *save
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/insertUser")
	public String save(@RequestParam(value="upload",required=false)MultipartFile file,BbsUser bbsUser,HttpServletRequest request,HttpSession session){
		 String path=request.getSession().getServletContext().getRealPath("/upload");
		 String fileName="";
		 if(StringUtils.isNotEmpty(file.getOriginalFilename())){
		     fileName=file.getOriginalFilename();
		  File targetFile=new File(path,fileName);
			if(!targetFile.exists()){
			  targetFile.mkdirs();
			   }
			try{
			  file.transferTo(targetFile);
			}catch(Exception e){
			  e.printStackTrace();
			}
			bbsUser.setUserPicture("upload/"+fileName);
		 }
			bbsUserService.update(bbsUser);
			refreshUser(bbsUser.getUserId());
		 return "/userView/userCenter";
		
	}
	
	/**
	 *充值
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/addPoint")
	public String addPoint(BbsUser bbsUser,HttpServletRequest request,HttpSession session,String anum){
			 bbsUser=bbsUserService.findById(bbsUser.getUserId());
			 bbsUser.setUserPoint(String.valueOf(Integer.parseInt(bbsUser.getUserPoint())+Integer.parseInt(anum)));
			bbsUserService.update(bbsUser);
			refreshUser(bbsUser.getUserId());
		 return "/userView/userCenter";
		
	}
	
	/**
	 *修改密码
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/updatePassword")
	public String updatePassword(BbsUser bbsUser,HttpServletRequest request,HttpSession session,String newPassword,String state){
		    
			BbsUser bbsUser2=bbsUserService.findById(bbsUser.getUserId());
		   if(!"find".equals(state)){
			   String passwordString=UserCommonTools.getMD5String(bbsUser.getUserPassword());
			   if(!bbsUser2.getUserPassword().equals(passwordString)){
					request.setAttribute("message", "密码不正确");
					 return "/userView/updatePassword";
				}else{
					bbsUser2.setUserPassword(UserCommonTools.getMD5String(newPassword));
					bbsUserService.update(bbsUser2);
					refreshUser(bbsUser2.getUserId());
					request.setAttribute("message", "修改成功");
				    return "/userView/userCenter";
				}
			 }else{
				 bbsUser2.setUserPassword(UserCommonTools.getMD5String(newPassword));
				bbsUserService.update(bbsUser2);
				refreshUser(bbsUser2.getUserId());
				request.setAttribute("message", "修改密码成功");
				request.setAttribute("state", state);
			    return "/userView/userCenter";
			}
	}
	/**
	 * 成为会员或续费
	 */
	@SuppressWarnings("static-access")
	@RequestMapping("/changeVip")
	public String  changeVip(BbsUser user,HttpServletRequest request,String str){
		BbsUser bbsUser=bbsUserService.findById(user.getUserId());
		Calendar cal=Calendar.getInstance();
		if("1".equals(bbsUser.getUserYnVip())){
			if(bbsUser.getUserYnVipEnddate().getTime()>=new Date().getTime()){
				cal.setTime(bbsUser.getUserYnVipEnddate());
				cal.add(cal.MONTH,Integer.parseInt(str));// 目前時間加str個月 
			}else{
			cal.add(Calendar.MONTH,Integer.parseInt(str));// 目前時間加str個月   
			}
		}else{
		    cal.add(Calendar.MONTH,Integer.parseInt(str));// 目前時間加str個月   
		}
		bbsUser.setUserYnVip("1");
		bbsUser.setUserYnVipEnddate(cal.getTime());
		bbsUserService.update(bbsUser);
		refreshUser(bbsUser.getUserId());
		return "/userView/userVipCenter";
	}
	
	
	/**
	 *禁言
	 * @param user
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/forbidUser")
	public void updateUser(BbsUser user,HttpServletRequest request){
		bbsUserService.update(user);
		refreshUser(user.getUserId());
		String str="";
		if("0".equals(user.getUserState())){
			str="您于"+new Date()+"被管理员解除禁言，现在可以发表您的观点啦";
		}else{
			str="您于"+new Date()+"被管理员禁言，现在账号处于冻结状态，如有疑问请联系管理员";
		}
		BbsSystemMessage bbsSystemMessage=new BbsSystemMessage();
		bbsSystemMessage.setCjsj(new Date());
		bbsSystemMessage.setMessageContains(str);
		bbsSystemMessage.setDelFlag("0");
		bbsSystemMessage.setMessageNamae("账号变动信息");
		bbsSystemMessage.setRes01(user.getUserId());
		bbsSystemMessage.setRes02("0");
		bbsSystemMessage.setRes03("0");
		//将信息反馈给用户
		bbsSystemMessageService.insert(bbsSystemMessage);
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
	 * @throws ParseException 
	 */
	@RequestMapping("/getUser")
	public String getUserByNumber(BbsUser user,String imageCode,HttpServletRequest request,Model model,HttpSession session){
		 String sRand=(String) session.getAttribute("sRand");
		   if(StringUtils.isNotEmpty(imageCode)){
			   user.setUserPassword(UserCommonTools.getMD5String(user.getUserPassword()));
			    if(!imageCode.equals(sRand)){
			    	request.setAttribute("message", "验证码错误！");
			    	return "/userView/login";
			    }else{
			    	   user.setDelFlag("0");
			           BbsUser bbsUser=bbsUserService.getUserByNumber(user);
			          if(bbsUser==null){
			        	  request.setAttribute("message", "账号密码错误！");
			        	   return "/userView/login";
			           }else{
			        	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			    		   bbsUser.setRes02(sdf.format(bbsUser.getUserBornDate()));
			                session.setAttribute("user", bbsUser);
			                return "/userView/loginSuccess";
			           }
			    }
		   }else{
			   return "/userView/login"; 
		   }
		   
		
	}
	/**
	 * 找回密码
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/findPassword")
	public String findPassword(BbsUser user,HttpServletRequest request,Model model,HttpSession session,String loginNumberOrLxdh){
		   user.setUserLoginnumber(loginNumberOrLxdh);
		   user.setDelFlag("0");
		   BbsUser bbsUser=bbsUserService.getUserByNumber(user);
		   String str="";
		   if(bbsUser!=null){
		      if(!bbsUser.getQuestionOneAnswer().equals(user.getQuestionOneAnswer())||!bbsUser.getQuestionTwoAnswer().equals(user.getQuestionTwoAnswer())||!bbsUser.getQuestionThreeAnswer().equals(user.getQuestionThreeAnswer())){
		    	  str="对不起，您输入的问题答案不正确" ;
		       }else{
		    	   str="恭喜您的密码找回成功！请马上修改密码";
		    	   request.setAttribute("userId",bbsUser.getUserId());
		    	   request.setAttribute("userPassword",bbsUser.getUserPassword());
		    	   request.setAttribute("userLoginNumber",bbsUser.getUserLoginnumber());
		    	   request.setAttribute("questionOneAnswer",bbsUser.getQuestionOneAnswer());
		    	   request.setAttribute("questionTwoAnswer",bbsUser.getQuestionTwoAnswer());
		    	   request.setAttribute("questionThreeAnswer",bbsUser.getQuestionThreeAnswer());
		       }
           }else{
			  str="对不起，账号不存在" ;
		   }
		   request.setAttribute("message",str);
		return "userView/login";
	}
	
	
	/**
	 * 根据账号查询单个用户
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/findUserById")
	public String findUserById(BbsUser user,HttpServletRequest request,Model model,HttpSession session){
		   BbsUser bbsUser=bbsUserService.findById(user.getUserId());
		   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		   bbsUser.setRes02(sdf.format(bbsUser.getUserBornDate()));
		   session.removeAttribute("user");
		   session.setAttribute("user", bbsUser);
		return "userView/userCenter";
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
