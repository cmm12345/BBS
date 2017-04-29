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
<script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function checkLogin(noteId){
  if('${user.userName}'==''){
     window.parent.alertFunction("请先登录!");
     return false;
  }
   window.parent.findNoteByIdFunction(noteId);


}

</script>


</head>
  
<body>
<%--<div class="content">
   <div id="focusslide" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner" role="listbox">
	  <div class="item active">
	  <a href="#" target="_blank" title="资料论坛" >
	  <img src="${pageContext.request.contextPath}/images/361768.jpg" alt="资料论坛" class="img-responsive"></a>
	  </div>
	</div> --%>


<div class="content-wrap">
<div class="content">
  <div id="focusslide" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
	  <li data-target="#focusslide" data-slide-to="0" class="active"></li>
	  <li data-target="#focusslide" data-slide-to="1"></li>
	</ol>
	<div class="carousel-inner" role="listbox">
	  <div class="item active">
	  <a href="#" target="_blank" title="网络博客" >
	  <img src="${pageContext.request.contextPath}/images/361768.jpg" alt="木庄网络博客源码" class="img-responsive"></a>
	  </div>
	  <div class="item">
	  <a href="#" target="_blank" title="" >
	  <img src="${pageContext.request.contextPath}/images/801866.jpg" alt="专业网站建设" class="img-responsive"></a>
	  </div>
	</div>
	<a class="left carousel-control" href="#focusslide" role="button" data-slide="prev" rel="nofollow"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">上一个</span> </a> <a class="right carousel-control" href="#focusslide" role="button" data-slide="next" rel="nofollow"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">下一个</span> </a> </div>

  <div class="title">
	<h3>最新发布</h3>
  </div>
  <c:forEach items="${hotNoteList }" var="hotNoteList">
  <article class="excerpt excerpt-1" style="">
		<header><a class="cat" href="#" title="Blog主题" >Blog主题<i></i></a>
			<h2><a href="javaScript:checkLogin('${hotNoteList.noteId }')" title="${hotNoteList.noteName }" target="_blank" >${hotNoteList.noteName }</a>
			</h2>
		</header>
		<p class="meta">
			<time class="time"><i class="glyphicon glyphicon-time"></i><fmt:formatDate value="${hotNoteList.noteDate}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
			<span class="views"><a href="javaScript:checkLogin('${hotNoteList.noteId }')"><i class="glyphicon glyphicon-eye-open"></i></a> ${hotNoteList.noteDzs}</span>
			 <a class="comment" href="javaScript:checkLogin('${hotNoteList.noteId }')" title="评论" target="_blank" ><i class="glyphicon glyphicon-comment"></i>${hotNoteList.noteAnswerNum}</a>
		</p>
		<p class="note">${hotNoteList.noteContains}</p>
	</article>
 </c:forEach>
 </div>
 </div>
 <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>