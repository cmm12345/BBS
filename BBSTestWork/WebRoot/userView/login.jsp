<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
        <meta charset="utf-8">
        <title>登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginstyle.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/xcConfirm.css"/>
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(document).ready(function() {
	if('${message}'!=''){
	     if('${message}'!='恭喜您的密码找回成功！请马上修改密码'){
	      window.parent.alertFunction('${message}');
	     }
	     if('${message}'=='恭喜您的密码找回成功！请马上修改密码'){
	     window.parent.updatePasswordFunction('${message}','${userId}','${userPassword}','${userLoginNumber}','${questionOneAnswer}','${questionTwoAnswer}','${questionThreeAnswer}');
	     } 
	     }
	});
	
	/**
	*登录校验
	*/
	function loginCheck(){
	   if($("#userLoginnumber").val()==''||$("#userPassword").val()==''||$("#imageCode").val()==''){
	   window.parent.alertFunction("请将信息填写完整！");
	   return false;
	   }
	  $("#loginForm").submit();
	}
	function findPassword(){
	window.location.href="${pageContext.request.contextPath}/userView/findPassword.jsp";
	}
</script>
    </head>
<body >
      <div style="width:830px;height:680px;"><br>
            <h1>登录</h1>
            <form id="loginForm" action="${pageContext.request.contextPath}/user/getUser.do" method="post">
                <input type="text" id="userLoginnumber" name="userLoginnumber" placeholder="请输入登录账号或手机号"><br>
                <input type="password" id="userPassword" name="userPassword"  placeholder="请输入密码"><br>
                <input type="text" name="imageCode" id="imageCode" style="width:200px;" placeholder="请输入验证码">
                <img  onclick="this.src='image.jsp?'+Date.parse(''+(new Date()));" title="换一张试试" name="randImage" 
							id="randImage" src="${pageContext.request.contextPath}/userView/image.jsp" border="1" 
							/><br>
                <button type="button" onclick="loginCheck()">登录</button><a href="javaScript:findPassword()">忘记密码？去找回</a>
            </form>
            <div class="connect">
                <p></p>
                <p>
                    <a class="facebook" href=""></a>
                    <a class="twitter" href=""></a>
                </p>
            </div>
        </div>
        
        </body>
</html>