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
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/xcConfirm.css"/>
 <script type="text/javascript">
    $(document).ready(function() {
    
   
    if(window == top){
       window.wxc.xcConfirm("登录超时！请重新登录", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
	              window.location.href="${pageContext.request.contextPath}/userView/login.jsp";
						                         }
						                      });
    }else{
    window.parent.loginTimeOut();
    }
    
    
	});
 </script>
    </head>
<body >



        </body>
</html>