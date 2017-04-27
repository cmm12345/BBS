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
<title>欢迎来到本论坛</title>
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
 
 function showContains(id){
     $("#smallSection"+id).show();
 }
 function hideContains(id){
 var ss=document.getElementById("smallSection"+id);
 ss.style.display="none";
 }
 //查询小栏目下的所有帖子
 function findNoteList(smallSectionId,bigSectionId){
 var url="${pageContext.request.contextPath}/note/findNoteList.do?smallSectionId="+smallSectionId+"&bigSectionId="+bigSectionId;
      $("#noteListIframe").attr("src",url);
 }
 
 
  //查询大栏目下的所有帖子
 function findNoteByBigSectionId(bigSectionId){
 var url="${pageContext.request.contextPath}/note/findNoteList.do?bigSectionId="+bigSectionId;
      $("#noteListIframe").attr("src",url);
 }
 
 //进入上传文件界面、
 function uploadFile(){
     var url="${pageContext.request.contextPath}/Common/uploadFile.jsp";
      $("#noteListIframe").attr("src",url);
 }
</script>
</head>
<body>
<header>
<nav class="navbar navbar-default">
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
	<ul class="nav navbar-nav navbar-right" >
	  <li><a data-cont="首页" title="首页" href="${pageContext.request.contextPath}/index.jsp" >首页</a></li>
	<c:forEach items="${bigSectionList}" var="bigSectionList">
	  <li ><a data-cont="${bigSectionList.bigSectionName}"   title="${bigSectionList.bigSectionName}" href="javaScript:findNoteByBigSectionId('${bigSectionList.bigSectionId}')" onmouseover="showContains('${bigSectionList.bigSectionId}')" >${bigSectionList.bigSectionName}</a>
	      <div id="smallSection${bigSectionList.bigSectionId}" onmouseup="hideContains('${bigSectionList.bigSectionId}')"  style="position:absolute;z-index:999;background:#FFFFFF;display:none;width:100px;height:100%">
	          <c:forEach items="${smallSectionList}" var="smallSectionList">
		          <c:if test="${smallSectionList.bigSectionId==bigSectionList.bigSectionId}">
		           <a style="margin-left:20px;" title="${smallSectionList.smallSectionName}" href="javascript:findNoteList('${smallSectionList.smallSectionId}','${smallSectionList.bigSectionId}')">${smallSectionList.smallSectionName}</a><br>
		          </c:if>
	          </c:forEach>
	      </div>
	 </li>
	</c:forEach>
	<li><a data-cont="文件上传" title="文件上传" href="javaScript:uploadFile()" >文件上传</a></li>
	<li><a data-cont="文件下载" title="文件下载" href="${pageContext.request.contextPath}/file/getFileList.do" >文件下载</a></li>
	</ul>
  </div>
</div>
</nav>
</header>
</body>
</html>
