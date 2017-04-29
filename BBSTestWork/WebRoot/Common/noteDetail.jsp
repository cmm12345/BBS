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
  

});
//发帖
function checkForm(){

  if('${user.userName}'==''){
     window.parent.alertFunction("请先登录！");
     return false;
  }
   var userState='${user.userState}';
     if(userState=='1'){
     window.parent.alertFunction("您被管理员禁言！不能发帖");
     return false;
     } 
  if($("#replyContains").val()==''){
     window.parent.alertFunction("请填写评论内容！");
		return false;
  }
    $("#comment-form").submit();
     window.parent.alertFunction("评论成功！积分+2");
}

function checkLogin(noteId){
  if('${user.userName}'==''){
     window.parent.alertFunction("请先登录！");
     return false;
  }
   window.parent.findNoteByIdFunction(noteId);
}

function addDzs(noteId,sfdz){
     var userId='${user.userId}';
       $.ajax({
               type:"GET",
               async:false,
               url:"${pageContext.request.contextPath}/note/addDzs.do",
               data:{userString:userId,sfdz:sfdz,noteId:noteId},
               success:function(){
               checkLogin(noteId);
/*                   $("#dzs").empty();
					var dzs1=parseInt(dzs);
					var str=dzs1+1;
					var html="<font color='red' >"+str+"</font>";
					$("#dzs").append(html);   
 */              }
        });

}

function deleteReply(replyId,noteId){
      $.ajax({
               type:"GET",
               async:false,
               url:"${pageContext.request.contextPath}/note/deleteReply.do",
               data:{replyId:replyId,noteId:noteId},
               success:function(){
               checkLogin(noteId);
         }
        });

}
</script>
</head>
  
<body>
   <section class="container">
<div class="content-wrap">
<div class="content">
  <header class="article-header">
	<h1 class="article-title">${bbsNote2.noteName}</h1>
	<div class="article-meta"> <span class="item article-meta-time">
	  <time class="time" data-toggle="tooltip" data-placement="bottom" title="" data-original-title=""><i class="glyphicon glyphicon-time"></i><fmt:formatDate value="${bbsNote2.noteDate}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
	  </span> 
	  <span class="item article-meta-source" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="网络博客"><i class="glyphicon glyphicon-globe"></i> 网络博客</span>
	  <c:if test="${bbsNote2.res03=='wdz'}" >
	  <span  class="item article-meta-views" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="点赞"><a href="javascript:addDzs('${bbsNote2.noteId}','wdz')"<i class="glyphicon glyphicon-eye-open"></i></a><span id="dzs"><font color="blue">${bbsNote2.noteDzs}</font></span></span> 
	  </c:if>
	  <c:if test="${bbsNote2.res03=='ydz'}" >
	  <span  class="item article-meta-views" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="点赞"><a href="javascript:addDzs('${bbsNote2.noteId}','ydz')"<i class="glyphicon glyphicon-eye-open"></i></a><span id="dzs"><font color="red">${bbsNote2.noteDzs}</font></span></span> 
	  </c:if>
	  <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="评论量"><i class="glyphicon glyphicon-comment"></i> ${bbsNote2.noteAnswerNum}</span> </div>
  </header>
  <article class="article-content">
	${bbsNote2.noteContains}
  </article>
  <hr>
  <br>
  
  <c:forEach items="${replyNoteList}" var="replyNoteList">
  <article class="article-content">
  	<c:if test="${bbsNote2.userId==user.userId||replyNoteList.userId==user.userId}">
  	<span id="isDelete"><a href="javascript:deleteReply('${replyNoteList.replyId}','${bbsNote2.noteId}')">删除</a></span>
  	</c:if>
  	
  	<time class="time" data-toggle="tooltip" data-placement="bottom" title="" data-original-title=""><i class="glyphicon glyphicon-time"></i><fmt:formatDate value="${replyNoteList.replyDate}" pattern="yyyy-MM-dd HH:mm:ss"/> <p>由${replyNoteList.res01 }回复:</p>
  	<p>${replyNoteList.replyContains }</p></time>
  </article>
  <hr>
  </c:forEach>
  
  
  
  
  <div class="title" id="comment">
	<h3>评论</h3>
  </div>
  <div id="respond">
		<form id="comment-form" name="comment-form" action="${pageContext.request.contextPath}/note/replySave.do" method="POST">
			<div class="comment">
				<input name="noteId"  type="hidden" value="${bbsNote2.noteId}">
				<input name="userId"  type="hidden" value="${user.userId}">
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
