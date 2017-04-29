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
   /*
   *新增
   */
   function addCheck(){
		var form = document.getElementById("add");
		var messageNnamae =$("#messageNnamae").val();
		var messageContains =$("#messageContains").val();
		if(messageNnamae==""||messageContains==''){
		  window.wxc.xcConfirm("请将信息填写完整！", window.wxc.xcConfirm.typeEnum.info);
		  return false;
		}
         form.submit();
    }
   /*
	*删除
	*/
	function deleteMessage(messageId){
	var toolStyle="delete";
	             var option = {
						title: "提示信息",
						btn: parseInt("0011",2),
						onOk: function(){
							 $.ajax({
							         type:"GET",
							         async:false,
							         url:"${pageContext.request.contextPath}/system/update.do",
							         data:{messageId:messageId,toolStyle:toolStyle},
							         success:function(){
							             window.wxc.xcConfirm("删除成功！", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
							             query();
						                         }
						                      });
						                 }
						            });
							             
							          }
							      }
							      	window.wxc.xcConfirm("确定删除该消息吗？", "custom", option); 
							    }
             

	/*
	*查询
	*/
	function query(){
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
<body><br>
		  <div style="text-align:center;">
		   <form id="add" action="${pageContext.request.contextPath}/system/insert.do" method="post" enctype="multipart/form-data">
	                               公告主题：<input type="text" id="messageNamae" name="messageNamae">
	                              公告内容：<input type="text" id="messageContains" name="messageContains">
	                              <input type="hidden" id="" name="res02" value="1">
	         <input type="button" onclick="addCheck()" value="发送">
	       </form>
		  </div>
		  <br><br>
		  
		  <div>
		    <table class="table" width="800px" align="center"  style="text-align: center;">
			       <thead>
			       <tr><td colspan="4"> 
			                <form id="searchForm"  action="${pageContext.request.contextPath}/system/findSystemMessageList.do?isAdmin=isAdmin" method="post" class="" style="margin-bottom: 0px;">
												<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
												<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
												<input id="res04" name="res04" type="text" placeholder="请输入关键字"/>
												<input type="button" onclick="query()" value="查询">
							</form>
						</td>
				   </tr>
										 
				   <tr>				    				
						    <th>公告主题</th>
						    <th>公告内容</th>
						    <th>创建时间</th>
						    <th>操作</th>
				   </tr>
			       </thead>
			       <tbody>
						<c:forEach items="${page.list}" var="systemMessageList">
							<tr class="alter">
								<td>${systemMessageList.messageNamae}</td>
								<td>${systemMessageList.messageContains}</td>
								<td><fmt:formatDate value="${systemMessageList.cjsj}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><input type="button" onclick="deleteMessage('${systemMessageList.messageId}')" value="删除">
								   </td>
							</tr>
						</c:forEach>
		          </tbody>
           </table>
         <div class="pagination">${page}</div>
         </div>
</body>
</html>
