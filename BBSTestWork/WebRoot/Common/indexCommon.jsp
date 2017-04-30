<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
   function alertFunction(str){
    window.wxc.xcConfirm(str, window.wxc.xcConfirm.typeEnum.info);
    
   }
   function confirmFunction(str,url,fileId){
      var option = {
		title: "提示信息",
		btn: parseInt("0011",2),
		onOk: function(){
			     window.location.href=url;  
			      }
			      }
       window.wxc.xcConfirm(str, "custom", option); 
   }
   //删帖
   function deleteNote(noteId){
     var option = {
		title: "提示信息",
		btn: parseInt("0011",2),
		onOk: function(){
			 $.ajax({
			         type:"GET",
			         async:false,
			         url:"${pageContext.request.contextPath}/note/userDelete.do",
			         data:{noteId:noteId},
			         success:function(){
			             window.wxc.xcConfirm("删除成功！", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
			            window.noteListIframe.window.query();
		                         }
		                      });
		                 }
		            });
			             
			          }
			      }
			      	window.wxc.xcConfirm("确定删除该帖子吗？", "custom", option); 
			      	}
//删除文件
   function deleteFile(fileId){
     var option = {
		title: "提示信息",
		btn: parseInt("0011",2),
		onOk: function(){
			 $.ajax({
			         type:"GET",
			         async:false,
			         url:"${pageContext.request.contextPath}/file/delete.do",
			         data:{fileId:fileId},
			         success:function(){
			             window.wxc.xcConfirm("删除成功！", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
			            window.noteListIframe.window.query();
		                         }
		                      });
		                 }
		            });
			             
			          }
			      }
			      	window.wxc.xcConfirm("确定删除该文件吗？", "custom", option); 
			      	}	
//删除系统消息
function deleteMessage(messageId){
var userString='${user.userId}';
     var option = {
		title: "提示信息",
		btn: parseInt("0011",2),
		onOk: function(){
			 $.ajax({
			         type:"GET",
			         async:false,
			         url:"${pageContext.request.contextPath}/system/deleteMessage.do",
			         data:{messageId:messageId,userString:userString},
			         success:function(){
			             window.wxc.xcConfirm("删除成功！", window.wxc.xcConfirm.typeEnum.success,{onOk:function(v){
			            window.noteListIframe.window.query();
		                         }
		                      });
		                 }
		            });
			             
			          }
			      }
			      	window.wxc.xcConfirm("确定删除该消息吗？", "custom", option); 
			      	}	
	//查看帖子详情		      			      	
   function findNoteByIdFunction(noteId){
   var userString='${user.userId}';
      $("#noteListIframe").attr("src","${pageContext.request.contextPath}/note/findNoteById.do?noteId="+noteId+"&userString="+userString);
   }
   //查看文件详情
   function findFileByIdFunction(fileId){
   var userString='${user.userId}';
      $("#noteListIframe").attr("src","${pageContext.request.contextPath}/file/findFileById.do?fileId="+fileId+"&userString="+userString);
   }
   //查看系统消息
   function findMessageByIdFunction(messageId,res03){
   var userString='${user.userId}';
      $("#noteListIframe").attr("src","${pageContext.request.contextPath}/system/findMessageById.do?messageId="+messageId+"&userString="+userString+"&res03="+res03);
   }
   //搜索
   function searchList(str){
       var searchContains=$("#searchContains").val();
        if(searchContains==''){
           alertFunction("请输入搜索内容！");
           return false;
           }
       if(str=='noteList'){
         $("#noteListIframe").attr("src","${pageContext.request.contextPath}/note/findNoteList.do?res01="+searchContains);  
       }else{
           if('${user.userName}'==''){
           alertFunction("请先登录！");
           return false;
           }
       $("#noteListIframe").attr("src","${pageContext.request.contextPath}/file/findFileList.do?res04="+searchContains);
       
       }
   
   }
</script>
</head>
  
<body>
<section class="container">
<div class="content-wrap">
 <iframe name="noteListIframe" id="noteListIframe" frameborder="0"  width="100%" height="160%" scrolling="yes" 
		           marginwidth="0" marginheight="0" src="${pageContext.request.contextPath}/note/findHotNoteList.do" ></iframe>

</div>
<aside class="sidebar">
<div class="fixed">



<!--   <div class="widget widget-tabs">
	<ul class="nav nav-tabs" role="tablist">
	  <li role="presentation" class="active"><a href="#notice" aria-controls="notice" role="tab" data-toggle="tab" >统计信息</a></li>
	  <li role="presentation"><a href="#contact" aria-controls="contact" role="tab" data-toggle="tab" >联系站长</a></li>
	</ul>
	<div class="tab-content">
	  <div role="tabpanel" class="tab-pane contact active" id="notice">
		<h2>日志总数:
			  888篇
		  </h2>
		  <h2>网站运行:
		  <span id="sitetime">88天 </span></h2>
	  </div>
		<div role="tabpanel" class="tab-pane contact" id="contact">
		  <h2>QQ:
			  <a href="" target="_blank" rel="nofollow" data-toggle="tooltip" data-placement="bottom" title=""  data-original-title="QQ:"></a>
		  </h2>
		  <h2>Email:
		  <a href="#" target="_blank" data-toggle="tooltip" rel="nofollow" data-placement="bottom" title=""  data-original-title="#"></a></h2>
	  </div>
	</div>
  </div> -->
  
  
  
  
  <div class="widget widget_search">
	<form class="navbar-form" action="/Search" method="post">
	  <div class="input-group">
		<input type="text" name="searchContains" id="searchContains"  class="form-control" size="35" placeholder="请输入关键字" maxlength="15" autocomplete="off">
		<span class="input-group-btn">
		<input type="button" class="btn btn-default btn-search" name="search" onclick="searchList('noteList')"  value="搜索帖子">
		<input type="button" class="btn btn-default btn-search" name="search" onclick="searchList('fileList')" value="搜索文件">
		</span> </div>
	</form>
  </div>
</div>
<div class="widget widget_hot">
	  <h3>最新上传文件</h3>
	  <iframe name="fileListIframe" id="fileListIframe" frameborder="0"  width="200%" height="86%" scrolling="yes" 
		           marginwidth="0" marginheight="0" src="${pageContext.request.contextPath}/file/findHotFileList.do" ></iframe>
	  
 </div>
 <div class="widget widget_sentence">    
	<a href="#" target="_blank" rel="nofollow" title="学习资料论坛" >
	<img style="width: 100%" src="${pageContext.request.contextPath}/images/1112857.jpg" alt="学习资料论坛" ></a>    
 </div>
<div class="widget widget_sentence">
  <h3>友情链接</h3>
  <div class="widget-sentence-link">
	<a href="https://www.baidu.com/" title="网站建设" target="_blank" >学习资料论坛</a>&nbsp;&nbsp;&nbsp;
  </div>
</div>
</aside>
</section>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ias.js"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>
