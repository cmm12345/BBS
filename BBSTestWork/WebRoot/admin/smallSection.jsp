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
var bigSectionData;
var userData;
$(document).ready(function() {
      //获取大板块列表
	    $.ajax({
         type:"GET",
         async:false,
         url:"${pageContext.request.contextPath}/bigSection/findList.do",
         success:function(data){
         bigSectionData=data;
         var html="";
         for(var i=0;i<data.length;i++){
           html+="<option value='"+data[i].bigSectionId+"'>"+data[i].bigSectionName+"</option>";
           }
           $("#bigSection").append(html);
              }
        });
        
        //获取用户列表
        $.ajax({
         type:"GET",
         async:false,
         url:"${pageContext.request.contextPath}/user/getAllUser.do",
         success:function(data){
         userData=data;
         var html="";
         for(var i=0;i<data.length;i++){
           if(data[i].userRole!='2'){
               html+="<option value='"+data[i].userId+"'>"+data[i].userName+"</option>";
           }else{
              continue;
           }
         }
           $("#userId").append(html);
              }
        });
        <c:forEach items="${page.list}" var="smallSectionList">
            setAllSmallSection('${smallSectionList.smallSectionId}','${smallSectionList.bigSectionId}');
            setAllUser('${smallSectionList.smallSectionId}','${smallSectionList.userid}');
        </c:forEach>
	});
 /*
 *新增
 */
 function addCheck(){
	var form = document.getElementById("add");
	var smallSectionName =$("#smallSectionName").val();
	var smallSectionDescript =$("#smallSectionDescript").val();
	var userId=$("#userId").val();
	var bigSection=$("#bigSection").val();
	if(smallSectionName==""||smallSectionDescript==''||userId==''||bigSection==''){
	  window.wxc.xcConfirm("请将信息填写完整！", window.wxc.xcConfirm.typeEnum.info);
	  return false;
	}
	 $.ajax({
            type:"GET",
            async:false,
            url:"${pageContext.request.contextPath}/smallSection/getList.do",
            data:{smallSectionName:smallSectionName,bigSectionId:bigSection},
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
function updateSmallSection(smallSectionId,Name,uid){
      var smallSectionName =$("#smallName"+smallSectionId).val();
      var smallSectionDescript =$("#descript"+smallSectionId).val();
      var bigSection=$("#sectionId"+smallSectionId).val();
      var userId=$("#user"+smallSectionId).val();
      var bigSectionName= $("#sectionNamesectionId"+smallSectionId).val();
      var userName=$("#userNameuser"+smallSectionId).val();
		if(smallSectionName==""||smallSectionDescript==''||bigSection==''||userId==''){
		  window.wxc.xcConfirm("请将信息填写完整！", window.wxc.xcConfirm.typeEnum.info);
		  return false;
		}
		var str="";
		if(smallSectionName!=Name){
		    $.ajax({
             type:"GET",
             async:false,
             url:"${pageContext.request.contextPath}/smallSection/getList.do",
             data:{smallSectionName:smallSectionName,bigSectionId:bigSection},
             success:function(data){
             str=data;
             }
             });
		}
	       if('该版块已存在！'==str){
               window.wxc.xcConfirm("该版块已存在！", window.wxc.xcConfirm.typeEnum.info);
               return false;
            }else{
                  $.ajax({
	               type:"GET",
	               async:false,
	               url:"${pageContext.request.contextPath}/smallSection/insert.do",
	               data:{smallSectionId:smallSectionId,smallSectionName:smallSectionName,smallSectionDescript:smallSectionDescript,bigSectionName:bigSectionName,username:userName,bigSectionId:bigSection,userid:userId,res01:uid},
	               success:function(){
			                window.wxc.xcConfirm("保存成功!", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
				             query();
			                 }
			                 });
	              }
	        });
	        }  
     

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
	function deleteSmallSection(smallSectionId){
	     var option = {
			title: "提示信息",
			btn: parseInt("0011",2),
			onOk: function(){
				 $.ajax({
				         type:"GET",
				         async:false,
				         url:"${pageContext.request.contextPath}/smallSection/delete.do",
				         data:{smallSectionId:smallSectionId},
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
	   
      /*
		*分页
		*/
function page(n,s){
	$("#pageNo").val(n);
	$("#pageSize").val(s);
	$("#searchForm").submit();
    return false;
		      }
		      
function setBigSectionName(selectTag){
       //获取下拉的label的值
       var sectionName=selectTag.options[selectTag.selectedIndex ].text;
       var sectionId=selectTag.options[selectTag.selectedIndex ].value;
       $("#bigSectionName").val(sectionName);
     }
function setUserName(selectTag){
	  //获取下拉的label的值
	  var username=selectTag.options[selectTag.selectedIndex ].text
	  $("#username").val(username);
}


function setTableBigSectionName(selectTag){
       $("#sectionName"+selectTag.id).val('');
       //获取下拉的label的值
       var sectionName=selectTag.options[selectTag.selectedIndex ].text;
        $("#sectionName"+selectTag.id).val(sectionName);
     }
function setTableUserName(selectTag){
  $("#userName"+selectTag.id).val('');
	  //获取下拉的label的值
	  var username=selectTag.options[selectTag.selectedIndex ].text;
	  $("#userName"+selectTag.id).val(username);
}

function setAllSmallSection(id,bid){
       /* var opt=document.getElementById("sectionId"+id);
	   if(opt.options.length==1){ */
	        var html="";
	       for(var i=0;i<bigSectionData.length;i++){
	       if(bigSectionData[i].bigSectionId==bid){
	          continue;
	       }else{
	           html+="<option value='"+bigSectionData[i].bigSectionId+"'>"+bigSectionData[i].bigSectionName+"</option>";
	          }
	           }
 	         $("#sectionId"+id).append(html);
 	        
     }
function setAllUser(id,uid){
    /*    var opt=document.getElementById("user"+id);
       if(opt.options.length==1){
        $("#user"+id).html(''); */
         var html="";
         for(var i=0;i<userData.length;i++){
           if(userData[i].userRole!='2'&userData[i].userId!=uid){
               html+="<option value='"+userData[i].userId+"'>"+userData[i].userName+"</option>";
           }else{
              continue;
            }
           }
        $("#user"+id).append(html);
  }
</script>
</head>
<body><br>
		  <div style="text-align:center;">
		   <form id="add" action="${pageContext.request.contextPath}/smallSection/insert.do" method="post" enctype="multipart/form-data">
	          所属大板块：<select id="bigSection" name="bigSectionId" onchange="setBigSectionName(this)"><option value="">请选择...</option>
			    </select>  &nbsp;&nbsp; &nbsp; &nbsp;
			   <input type="hidden" id="bigSectionName" name="bigSectionName">
                       版主：<select id="userId" name="userid" onchange="setUserName(this)"><option value="">请选择...</option>
			    </select>  &nbsp;&nbsp; &nbsp; &nbsp;
		    <input type="hidden" id="username" name="username">                     
                       版块名：<input type="text" id="smallSectionName" name="smallSectionName"> &nbsp;&nbsp; &nbsp; &nbsp;    
                       版块描述：<input type="text" id="smallSectionDescript" name="smallSectionDescript">
        <input type="button" onclick="addCheck()" value="增加版块">
	       </form>
		  </div>
		  <br><br>
		  <div>
		    <table class="table" width="1000px" align="center"  style="text-align: center;">
			       <thead>
			       <tr><td colspan="6"> 
			                <form id="searchForm"  action="${pageContext.request.contextPath}/smallSection/getAll.do" method="post" class="" style="margin-bottom: 0px;">
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
					    <th>所属大板块</th>
					    <th>版主</th>
					    <th>创建时间</th>
					    <th>操作</th>
				   </tr>
			       </thead>
			       <tbody>
						<c:forEach items="${page.list}" var="smallSectionList">
							<tr  class="alter">
								<td><input type="text" class="inputStyle" style="border:0px" value="${smallSectionList.smallSectionName}" id="smallName${smallSectionList.smallSectionId}"></td>
								<td><input type="text" class="inputStyle" style="border:0px"  value="${smallSectionList.smallSectionDescript}" id="descript${smallSectionList.smallSectionId}"></td>
								
								<td><select style="width:100%;height:auto" id="sectionId${smallSectionList.smallSectionId}" name="bigSectionId" onchange="setTableBigSectionName(this)" >
								         <option value="${smallSectionList.bigSectionId}">${smallSectionList.bigSectionName}</option>
			                         </select> 
			                         <div style="display:none">
			                         <input type="text" id="sectionNamesectionId${smallSectionList.smallSectionId}" name="bigSectionName" value="${smallSectionList.bigSectionName}">
			                         </div>
			                         </td>
								
								<td><select style="width:100%;height:auto" id="user${smallSectionList.smallSectionId}" name="userid" onchange="setTableUserName(this)">
								             <option value="${smallSectionList.userid}">${smallSectionList.username}</option>
			                         </select> 
			                         <div style="display:none">
			                         <input type="text" id="userNameuser${smallSectionList.smallSectionId}" name="username" value="${smallSectionList.username}">
			                        </div>
			                         </td>
								
								<td><fmt:formatDate value="${smallSectionList.cjsj}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><input type="button" onclick="deleteSmallSection('${smallSectionList.smallSectionId}')" value="删除">
								    <input type="button" onclick="updateSmallSection('${smallSectionList.smallSectionId}','${smallSectionList.smallSectionName}','${smallSectionList.userid}')" value="保存"></td>
							</tr>
						</c:forEach>
		          </tbody>
           </table>
         <div class="pagination">${page}</div>
         </div>
</body>
</html>
