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
		var bigSectionName =$("#bigSectionName").val();
		var bigSectionDescript =$("#bigSectionDescript").val();
		if(bigSectionName==""||bigSectionDescript==''){
		  window.wxc.xcConfirm("请将信息填写完整！", window.wxc.xcConfirm.typeEnum.info);
		  return false;
		}
		 $.ajax({
               type:"GET",
               async:false,
               url:"${pageContext.request.contextPath}/bigSection/findListByName.do",
               data:{bigSectionName:bigSectionName},
               success:function(data){
                      if('该版块已存在！'==data){
                            window.wxc.xcConfirm("该版块已存在！", window.wxc.xcConfirm.typeEnum.info);
                            return false;
                      }else{
                         form.submit();
                      }
              }
        });
    }
    /*
    *保存
    */
    function updateBigSection(bigSectionId){
        var bigSectionName =$("#bsname"+bigSectionId).val();
        var bigSectionDescript =$("#descript"+bigSectionId).val();
		if(bigSectionName==""||bigSectionDescript==''){
		  window.wxc.xcConfirm("请将信息填写完整！", window.wxc.xcConfirm.typeEnum.info);
		  return false;
		}
		 $.ajax({
               type:"GET",
               async:false,
               url:"${pageContext.request.contextPath}/bigSection/findListByName.do",
               data:{bigSectionName:bigSectionName},
               success:function(data){
                      if('该版块已存在！'==data){
                            window.wxc.xcConfirm("该版块已存在！", window.wxc.xcConfirm.typeEnum.info);
                            return false;
                      }else{
                        $.ajax({
					        type:"GET",
					        async:false,
					        url:"${pageContext.request.contextPath}/bigSection/update.do",
					        data:{bigSectionId:bigSectionId,bigSectionName:bigSectionName,bigSectionDescript:bigSectionDescript},
					        success:function(){
					           window.wxc.xcConfirm("保存成功!", window.wxc.xcConfirm.typeEnum.success);
					             }
					       });
                      }
              }
        });
		
		
		
    }
	/*
	*查询
	*/
	function query(){
	   $("#searchForm").submit();
	}

   /*
	*删除
	*/
	function deleteBigSection(bigSectionId){
	 $.ajax({
         type:"GET",
         async:false,
         url:"${pageContext.request.contextPath}/smallSection/getList.do",
         data:{bigSectionId:bigSectionId},
         success:function(data){
             if('该版块已存在！'==data){
                window.wxc.xcConfirm("该版块下存在小版块，不能删除！", window.wxc.xcConfirm.typeEnum.info);
                return false;
             }else{
	             var option = {
						title: "提示信息",
						btn: parseInt("0011",2),
						onOk: function(){
							 $.ajax({
							         type:"GET",
							         async:false,
							         url:"${pageContext.request.contextPath}/bigSection/delete.do",
							         data:{bigSectionId:bigSectionId},
							         success:function(){
							             window.wxc.xcConfirm("删除成功！", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
							             query();
						                         }
						                      });
						                 }
						            });
							             
							          }
							      }
							      	window.wxc.xcConfirm("确定删除该记录吗？", "custom", option); 
							    }
                }
                });
             
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
		   <form id="add" action="${pageContext.request.contextPath}/bigSection/insert.do" method="post" enctype="multipart/form-data">
	                               版块名：<input type="text" id="bigSectionName" name="bigSectionName">
	                              版块描述：<input type="text" id="bigSectionDescript" name="bigSectionDescript">
	         <input type="button" onclick="addCheck()" value="增加版块">
	       </form>
		  </div>
		  <br><br>
		  
		  <div>
		    <table class="table" width="800px" align="center"  style="text-align: center;">
			       <thead>
			       <tr><td colspan="4"> 
			                <form id="searchForm"  action="${pageContext.request.contextPath}/bigSection/getAll.do" method="post" class="" style="margin-bottom: 0px;">
												<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
												<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
												<input id="res01" name="res01" type="text" placeholder="请输入关键字"/>
												<input type="button" onclick="query()" value="查询">
							</form>
						</td>
				   </tr>
										 
				   <tr>				    				
						    <th>版块名称</th>
						    <th>描述</th>
						    <th>创建时间</th>
						    <th>操作</th>
				   </tr>
			       </thead>
			       <tbody>
						<c:forEach items="${page.list}" var="bigSectionList">
							<tr class="alter">
								<td><input type="text" style="border:0px" value="${bigSectionList.bigSectionName}" id="bsname${bigSectionList.bigSectionId}"></td>
								<td><input type="text" style="border:0px"  value="${bigSectionList.bigSectionDescript}" id="descript${bigSectionList.bigSectionId}"></td>
								<td><fmt:formatDate value="${bigSectionList.cjsj}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><input type="button" onclick="deleteBigSection('${bigSectionList.bigSectionId}')" value="删除">
								    <input type="button" onclick="updateBigSection('${bigSectionList.bigSectionId}')" value="保存"></td>
							</tr>
						</c:forEach>
		          </tbody>
           </table>
         <div class="pagination">${page}</div>
         </div>
</body>
</html>
