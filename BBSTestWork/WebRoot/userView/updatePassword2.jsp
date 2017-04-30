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
        <title>修改密码</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <style type="text/css">
        
        </style>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registerStyle.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/xcConfirm.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
        <script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
        
      $(document).ready(function() {
      if('${message}'=='修改成功'){
         window.parent.alertFunction("修改成功");
      }
	});
        function updateCheck(){
         var userId=$("#userIdStr").val();
         //验证填写完整
           if($("#newPassword").val()==''||$("#questionOneAnswer").val()==''||$("#questionTwoAnswer").val()==''||$("#questionThreeAnswer").val()==''){
			   window.parent.alertFunction("请将信息填写完整！");
			   return false;
           }
           if($("#questionOneAnswer").val()!=$("#questionOneAnswer1").val()||$("#questionTwoAnswer").val()!=$("#questionTwoAnswer1").val()||$("#questionThreeAnswer").val()!=$("#questionThreeAnswer1").val()){
              window.parent.alertFunction("问题答案不正确！");
			   return false;
           }
           if($("#newPassword").val().length<7){
           window.parent.alertFunction("请输入长度大于6的密码！");
			   return false;
           }
          window.location.href="${pageContext.request.contextPath}/user/updatePassword.do?userId="+userId+"&newPassword="+$("#newPassword").val()+"&state=find";
        }
        </script>
    </head>
<body >
            <div style="width:830px;height:130%;">
           <br><br>
            <form id="registerForm" name="registerForm"  action="" enctype="multipart/form-data" method="POST" >
            <table style="width:100%"><input id="userIdStr" type="hidden" value="<%=request.getParameter("userId") %>">
            <input id="questionOneAnswer1" type="hidden" value="<%=request.getParameter("questionOneAnswer") %>">
            <input id="questionTwoAnswer1" type="hidden" value="<%=request.getParameter("questionTwoAnswer") %>">
            <input id="questionThreeAnswer1" type="hidden" value="<%=request.getParameter("questionThreeAnswer") %>">
               <tr>
              <td width="90" align="right">新密码：</td><td width="280"> <input type="password" id="newPassword" name="newPassword" placeholder="请输入密码"></td>
              <td width="90" align="right"></td><td width="280"> </td>
               </tr>
               <tr>
                   <td width="90" align="right">问题一： </td><td width="280"><input type="text" readonly="readonly" value="您的小学老师叫什么？" name="userQuestionOne" ></td>
                   <td width="90" align="right">问题答案： </td><td width="280"><input type="text" id="questionOneAnswer"   name="questionOneAnswer" placeholder="请输入答案"></td>
               </tr>
               <tr>
                   <td width="90" align="right">问题二： </td><td width="280"><input type="text" readonly="readonly" value="您的爱好是什么？" name="userQuestionTwo" ></td>
                   <td width="90" align="right">问题答案： </td><td width="280"><input type="text" id="questionTwoAnswer"   name="questionTwoAnswer" placeholder="请输入答案"></td>
               </tr>
               <tr>
                   <td width="90" align="right">问题三： </td><td width="280"><input type="text" readonly="readonly" value="您的父亲叫什么？" name="userQuestionThree" ></td>
                   <td width="90" align="right">问题答案： </td><td width="280"><input type="text" id="questionThreeAnswer"  name="questionThreeAnswer" placeholder="请输入答案"></td>
               </tr>
               <tr><td colspan="4" align="center"> <input type="button" class="ss" onclick="updateCheck()" value="确定"></td></tr> 
               </table>
               
            </form>
            </div>
        </body>
</html>