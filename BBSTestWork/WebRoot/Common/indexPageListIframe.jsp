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
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/xcConfirm.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
<script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
function checkLogin(noteId,res13){
  if('${user.userName}'==''){
     window.parent.alertFunction("请先登录！");
     return false;
  }
   window.parent.findNoteByIdFunction(noteId,res13);


}
//发帖
function addNote(smallSectionId,bigSectionId){
     var userName='${user.userName}';
     var userState='${user.userState}';
     if(userName==''){
     window.parent.alertFunction("请先登录再发帖！");
     return false;
     } 
     if(userState=='1'){
     window.parent.alertFunction("您被管理员禁言！不能发帖");
     return false;
     } 
        window.location.href="${pageContext.request.contextPath}/Common/topicAdd.jsp?smallSectionId="+smallSectionId+"&bigSectionId="+bigSectionId;

}
    //删除
   function deleteNote(noteId){
  window.parent.deleteNote(noteId);
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
 <form id="searchForm"  action="${pageContext.request.contextPath}/note/findNoteList.do" method="post" class="" style="margin-bottom: 0px;">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input id="userId" name="userId" type="hidden" value="${user.userId}"/>
</form>

</div><div>
<c:if test="${bigSectionId!=null }">
<a href="javaScript:addNote('${smallSectionId}','${bigSectionId }')" style="cursur:pointer;" ><img title="发帖" style="position:fixed;margin-left:700px;margin-top:30px;width:50px;height:50px;z-index:999" src="${pageContext.request.contextPath}/images/123.jpg"></div>
</c:if>


  <div class="content">
  <c:forEach items="${page.list }" var="hotNoteList">
  <article class="excerpt " style="">
         
		<header><a class="cat" href="#" title="Blog主题" >
		<c:if test="${hotNoteList.noteYnHot==0 }">Blog主题</c:if>
		 <c:if test="${hotNoteList.noteYnHot==1 }"><font color="red">Blog主题</font></c:if>
		<c:if test="${hotNoteList.res04!=null }"><font color="red">(悬赏)</font></c:if>
		<c:if test="${hotNoteList.res08!=null }"><font color="red">(红包帖)</font></c:if>
		<c:if test="${hotNoteList.res11==1 }"><font color="red">(积分贴)</font></c:if>
		<i></i></a>
			<h2><a href="javaScript:checkLogin('${hotNoteList.noteId }','${hotNoteList.res13 }')" title="${hotNoteList.noteName }" target="_blank" >${hotNoteList.noteName }</a>
			</h2>
		</header>
		<p class="meta">
			<time class="time"><i class="glyphicon glyphicon-time"></i><fmt:formatDate value="${hotNoteList.noteDate}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
			<span class="views"><a href="javaScript:checkLogin('${hotNoteList.noteId }','${hotNoteList.res13 }')"><i class="glyphicon glyphicon-eye-open"></i></a> ${hotNoteList.noteDzs}</span>
			 <a class="comment" href="javaScript:checkLogin('${hotNoteList.noteId }','${hotNoteList.res13 }')" title="评论" target="_blank" ><i class="glyphicon glyphicon-comment"></i>${hotNoteList.noteAnswerNum}</a>
			<c:if test="${hotNoteList.res11==1 }"> <i class="glyphicon glyphicon-shopping-cart"></i>${hotNoteList.res13}</c:if>
		</p>
		<p class="note" style="width:20px;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;">${hotNoteList.noteContains}</p>
	 <c:if test="${user.userId ==hotNoteList.userId }">
	<a href="javaScript:deleteNote('${hotNoteList.noteId }')">删除</a>
	 </c:if>
	</article>
 </c:forEach>

  <div style="margin-left:20px" class="pagination">${page}</div>
  </div>
</body>
</html>
