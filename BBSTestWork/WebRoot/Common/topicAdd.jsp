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
function checkForm(str){
	if($("#noteName").val()=='') {
	    window.parent.alertFunction("请填写帖子主题！");
		return false;
	}
	if($("#noteContains").val()=='') {
	   window.parent.alertFunction("请填写帖子内容！");
		return false;
	}
	if(str=='str'){
	    if($("#res04").val()==''){
	     window.parent.alertFunction("请填写悬赏积分！");
		  return false;
	    }
	    if(isNaN($("#res04").val())){
			   window.parent.alertFunction("积分应为数字");
			     return false;
	            }
	    if($("#res04").val()<0){
	           window.parent.alertFunction("请输入大于0的积分");
	             return false;
	            } 
	    if(parseInt('${user.userPoint}')<parseInt($("#res04").val())){
	     window.parent.alertFunction("对不起您的积分不足！");
		  return false;
	    }
	}
	 $("#comment-form").submit(); 
	window.parent.alertFunction("发帖成功！积分+3");
}
function redNoteForm(str){
    if($("#noteName").val()=='') {
	    window.parent.alertFunction("请填写帖子主题！");
		return false;
	}
	if($("#noteContains").val()=='') {
	   window.parent.alertFunction("请填写帖子内容！");
		return false;
	}
    if($("#res08").val()==''){
	     window.parent.alertFunction("请填写悬赏积分！");
		  return false;
    }
     if($("#res06").val()==''){
	     window.parent.alertFunction("请填写奖励楼层！");
		  return false;
    }
	if(isNaN($("#res08").val())){
			   window.parent.alertFunction("积分应为数字");
			     return false;
	}
    if(isNaN($("#res10").val())){
			   window.parent.alertFunction("红包个数应为数字");
			     return false;
	}
	if($("#res08").val()<0){
	           window.parent.alertFunction("请输入大于0的积分");
	             return false;
	 } 
	 if($("#res10").val()<0){
	           window.parent.alertFunction("请输入大于0的红包个数");
	             return false;
	 } 
	  $("#comment-form").submit(); 
	window.parent.alertFunction("发帖成功！");
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
			<c:if test="${user.userRole!=2 }">
			<input type="text" id="res04" placeholder="如果是悬赏帖，请输入积分" name="res04" style="width: 790px;">
			</c:if>
			<c:if test="${user.userRole==2 }">
			 <input type="text" id="res08" placeholder="奖励积分" name="res08" style="width: 790px;">
			 <input type="text" id="res10" placeholder="红包个数" name="res10" style="width: 790px;">
			</c:if>
				<div class="comment-box">
				    <input id="userId" name="userId" value="${user.userId }" type="hidden"/>
					<input id="smallSectionId" name="smallSectionId" value="<%= request.getParameter("smallSectionId")%>" type="hidden"/>
					<input id="bigSectionId" name="bigSectionId" value="<%= request.getParameter("bigSectionId")%>" type="hidden"/>
					<textarea placeholder="您的帖子内容（必填）" name="noteContains" id="noteContains" cols="100%" rows="3" tabindex="3"></textarea>
					<div class="comment-ctrl">
					<c:if test="${user.userRole!=2 }">
						<input type="button" style="position:relative;margin-left:550px;margin-top:17px" value="发布" onclick="checkForm('')"  id="comment-submit" >
						<input type="button" style="margin-left:600px" value="发布悬赏帖" onclick="checkForm('str')"  id="comment-submit" >
					</c:if>
					<c:if test="${user.userRole==2 }">
						<input type="button" style="margin-left:600px" value="发布红包帖" onclick="redNoteForm('')"  id="comment-submit" >
					</c:if>
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