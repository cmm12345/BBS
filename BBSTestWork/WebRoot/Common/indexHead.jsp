<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home</title>
<meta name="keywords" content="">
<meta name="description" content="">
<script type="text/javascript">
$(document).ready(function() {
	});
//登录
 function loginFunction(){
window.location.href="${pageContext.request.contextPath}/userView/login.jsp"; 
 }
 //注册
 function registerFunction(){
 window.location.href="${pageContext.request.contextPath}/userView/register.jsp";
 }
 //注销
 function resetFunction(){
					var option = {
						title: "自定义",
						btn: parseInt("0011",2),
						onOk: function(){
							window.location.href="${pageContext.request.contextPath}/user/resetUser.do";
						}
					}
					window.wxc.xcConfirm("确定要注销吗？", "custom", option);
  
 }
 //进入后台
 function managerFunction(){
 window.location.href="${pageContext.request.contextPath}/admin/interface/default.jsp";
 }
</script>
</head>
<body class="user-select">
<header class="header">
<nav class="navbar navbar-default" id="navbar">
<div class="container">
  <div class="header-topbar hidden-xs link-border">
	<ul class="site-nav topmenu">
	<c:if test="${user==null }">
	    <li><a href="javascript:loginFunction()" >登录</a></li>
		<li><a href="javascript:registerFunction()" rel="nofollow" >注册</a></li>
	</c:if>
	<c:if test="${user!=null }">
	    <li><a href="javascript:managerFunction()" >${user.userName }</a></li>
		<li><a href="javascript:resetFunction()" >注销</a></li>
	</c:if>
		<li><a href="#" title="RSS订阅" >
			<i class="fa fa-rss">
			</i> RSS订阅
		</a></li>
	</ul>
			 勤记录 懂分享</div>
  <div class="navbar-header">
	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#header-navbar" aria-expanded="false"> <span class="sr-only"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
	<h1 class="logo hvr-bounce-in"><a href="#" title="Share Your View"><img src="${pageContext.request.contextPath}/images/1101.jpg" Style="hight:600px;width:100px" alt="Share Your View"></a></h1>
  </div>
  <div class="collapse navbar-collapse" id="header-navbar">
	<form class="navbar-form visible-xs" action="/Search" method="post">
	  <div class="input-group">
		<input type="text" name="keyword" class="form-control" placeholder="请输入关键字" maxlength="20" autocomplete="off">
		<span class="input-group-btn">
		<button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
		</span> </div>
	</form>
	<div id="IframeDiv" name="hczzCbajYearListDiv" style="display:none">
	          <iframe name="hczzCbajYearListIframe" id="Iframe" frameborder="0" width="200" height="300" scrolling="yes" 
		           marginwidth="0" marginheight="0" src="login.jsp" ></iframe>
	        </div>
	<ul class="nav navbar-nav navbar-right">
	  <li><a data-cont="木庄网络博客" title="木庄网络博客" href="${pageContext.request.contextPath}/Common/firstView.do">首页</a></li>
	  <li><a data-cont="列表页" title="列表页" href="list.html">列表页</a></li>
	  <li><a data-cont="详细页" title="详细页" href="show.html">详细页</a></li>
	  <li><a data-cont="404" title="404" href="404.html">404</a></li>
	  <li><a data-cont="MZ-NetBolg主题" title="MZ-NetBolg主题" href="#" >MZ-NetBolg主题</a></li>
	  <li><a data-cont="IT技术笔记" title="IT技术笔记" href="#" >IT技术笔记</a></li>
	  <li><a data-cont="源码分享" title="源码分享" href="#" >源码分享</a></li>
	  <li><a data-cont="靠谱网赚" title="靠谱网赚" href="#" >靠谱网赚</a></li>
	  <li><a data-cont="资讯分享" title="资讯分享" href="#" >资讯分享</a></li>
	</ul>
  </div>
</div>
</nav>
</header>
</body>
</html>
