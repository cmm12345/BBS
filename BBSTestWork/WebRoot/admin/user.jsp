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
	*查询
	*/
	function query(){
	   $("#searchForm").submit();
	}

   /*
	*删除
	*/
	function forbidUser(userId,userState){
	        var str="";
                 if(userState=='0'){
                    str="1";
                 }else{
                    str="0";
                 }
	             var option = {
						title: "提示信息",
						btn: parseInt("0011",2),
						onOk: function(){
							 $.ajax({
							         type:"GET",
							         async:false,
							         url:"${pageContext.request.contextPath}/user/forbidUser.do",
							         data:{userId:userId,userState:str},
							         success:function(data){
							             window.wxc.xcConfirm("操作成功！", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
							             query();
						                         }
						                      });
						                 }
						            });
							             
							          }
							      }
						        if(str=="1"){
						      	window.wxc.xcConfirm("确定禁言该用户吗？", "custom", option); 
						      	}
						      	if(str=="0"){
						      	window.wxc.xcConfirm("确定解除该用户禁言吗？", "custom", option); 
						      	}
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
		  
		  <div>
		    <table class="table" width="1000px" align="center"  style="text-align: center;">
			       <thead>
			       <tr><td colspan="10"> 
			                <form id="searchForm"  action="${pageContext.request.contextPath}/user/getAllUserList.do" method="post" class="" style="margin-bottom: 0px;">
												<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
												<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
												<input id="res01" name="res01" type="text" placeholder="请输入关键字"/>
												<input type="button" onclick="query()" value="查询">
							</form>
						</td>
				   </tr>
										 
				   <tr>				    				
						    <th>用户名</th>
						    <th>账号</th>
						    <th>出生日期</th>
						    <th>地址</th>
						    <th>联系电话</th>
						    <th>积分</th>
						    <th>角色</th>
						    <th>是否vip</th>
						    <th>用户状态</th>
						    <th>操作</th>
				   </tr>
			       </thead>
			       <tbody>
						<c:forEach items="${page.list}" var="user">
							<tr class="alter">
								<td>${user.userName}</td>
								<td>${user.userLoginnumber}</td>
								<td><fmt:formatDate value="${user.userBornDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td>${user.userAddress}</td>
								<td>${user.userLxdh}</td>
								<td>${user.userPoint}</td>
								<td><c:if test="${user.userRole=='1' }">
									版主
									</c:if>
									<c:if test="${user.userRole=='0' }">
									普通用户
									</c:if>
								</td>
								<td><c:if test="${user.userYnVip=='0' }">
									否
									</c:if>
									<c:if test="${user.userYnVip=='1' }">
									是
									</c:if>
								</td>
								<td><c:if test="${user.userState=='0' }">
									正常
									</c:if>
									<c:if test="${user.userState=='1' }">
									已禁言
									</c:if>
								</td>
								<td>
								<c:if test="${user.userRole=='0' }">
								<c:if test="${user.userState=='0' }">
								   <input type="button" id="forbid${user.userId }" onclick="forbidUser('${user.userId}','${user.userState}')" value="禁言">
								</c:if>
								<c:if test="${user.userState=='1' }">
								   <input type="button" id="noforbid${user.userId }" onclick="forbidUser('${user.userId}','${user.userState}')" value="解除禁言">
								</c:if>
								</c:if>
							</tr>
						</c:forEach>
		          </tbody>
           </table>
         <div class="pagination">${page}</div>
         </div>
</body>
</html>
