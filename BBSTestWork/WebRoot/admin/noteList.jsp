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
   function setHotNote(noteId,str,noteName){
   var toolStyle="";
   if(str=='1'){
       toolStyle="setNoteHot";
   }
   if(str=='0'){
       toolStyle="returnNoteHot";
   }
          $.ajax({
		        type:"GET",
		        async:false,
		        url:"${pageContext.request.contextPath}/note/update.do",
		        data:{noteId:noteId,toolStyle:toolStyle,noteName:noteName},
		        success:function(){
		           window.wxc.xcConfirm("设置成功！", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
							             query();
	                         }
	                      });
		             }
		       });
         
   }
   
    //删除
   function deleteNote(noteId,noteName){
   var str="delete";
    var reasonStr=$("#reasonStr"+noteId).val();
    if(reasonStr==''){
         window.wxc.xcConfirm("请填写删除原因!", window.wxc.xcConfirm.typeEnum.info);
         return false;
       }
   
    var option = {
		title: "提示信息",
		btn: parseInt("0011",2),
		onOk: function(){
			 $.ajax({
			         type:"GET",
			         async:false,
			         url:"${pageContext.request.contextPath}/note/update.do",
			         data:{noteId:noteId,toolStyle:str,reasonStr:reasonStr,noteName:noteName},
			         success:function(){
			             window.wxc.xcConfirm("删除成功！", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
			             query();
		                         }
		                      });
		                 }
		            });
			             
			          }
			      }
			      	window.wxc.xcConfirm("确定删除该帖子吗？", "custom", option); 
   }
   
	/*
	*查询
	*/
	function query(){
	   $("#searchForm").submit();
	}
    function findNoteById(noteId){
      window.location.href="${pageContext.request.contextPath}/note/findNoteById.do?state=isAdmin&noteId="+noteId;
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
		    <table class="table" width="1100px" align="center"  style="text-align: center;">
			       <thead>
			       <tr><td colspan="9"> 
			                <form id="searchForm"  action="${pageContext.request.contextPath}/note/findNoteList.do?isAdmin=isAdmin" method="post" class="" style="margin-bottom: 0px;">
												<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
												<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
												<input id="res01" name="res01" type="text" placeholder="请输入关键字"/>
												<input type="button" onclick="query()" value="查询">
							</form>
						</td>
				   </tr>
										 
				   <tr>				    				
						    <th>帖子名称</th>
						    <th>帖子内容</th>
						    <th>发帖人</th>
						    <th>发帖时间</th>
						    <th>点赞数</th>
						    <th>评论数</th>
						    <th>是否热度贴</th>
						    <th>删除原因</th>
						    <th>操作</th>
				   </tr>
			       </thead>
			       <tbody>
						<c:forEach items="${page.list}" var="noteList">
							<tr class="alter">
								<td><a href="javaScript:findNoteById('${noteList.noteId}')">${noteList.noteName}</a></td>
								<td>${noteList.noteContains}</td>
								<td>${noteList.res01}</td>
								<td><fmt:formatDate value="${noteList.noteDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${noteList.noteDzs}</td>
								<td>${noteList.noteAnswerNum}</td>
								<td>
								<c:if test="${noteList.noteYnHot=='1'}">
								<input type="button" onclick="setHotNote('${noteList.noteId}','0','${noteList.noteId}')" value="取消热度贴">
								</c:if>
								<c:if test="${noteList.noteYnHot=='0'}">
								<input type="button" onclick="setHotNote('${noteList.noteId}','1','${noteList.noteId}')" value="设为热度贴">
								</c:if>
								</td>
								<td><input class="inputStyle" type="text" id="reasonStr${noteList.noteId}"></td>
								<td>
								<input type="button" onclick="deleteNote('${noteList.noteId}','${noteList.noteName}')" value="删除">
								</td>
							</tr>
						</c:forEach>
		          </tbody>
           </table>
         <div class="pagination">${page}</div>
         </div>
</body>
</html>
