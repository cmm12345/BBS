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
function checkLogin(messageId,res03){
   window.parent.findMessageByIdFunction(messageId,res03);
}
//删除文件
function deleteMessage(messageId){
 window.parent.deleteMessage(messageId);
}
//查询
function  query(){
$("#searchForm").submit();
}

 /*
		*分页
		*/
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
		    return false;
		      }
</script>
</head>
  
<body>
<div style="display:none">
 <form id="searchForm"  action="${pageContext.request.contextPath}/system/findSystemMessageList.do?userString=${user.userId}" method="post" class="" style="margin-bottom: 0px;">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input id="res01" name="res01" type="hidden" value="${user.userId}"/>
</form>

</div>
  <div class="content">
  <c:forEach items="${page.list }" var="messageList">
  <article class="excerpt " style="">
        <c:if test="${messageList.res03==0 }">
		<header><a class="cat" href="#" title="Blog主题" ><font color="red">未读</font><i></i></a>
		</c:if>
		 <c:if test="${messageList.res03==1 }">
		<header><a class="cat" href="#" title="Blog主题" ><font color="blue">已读</font><i></i></a>
		</c:if>
			<h2><a href="javaScript:checkLogin('${messageList.messageId }','${messageList.res03 }')" title="${messageList.messageNamae}" target="_blank" >${messageList.messageNamae}</a>
			</h2>
		</header>
		<p class="meta">
			<time class="time"><i class="glyphicon glyphicon-time"></i><fmt:formatDate value="${messageList.cjsj}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
		</p>
		<p class="note" style="width:20px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">${messageList.messageContains}</p>
	<a href="javaScript:deleteMessage('${messageList.messageId}')">删除</a>
	 
	</article>
 </c:forEach>
  <div style="margin-left:20px" class="pagination">${page}</div>
  </div>
</body>
</html>
