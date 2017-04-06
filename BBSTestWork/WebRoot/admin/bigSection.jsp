<%@ page contentType="text/html; charset=UTF-8" import="java.util.*" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/xcConfirm.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/style.css"/>
        <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<title>Insert title here</title>
<script language="JavaScript" type="text/JavaScript">

function check(){
var form = document.getElementById("add");
var bigSectionName =$("#bigSectionName").val();
var bigSectionDescript =$("#bigSectionDescript").val();
if(bigSectionName==""||bigSectionDescript==''){
  window.wxc.xcConfirm("请将信息填写完整！", window.wxc.xcConfirm.typeEnum.info);
return false;
}
form.submit();
}

function dele(){
var check = document.getElementsByName("check");
for(var i=0;i<check.length;i++){
if(check[i].checked){
idAll+=check[i].value+",";}

}
if(idAll==""){
   alert("请选择");
}else{
   window.location.href="big_deleteAllsort.action?idAll="+idAll;
   }
   }
   
function deleteBigsort(bsid){
   
   }
function updateBigsort(bsid){
   
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
<body><br>
		<form:form id="searchForm" modelAttribute="BbsBigSection" action="" method="post" class="" style="margin-bottom: 0px;">
				<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
				<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		</form:form>
		   <div style="text-align:center;">
			  <form id="add" action="bigSection.do" method="post" enctype="multipart/form-data">
		                               版块名：<input type="text" id="bigSectionName" name="bigSectionName">
		                              版块描述：<input type="text" id="bigSectionDescript" name="bigSectionDescript">
		         <input type="button" onclick="check()" value="增加版块">
		      </form>
		   </div><br><br>
		  <div>

		 <table class="table" width="800px" align="center"  style="text-align: center;">
			       <thead>
				       <tr>				    				
						    <th>编号</th>
						    <th>版块名称</th>
						    <th>描述</th>
						    <th>操作</th>
				       </tr>
			       </thead>
			       <tbody>

<c:forEach items="${page.list}" var="bigSectionList">
<tr class="alter">
<td>${bigSectionList.bigSectionId}</td>
<td><input type="text" style="border:0px" value="${bigSectionList.bigSectionName}" id="bsname${bigSectionList.bigSectionId}"></td>
<td><input type="text" style="border:0px"  value="${bigSectionList.bigSectionDescript}" id="bsname${bigSectionList.bigSectionId}"></td>
<td><input type="button" onclick="deleteBigsort('${bigSectionList.bigSectionId}')" value="删除">
    <input type="button" onclick="updateBigsort('${bigSectionList.bigSectionId}')" value="保存"></td>
</tr>
</c:forEach>
		</tbody>
       </table>
         <div class="pagination">${page}</div>
</div>


</body>
</html>
