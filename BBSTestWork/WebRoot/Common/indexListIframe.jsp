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
<div class="content">
  <div id="focusslide" class="carousel slide" data-ride="carousel">
	<div class="carousel-inner" role="listbox">
	  <div class="item active">
	  <a href="#" target="_blank" title="资料论坛" >
	  <img src="${pageContext.request.contextPath}/images//201610181557196870.jpg" alt="资料论坛" class="img-responsive"></a>
	  </div>
	</div>
  
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
 
</body>
</html>
