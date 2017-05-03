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
  var url="${pageContext.request.contextPath}/userView/login.jsp";
      $("#noteListIframe").attr("src",url);
 }
 //登录超时
 function loginTimeOut(){
    window.wxc.xcConfirm("登录超时！请重新登录", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
	              loginFunction();
						                         }
						                      });
 }
  //登录注册成功
 function loginSucccess(){
    window.wxc.xcConfirm("登录成功", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
	              window.location.href="${pageContext.request.contextPath}/index.jsp"; 
						                         }
						                      });
						                      }
						                        //登录注册成功
 function updatePasswordSucccess(){
    window.wxc.xcConfirm("修改成功", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
	              window.location.href="${pageContext.request.contextPath}/index.jsp"; 
						                         }
						                      });
 }
   //找回密码后修改密码
 function updatePasswordFunction(message,userId,userPassword,userLoginNumber,questionOneAnswer,questionTwoAnswer,questionThreeAnswer){
    window.wxc.xcConfirm(message, window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
	               $("#noteListIframe").attr("src","${pageContext.request.contextPath}/userView/updatePassword2.jsp?userId="+userId+"&userPassword="+userPassword+"&userLoginNumber="+userLoginNumber+"&questionOneAnswer="+questionOneAnswer+"&questionTwoAnswer="+questionTwoAnswer+"&questionThreeAnswer="+questionThreeAnswer); 
						                         }
						                      });
 }
 //注册
 function registerFunction(){
 var url="${pageContext.request.contextPath}/userView/register.jsp";
      $("#noteListIframe").attr("src",url);
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
 //显示小栏目
 function showContains(id){
     $("#smallSection"+id).show();
 }
 //小栏隐藏目
  function hideContains(id){
 var ss=document.getElementById("smallSection"+id);
 ss.style.display="none";
 }
 //隐藏/显示个人中心
 function showMyContains(){
 $("#myContains").show();
 }
 function hideMyContains(){
 $("#myContains").hide();
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
 
 //获取所有文件
 function  getFileList(){
    if('${user.userId}'==''){
    alertFunction("请先登录！");
    return false;
    }
    var url="${pageContext.request.contextPath}/file/findFileList.do?isAdmin=isHead";
    $("#noteListIframe").attr("src",url);
 }
 
 
 //进入个人中心
 function userCenter(userId){
  var url="${pageContext.request.contextPath}/userView/userCenter.jsp";
    $("#noteListIframe").attr("src",url);
 }
 //进入会员中心
 function userVipCenter(userId){
    var url="${pageContext.request.contextPath}/userView/userVipCenter.jsp";
    $("#noteListIframe").attr("src",url);
 }
 //用户帖子
 function userNoteCenter(userId){
   var url="${pageContext.request.contextPath}/note/findNoteList.do?userId="+userId;
    $("#noteListIframe").attr("src",url);
 }
 //用户文件
 function userFileCenter(userId){
  var url="${pageContext.request.contextPath}/file/findFileList.do?userId="+userId;
    $("#noteListIframe").attr("src",url);
 }
 //消息中心
 function userMessageCenter(userId){
 var url="${pageContext.request.contextPath}/system/findSystemMessageList.do?res01="+userId+"&userString="+userId;
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
	<c:choose>
	    <c:when test="${user.userRole == '1' }"><li> 版主  ：</li></c:when> 
	    <c:when test="${user.userRole == '2' }"><li> 管理员 ：</li></c:when>
	    <c:when test="${user.userRole == '0' }"><li> 欢迎 ：</li></c:when>  
	</c:choose>
	<c:if test="${user!=null && user.userRole=='1'}">
	 <li onmouseover="showMyContains()"><a href="javascript:managerFunction()" >${user.userName }</a></li>
		<li><a href="javascript:resetFunction()" >注销</a></li>
    </c:if>
    <c:if test="${user!=null && user.userRole=='0'}">
	 <li onmouseover="showMyContains()"><a >${user.userName }</a></li>
		<li><a href="javascript:resetFunction()" >注销</a></li>
    </c:if>
    <c:if test="${user!=null && user.userRole=='2'}">
	 <li><a href="javascript:managerFunction()" >${user.userName }</a></li>
		<li><a href="javascript:resetFunction()" >注销</a></li>
    </c:if>
	</ul>
			 勤记录 懂分享</div>
			 <c:if test="${user.userRole!=2 }">
			  <div id="myContains" onmouseleave="hideMyContains()"  style="display:none;margin-left:1050px;position:absolute;z-index:999;background:#FFFFE0;width:100px;height:120%">
			  
		           <span><a style="margin-left:8px;" title="" href="javaScript:userCenter('${user.userId }')"><i class="glyphicon glyphicon-user"></i>&nbsp;个人中心</a></span><br>
		            <span><a style="margin-left:8px;" title="" href="javaScript:userVipCenter('${user.userId }')"><i class="glyphicon glyphicon-heart"></i>&nbsp;会员中心</a></span><br>
		            <span><a style="margin-left:8px;" title="" href="javaScript:userNoteCenter('${user.userId }')"><i class="glyphicon glyphicon-file"></i>&nbsp;我的帖子</a></span><br>
		            <span><a style="margin-left:8px;" title="" href="javaScript:userFileCenter('${user.userId }')"><i class="glyphicon glyphicon-folder-open"></i>&nbsp;我的文件</a></span><br>
		            <span><a style="margin-left:8px;" title="" href="javaScript:userMessageCenter('${user.userId }')"><i class="glyphicon glyphicon-bell"></i>&nbsp;消息中心</a></span><br>
	          </div>
	           </c:if>
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
	  <li ><a data-cont="${bigSectionList.bigSectionName}"   title="${bigSectionList.bigSectionName}" href="" onmouseover="showContains('${bigSectionList.bigSectionId}')" >${bigSectionList.bigSectionName}</a>
	      <div id="smallSection${bigSectionList.bigSectionId}" onmouseleave="hideContains('${bigSectionList.bigSectionId}')"  style="position:absolute;z-index:999;background:#FFFFFF;display:none;width:100px;height:100%">
	          <c:forEach items="${smallSectionList}" var="smallSectionList">
		          <c:if test="${smallSectionList.bigSectionId==bigSectionList.bigSectionId}">
		           <a style="margin-left:20px;" title="${smallSectionList.smallSectionName}" href="javascript:findNoteList('${smallSectionList.smallSectionId}','${smallSectionList.bigSectionId}')">${smallSectionList.smallSectionName}</a><br>
		          </c:if>
	          </c:forEach>
	      </div>
	 </li>
	</c:forEach>
	
	<li><a data-cont="文件上传" title="文件上传" href="javaScript:uploadFile()" >文件上传</a></li>
	<li><a data-cont="文件下载" title="文件下载" href="javascript:getFileList()" >文件下载</a></li>
	<li></li>
	</ul>
  </div>
</div>
</nav>
</header>
</body>
</html>
