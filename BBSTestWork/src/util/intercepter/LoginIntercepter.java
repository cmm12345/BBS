package util.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bbs.user.bean.BbsUser;

	/**
	*登录认证的拦截器
	*/
	public class LoginIntercepter implements HandlerInterceptor{

		/**
		*Handler执行完成之后调用这个方法
		*/
		public void afterCompletion(HttpServletRequest request,HttpServletResponse response,Object handler,Exception exc) throws Exception{
		
		}
		
		/**
		*Handler执行之后，ModelAndView返回之前调用这个方法
		*/
		public void postHandle(HttpServletRequest request,HttpServletResponse response,Object handler,ModelAndView modelAndView)throws Exception{
		
		  }
		
		   /**
		   *Handler执行之前调用这个方法
		   */
		   public boolean preHandle(HttpServletRequest request,HttpServletResponse response,Object handler)throws Exception{
		       //获取请求的URL
		       String url=request.getRequestURI();
		       //URL:login.jsp是公开的;这个demo是除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
		       if(url.indexOf("getUser.do")>=0||url.indexOf("beforeRegister.do")>=0||url.indexOf("addUser.do")>=0||url.indexOf("firstView.do")>=0||url.indexOf("resetUser.do")>=0){
		           return true;
		        }
				//获取Session
				HttpSession session=request.getSession();
				BbsUser bbsUser=(BbsUser)session.getAttribute("user");
				if(bbsUser!=null){
				   return true;
				}
				//不符合条件的，跳转到登录界面
				request.getRequestDispatcher("../userView/login.jsp").forward(request,response);
				return false;
				}
		
		}
