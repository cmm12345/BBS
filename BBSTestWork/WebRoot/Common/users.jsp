<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
//修改用户信息
function updateUser(uid){
	 var password=document.getElementById("password").value;
	 var tel=document.getElementById("tel").value;
	 var email=document.getElementById("email").value;
	 reg = new RegExp('^[a-zA-Z0-9]+@[a-zA-Z0-9]+.[a-z][a-z.]{2,8}$');
	 if(password==""||tel==""||email==""){
		alert("请填写完整");
		return false;
     }
	 if(isNaN(tel)){
		alert("号码应为数字");
		return false;	
	 }
	 if(tel.length!=11){
		alert("号码长度应为11位");
		enable = false;
	 }
	 if(!reg.test(email)){
		alert("邮箱格式不正确");
		return false;
	 } 
	 window.location.href="user_updateUsers.action?uid="+uid+"&pwd="+password+"&tel="+tel+"&email="+email;	 
}

window.onload=function(){
     var pay= document.getElementsByName("pay");	
     pay[0].checked="checked";
}

function deletePayWay(uid) {
     var pay= document.getElementsByName("pay");	
	 if (confirm("您确定解除此银行卡的绑定吗？")) {
		 for(var i=0;i<pay.length;i++){
			 if(pay[i].checked==true){
			    window.location.href="paytype_deletePayWay.action?uid="+uid+"&ptname="+pay[i].value;
			 }
		 }	
	 }
}
</script>
<style type="text/css">
    .content{margin: 0px;}
    .left{width: 15%;float: left;}
    .right{width: 85%;float: right;}
</style>
</head>
<body>
  
</body>
</html>