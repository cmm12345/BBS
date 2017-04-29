<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
        <meta charset="utf-8">
        <title>注册</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- CSS -->
        <style>  
        /*公用*/
body { font-family: microsoft yahei, Arial;color: #434141; font-size: 12px;  margin:0; padding:0;    }
input, label, select, option, textarea, button, fieldset, legend { font-family: microsoft yahei, Arial;color: #434141; font-size: 12px;    }
</style>
<style>  
 *{margin:0;padding:0;}
 body{margin:0px 0px 0px 0px;}
 .upload1{position:relative;width:10%;height:10px;}
 .ipt_text{width:222px;height:30px;line-height:24px;padding:2px;border:1px solid #aaa;}  
 .btn{width:70px;height:30px;line-height:30px;border:1px solid #aaa;}  
 .upload_file1{position:absolute;width:270px;height:33px;line-height:30px;opacity:0;filter:alpha(opacity:0);}  
  .ss{width:100%;overflow:hidden;margin-left:20px}
 .ss li{width:23%;list-style-type:none;display:inline-block;position:relative;}
  .ss li a{margin-left:0px 0px 0px 0px;position:absolute} 
 </style> 
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registerStyle.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/xcConfirm.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
        <script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
       <%
 		String filetype = "jpg|png";
	%> 
        <script type="text/javascript">
        
      $(document).ready(function() {
      
      if('${message}'=='修改成功'){
         window.parent.alertFunction("修改成功");
      }
	});
        function saveCheck(){
           //验证密码与重复密码
           if($("#userPassword").val()!=$("#reUserPassword").val()){
                window.parent.alertFunction("请输入一致的密码！");
               return false;
           }
           //验证邮箱
             var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
           if(!reg.test($("#userEmail").val())){
               window.parent.alertFunction("请输入正确的邮箱格式！");
               return false;
           }
           //验证电话号码
           if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test($("#userLxdh").val()))||$("#userLxdh").val().length!=11){ 
               window.parent.alertFunction("请输入正确的手机号！");
               return false;
           } 
         if(document.getElementById("file_text").value!=""){
           	f=document.all.upload.value; 
		  	if(f=="")return false;   
		    var index1 = f.lastIndexOf("\\");
		    var index2 = f.lastIndexOf("/");
		    if(index1!=-1){
		        f = f.substring(index1+1);
		    }else if (index2!=-1){
		        f = f.substring(index2+1);
		    }
		  	var index3 = f.lastIndexOf(".");
		  
		  	var ext = f.substring(index3+1);
		  	<% if(filetype!=null&&!filetype.equals("")){%>
				if(!/\.(<%=filetype%>)$/i.test(f)){   
				 window.parent.alertFunction("警告,文件类型必须是<%=filetype%>");
				 
				return false;   
	}
<% } %>
          }
           
            $("#registerForm").submit(); 
        
        }
         /*
     *手机号验证
     */   
     function beforeLxdhRegister(){
     var lxdh='${user.userLxdh}';
        var userLxdh=$("#userLxdh").val();
        if(lxdh!=userLxdh){
        $.ajax({
         type:"GET",
         async:false,
         url:"${pageContext.request.contextPath}/user/beforeRegister.do",
         data:{userLxdh:userLxdh},
         success:function(data){
              var message=eval("("+data+")");
              if('该账号已注册！'==message.message){
               window.parent.alertFunction("该手机号已注册");
              $("#userLxdh").val('');
              }
              }
        });
        }}
     /*
     *账号验证
     */   
     function beforeRegister(){
        var userLoginnumber=$("#userLoginnumber").val();
        $.ajax({
         type:"GET",
         async:false,
         url:"${pageContext.request.contextPath}/user/beforeRegister.do",
         data:{userLoginnumber:userLoginnumber},
         success:function(data){
         var message=eval("("+data+")");
          if('该账号已注册！'==message.message){
           window.parent.alertFunction("该账号已注册");
              $("#userLoginnumber").val('');
              }
              }
        });
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
  
  //充值
  function addPoint(){
     var userId='${user.userId}';
     window.location.href="${pageContext.request.contextPath}/userView/PayType.jsp?userId="+userId;
  }
  //修改密码、
  function updatePassword(uid){
   window.location.href="${pageContext.request.contextPath}/userView/updatePassword.jsp?userId="+uid;
  }
        </script>
    </head>
<body >
            <div style="width:830px;height:130%;">
           <br><br>
            <form id="registerForm" name="registerForm"  action="${pageContext.request.contextPath}/user/insertUser.do" enctype="multipart/form-data" method="POST" >
            <table style="width:100%;text-align:left">
               <tr><td><input type="hidden" name="userId" value="${user.userId }"></td>
               <td><img src="${pageContext.request.contextPath}/${user.userPicture }" width="100px" height="50px"></td>
                <td width="90" align="right">选择头像：</td><td width="280">
                   <input type="file" name="upload" id="uploadId"  class="upload_file1" size="20" onchange="showFileNames()" multiple="multiple"/>  
                   <input type="text" class="ipt_text" id="file_text"/>  
   					<input type="button" value="浏览" style="height:28px;width:70px;" id="cb_search"/>
                 </td>
               </tr>
               <tr><td width="90" align="right">登录账号：</td><td width="280">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.userLoginnumber }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javaScript:updatePassword('${user.userId}')">修改密码</a></td>
               </tr>
               <tr>
               <td width="90" align="right"> 用户姓名：</td><td width="280"> <input type="text" id="username" value="${user.userName }" name="userName" placeholder="请输入姓名"></td>
               </tr>
                <tr>
               <td width="90" align="right">剩余积分：</td><td width="280"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.userPoint }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javaScript:addPoint()">充值</a></td>
               </tr>
               <tr><td width="90" align="right">出生日期： </td><td width="280"><input id="borndate" name="userBornDate" value="${user.res02 }" class="Wdate" type="text" style="height:42px"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})"></td>
              </tr>
                <tr><td width="90" align="right">邮箱：</td><td width="280"><input type="text" id="userEmail" value="${user.userEmail }"  name="userEmail"  placeholder="请输入邮箱"></td>
               </tr>
               <tr>
                <td width="90" align="right">用户地址： </td><td width="280"><input type="text" id="userAddress" value="${user.userAddress }" name="userAddress" placeholder="请输入地址"></td>
               </tr>
               <tr><td width="90" align="right">联系电话：</td><td width="280"><input type="text" id="userLxdh" value="${user.userLxdh }" name="userLxdh" onchange="beforeLxdhRegister()" placeholder="请输入手机号码"></td>
                  
               </tr> 
               <tr><td colspan="4" align="left"> <button type="button" onclick="saveCheck()">保存</button></td></tr> 
               </table>
               
            </form>
            </div>
        </body>
</html>