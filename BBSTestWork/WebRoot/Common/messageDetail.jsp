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

</script>
</head>
  
<body>
   <section class="container">
<div class="content-wrap">
<div class="content">
  <header class="article-header">
	<h1 class="article-title">${bbsSystemMessage2.messageNamae}</h1>
	<div class="article-meta"> <span class="item article-meta-time">
	  <time class="time" data-toggle="tooltip" data-placement="bottom" title="上传时间" data-original-title=""><i class="glyphicon glyphicon-time"></i><fmt:formatDate value="${bbsSystemMessage2.cjsj}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
	  </span> 
  </header>
  <article class="article-content">
	${bbsSystemMessage2.messageContains}
	
  </article>
  <hr>
  <br>
  
</div>
</div>
</section> 



</body>
</html>
