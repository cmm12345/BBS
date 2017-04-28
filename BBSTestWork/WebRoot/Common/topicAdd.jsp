<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/xcConfirm.css"/>
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<title>Insert title here</title>
<script type="text/javascript">
function checkForm(){
	if($("#noteName").val()=='') {
	    window.parent.alertFunction("请填写帖子主题！");
		return false;
	}
	if($("#noteContains").val()=='') {
	   window.parent.alertFunction("请填写帖子内容！");
		return false;
	}

	$("#comment-form").submit();
	window.parent.alertFunction("发帖成功！积分+3");
}
</script>
</head>
<body>
	   <section class="container">
<div class="content-wrap">
<div class="content">
	  <div class="title" id="comment"><br><br>
	<h3>发表属于您的帖子</h3>
  </div>
  <div id="respond">
		<form id="comment-form" name="comment-form" action="${pageContext.request.contextPath}/note/save.do" method="POST">
			<div class="comment">
			<input type="text" id="noteName" placeholder="您的帖子主题（必填）" name="noteName" style="width: 790px;">
				<div class="comment-box">
				    <input id="userId" name="userId" value="${user.userId }" type="hidden"/>
					<input id="smallSectionId" name="smallSectionId" value="<%= request.getParameter("smallSectionId")%>" type="hidden"/>
					<input id="bigSectionId" name="bigSectionId" value="<%= request.getParameter("bigSectionId")%>" type="hidden"/>
					
					<textarea placeholder="您的帖子内容（必填）" name="noteContains" id="noteContains" cols="100%" rows="3" tabindex="3"></textarea>
					<div class="comment-ctrl">
						<div class="comment-prompt" style="display: none;"> <i class="fa fa-spin fa-circle-o-notch"></i> <span class="comment-prompt-text">评论正在提交中...请稍后</span> </div>
						<div class="comment-success" style="display: none;"> <i class="fa fa-check"></i> <span class="comment-prompt-text">评论提交成功...</span> </div>
						<input type="button" value="提交" onclick="checkForm()" name="comment-submit" id="comment-submit" tabindex="4">
					</div>
				</div>
			</div>
		</form>
		</div>
	</div>
	</div></section>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ias.js"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>