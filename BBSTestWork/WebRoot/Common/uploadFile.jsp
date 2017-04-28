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
	<style type="text/css">
/*公用*/
body { font-family: microsoft yahei, Arial;color: #434141; font-size: 12px;  margin:0; padding:0;    }
input, label, select, option, textarea, button, fieldset, legend { font-family: microsoft yahei, Arial;color: #434141; font-size: 12px;    }
</style>
<style>  
 *{margin:0;padding:0;}
 body{margin:0px 0px 0px 0px;}
 .upload1{position:relative;width:65%;height:10px;}
 .ipt_text{width:174px;height:19px;line-height:24px;padding:2px;border:1px solid #aaa;}  
 .btn{width:70px;height:30px;line-height:30px;border:1px solid #aaa;}  
 .upload_file1{position:absolute;left:0;top:0;width:540px;height:45px;line-height:30px;opacity:0;filter:alpha(opacity:0);}  
  .ss{width:100%;overflow:hidden;margin-left:20px}
 .ss li{width:23%;list-style-type:none;display:inline-block;position:relative;}
  .ss li a{margin-left:0px 0px 0px 0px;position:absolute} 
 </style>  
<!--<script type="text/javascript">
 function checkForm(){
	if($("#fileName").val()=='') {
	    window.parent.alertFunction("请填写文件名称！");
		return false;
	}
	if($("#fileDescript").val()=='') {
	   window.parent.alertFunction("请填写文件描述！");
		return false;
	}
    if($("#fileName").val()=='') {
	   window.parent.alertFunction("请选择文件！");
		return false;
	}
	$("#comment-form").submit();
	window.parent.alertFunction("上传成功，等待管理员审核。。。");
} 
</script>
-->
 </style>  
<script type="text/javascript">


  function uploadFile(){
    if('${user.userName}'=='') {
	    window.parent.alertFunction("请先登录！");
		return false;
	}
   if($("#fileName").val()=='') {
	    window.parent.alertFunction("请填写文件名称！");
		return false;
	}
	if($("#fileDescript").val()=='') {
	   window.parent.alertFunction("请填写文件描述！");
		return false;
	}
	if(document.getElementById("file_text").value==""){
    	 window.parent.alertFunction("请选择文件！");
    	return false;   
    }
    	f=document.all.upload.value; 
  	if(f=="")return false;   
    var index1 = f.lastIndexOf("\\");
    var index2 = f.lastIndexOf("/");
    if(index1!=-1){
        f = f.substring(index1+1);
    }else if (index2!=-1){
        f = f.substring(index2+1);
    }
  	if(f.length>=80) {
  	   window.parent.alertFunction("文件名称超过五十个字符!");
    	return false;   
  	}
  	var index3 = f.lastIndexOf(".");
  
  	var ext = f.substring(index3+1);
  	
 	$("#comment-form").submit();
	window.parent.alertFunction("上传成功，等待管理员审核。。。"); 
  }  
  function showFileNames(){
	 var obj= document.getElementById("uploadId");
	 var name="";
	 for(var i=0;i<obj.files.length;i++){
         var temp = obj.files[i].name;
          name=name+temp+";";
     }
     name=name.substring(0,name.length-1);
     $("#file_text").val(name);
  } 
</script>
</head>
<body>
	   <section class="container">
<div class="content-wrap">
<div class="content">
	  <div class="title" id="comment"><br><br>
	<h3>上传您的文件</h3>
  </div>
  <div id="respond">
		<form id="comment-form" name="comment-form" action="${pageContext.request.contextPath}/file/uploadFile.do" enctype="multipart/form-data" method="POST">
			<div class="comment">
			<input type="text" id="fileName" placeholder="您的文件主题必填）" name="fileName" style="width: 790px;">
			<input type="text" id="fileDescript" placeholder="您的文件描述（必填）" name="fileDescript" style="width: 790px;">
				<div class="comment-box">
				    <input id="userId" name="userId" value="${user.userId }" type="hidden"/>
				    <table border="0" cellpadding="5" cellspacing="10" align="center" width="100%" height="100%" style="margin-left: 0px;">
 			
 			<tr></tr>
 			<tr height="20%">
 				<td align="left" width="60%">
 					<input type="text" class="ipt_text" id="file_text" style="width:100%" />  
 				</td>
 				<td>
   					<input type="button" value="浏览" style="height:28px;width:70px;" id="cb_search"/>
 				</td>
 				<td>
  					<input type="file" name="upload" id="uploadId"  class="upload_file1" size="20" onchange="showFileNames()" multiple="multiple"/>  
 				</td>
 				
 			</tr>
 			<tr>
 				<td colspan="3" style="height:35px; line-height:20px;font-size:12px; font-weight:bold;color:#05abf7; "> 
 				</td>
 			</tr>
 		</table>
					<div class="comment-ctrl">
						<input type="button" value="上传" onclick="uploadFile()" name="comment-submit" id="comment-submit" tabindex="4">
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