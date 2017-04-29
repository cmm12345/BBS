<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">

$(document).ready(function() {
    if('${state}'!=''){
       $("#comment").hide();
       $("#respond").hide();
    }
    if('${message}'!=''){
    window.parent.alertFunction("您下载的文件不存在！");
    
    }

});
function checkForm(){
  if($("#replyContains").val()==''){
     window.parent.alertFunction("请填写评论内容！");
		return false;
  }
    $("#comment-form").submit();
     window.parent.alertFunction("评论成功！积分+2");
}

//下载
function downloadFile(filePoint,userId,userPoint,fileUrl,fileId,res01){
   if(parseInt(filePoint)>parseInt(userPoint)){
     window.parent.alertFunction("对不起积分不足！请充值");
     return false;
   }
   var url="${pageContext.request.contextPath}/file/downloadFile.do?fileName="+fileUrl+"&userId="+userId+"&filePoint="+filePoint+"&userPoint="+userPoint+"&fileId="+fileId+"&res01="+res01;
   var userDate='${user.userYnVipEnddate}';
   userDate = eval('new Date(' + userDate.replace(/\d+(?=[^]+$)/, 
   function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) + ')');
	  var date1=new Date();
	  var str="";
	if(-userDate.getTime()<date1.getTime()){
	str="确定下载吗？您是vip用户将免费下载";
	}else{
	str="确定下载吗？将扣除您的积分"+filePoint+"分";
	}
   window.parent.confirmFunction(str,url,fileId); 
}

</script>
</head>
  
<body>
   <section class="container">
<div class="content-wrap">
<div class="content">
  <header class="article-header">
	<h1 class="article-title">${file.fileName}</h1>
	<div class="article-meta"> <span class="item article-meta-time">
	  <time class="time" data-toggle="tooltip" data-placement="bottom" title="上传时间" data-original-title=""><i class="glyphicon glyphicon-time"></i><fmt:formatDate value="${file.cjsj}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
	  </span> 
	  <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="下载积分"><i class="glyphicon glyphicon-shopping-cart"></i>${file.filePoint}</a></span>
	  <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="下载次数"><i class="glyphicon glyphicon-download-alt"></i>${file.res01}</a></span>
	  <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="评论量"><i class="glyphicon glyphicon-comment"></i> ${file.res03}</span> </div>

  </header>
  <article class="article-content">
	${file.fileDescript}
	
  </article>
  <hr>
  <br>
  
  <c:forEach items="${replyNoteList}" var="replyNoteList">
  <article class="article-content">
  	<time class="time" data-toggle="tooltip" data-placement="bottom" title="" data-original-title=""><i class="glyphicon glyphicon-time"></i><fmt:formatDate value="${replyNoteList.replyDate}" pattern="yyyy-MM-dd HH:mm:ss"/> <p>由${replyNoteList.res01 }回复:</p>
  	<p>${replyNoteList.replyContains }</p></time>
  </article>
  <hr>
  </c:forEach>
  
  
  
  
  <div class="title" id="comment">
	<h3>评论</h3>
	<h3 style="float:right"><font size="2px" color="blue"><a href="javaScript:downloadFile('${file.filePoint}','${user.userId }','${user.userPoint }','${file.fileUrl }','${file.fileId }','${file.res01 }')">点击下载</a></font></h3>
  </div>
  <div id="respond">
		<form id="comment-form" name="comment-form" action="${pageContext.request.contextPath}/note/replySave.do" method="POST">
			<div class="comment">
				<input name="res02"  type="hidden" value="${file.fileId}">
				<input name="userId"  type="hidden" value="${user.userId}">
				<input name="sfFile"  type="hidden" value="yes">
				<div class="comment-box">
					<textarea placeholder="您的评论或留言（必填）" name="replyContains" id="replyContains" cols="100%" rows="3" tabindex="3"></textarea>
					<div class="comment-ctrl">
						<div class="comment-prompt" style="display: none;"> <i class="fa fa-spin fa-circle-o-notch"></i> <span class="comment-prompt-text">评论正在提交中...请稍后</span> </div>
						<div class="comment-success" style="display: none;"> <i class="fa fa-check"></i> <span class="comment-prompt-text">评论提交成功...</span> </div>
						<input type="button" value="评论" onclick="checkForm()" name="comment-submit" id="comment-submit" tabindex="4">
					</div>
				</div>
			</div>
		</form>
		
	</div>
</div>
</div>
</section> 



</body>
</html>
