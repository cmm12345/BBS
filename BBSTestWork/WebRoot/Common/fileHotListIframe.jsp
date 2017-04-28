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
function checkLogin(fileId){
  if('${user.userName}'==''){
     window.parent.alertFunction("请先登录！");
     return false;
  }
   window.parent.findFileByIdFunction(fileId);
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
 <form id="searchForm"  action="${pageContext.request.contextPath}/file/findFileList.do" method="post" class="" style="margin-bottom: 0px;">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
</form>

</div>
  <div class="content">
  <c:forEach items="${fileList}" var="fileList">
  <article class="excerpt " style="">
  
		<header><a class="cat" href="#" title="Blog主题" >文件主题<i></i></a>
			<h2><a href="javaScript:checkLogin('${fileList.fileId }')" title="${fileList.fileName}" target="_blank" >${fileList.fileName}</a>
			</h2>
		</header>
		<p class="meta">
			<time class="time"><i class="glyphicon glyphicon-time"></i><fmt:formatDate value="${fileList.cjsj}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
			<a class="comment" href="" title="下载积分" target="_blank" ><i class="glyphicon glyphicon-shopping-cart"></i>${fileList.filePoint}</a>
			 <a class="comment" href="" title="下载次数" target="_blank" ><i class="glyphicon glyphicon-download-alt"></i>${fileList.res01}</a>
			 <a class="comment" href="" title="评论" target="_blank" ><i class="glyphicon glyphicon-comment"></i>${fileList.res03}</a>
		</p>
		<p class="note" style="width:20px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">${fileList.fileDescript}</p>
	</article>
 </c:forEach>
  </div>
</body>
</html>
