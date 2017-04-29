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
	  <span  class="item article-meta-views" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="点赞"><i class="glyphicon glyphicon-eye-open"></i><span id="dzs"><font color="red">${bbsNote2.noteDzs}</font></span></span> 
	  <span class="item article-meta-comment" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="评论量"><i class="glyphicon glyphicon-comment"></i> ${bbsNote2.noteAnswerNum}</span> </div>
  </header>
  <article class="article-content">
	${bbsNote2.noteContains}
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
  
  
  
</div>
</section> 



</body>
</html>
