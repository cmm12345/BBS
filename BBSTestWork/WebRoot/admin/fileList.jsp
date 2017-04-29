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
   //审核||保存
   function updateFile(fileId,userId,fileName){
   var filePoint=$("#fpoint"+fileId).val();
   var str="update";
       if(filePoint==''){
         window.wxc.xcConfirm("请填写文件积分!", window.wxc.xcConfirm.typeEnum.info);
         return false;
       }
          $.ajax({
		        type:"GET",
		        async:false,
		        url:"${pageContext.request.contextPath}/file/update.do",
		        data:{fileId:fileId,filePoint:filePoint,userId:userId,toolStyle:str,fileName:fileName},
		        success:function(){
		           window.wxc.xcConfirm("审核成功！", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
							             query();
	                         }
	                      });
		             }
		       });
         
   }
   
    //删除
   function deleteFile(fileId){
   var str="delete";
    var option = {
		title: "提示信息",
		btn: parseInt("0011",2),
		onOk: function(){
			 $.ajax({
			         type:"GET",
			         async:false,
			         url:"${pageContext.request.contextPath}/file/update.do",
			         data:{fileId:fileId,toolStyle:str},
			         success:function(){
			             window.wxc.xcConfirm("删除成功！", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
			             query();
		                         }
		                      });
		                 }
		            });
			             
			          }
			      }
			      	window.wxc.xcConfirm("确定删除该文件吗？", "custom", option); 
   }
   
   //审核不通过
   function returnFile(fileId,userId,fileName){
   var str="return";
   var reasonStr=$("#reasonStr"+fileId).val();
    if(reasonStr==''){
         window.wxc.xcConfirm("请填写退回原因!", window.wxc.xcConfirm.typeEnum.info);
         return false;
       }
    var option = {
		title: "提示信息",
		btn: parseInt("0011",2),
		onOk: function(){
			 $.ajax({
			         type:"GET",
			         async:false,
			         url:"${pageContext.request.contextPath}/file/update.do",
			         data:{fileId:fileId,toolStyle:str,fileName:fileName,reasonStr:reasonStr,userId:userId},
			         success:function(){
			             window.wxc.xcConfirm("退回成功！", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
			             query();
		                         }
		                      });
		                 }
		            });
			             
			          }
			      }
			      	window.wxc.xcConfirm("确定退回该文件吗？", "custom", option); 
   }
	/*
	*查询
	*/
	function query(){
	   $("#searchForm").submit();
	}
    function findFileByIdFunction(fileId){
      var userString='${user.userId}';
      window.location.href="${pageContext.request.contextPath}/file/findFileById.do?state=isAdmin&fileId="+fileId+"&userString="+userString;
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
		  <br><br>
		  
		  <div>
		    <table class="table" width="1000px" align="center"  style="text-align: center;">
			       <thead>
			       <tr><td colspan="8"> 
			                <form id="searchForm"  action="${pageContext.request.contextPath}/file/findFileList.do?isAdmin=isAdmin" method="post" class="" style="margin-bottom: 0px;">
												<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
												<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
												<input id="res04" name="res04" type="text" placeholder="请输入关键字"/>
												<input type="button" onclick="query()" value="查询">
							</form>
						</td>
				   </tr>
										 
				   <tr>				    				
						    <th>文件名称</th>
						    <th>文件描述</th>
						    <th>创建时间</th>
						    <th>文件积分</th>
						    <th>下载次数</th>
						    <th>评论次数</th>
						    <th>退回原因</th>
						    <th>操作</th>
				   </tr>
			       </thead>
			       <tbody>
						<c:forEach items="${page.list}" var="fileList">
							<tr class="alter">
								<td><a href="javaScript:findFileByIdFunction('${fileList.fileId}')">${fileList.fileName}</a></td>
								<td>${fileList.fileDescript}</td>
								<td><fmt:formatDate value="${fileList.cjsj}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><input class="inputStyle" type="text" style="border:0px" value="${fileList.filePoint}" id="fpoint${fileList.fileId}"></td>
								<td>${fileList.res01}</td>
								<td>${fileList.res03}</td>
								<td><input class="inputStyle" type="text" id="reasonStr${fileList.fileId}"></td>
								<td>
								<!-- 未审核 -->
								<c:if test="${fileList.res02=='0'}">
								<input type="button" onclick="updateFile('${fileList.fileId}','${fileList.userId}','${fileList.fileName}')" value="审核">
								<input type="button" onclick="returnFile('${fileList.fileId}','${fileList.userId}','${fileList.fileName}')" value="退回">
								</c:if>
								<c:if test="${fileList.res02=='1'}">
								<input type="button" onclick="deleteFile('${fileList.fileId}')" value="删除">
								</c:if>
								    </td>
							</tr>
						</c:forEach>
		          </tbody>
           </table>
         <div class="pagination">${page}</div>
         </div>
</body>
</html>
