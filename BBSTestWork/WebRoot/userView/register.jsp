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
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registerStyle.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/xcConfirm.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
        <script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
        
      $(document).ready(function() {
	});
        
        
        
        
        function registerCheck(){
        //验证填写完整
           if($("#userLoginnumber").val()==''||$("#borndate").val()==''||$("#username").val()==''||$("#userPassword").val()==''||$("#reUserPassword").val()==''||$("#userEmail").val()==''||$("#userAddress").val()==''||$("#userLxdh").val()==''||$("#questionOneAnswer").val()==''||$("#questionTwoAnswer").val()==''||$("#questionThreeAnswer").val()==''){
			   window.wxc.xcConfirm("请将信息填写完整！", window.wxc.xcConfirm.typeEnum.info);
			   return false;
           }
           //验证密码与重复密码
           if($("#userPassword").val()!=$("#reUserPassword").val()){
               window.wxc.xcConfirm("请输入一致的密码！", window.wxc.xcConfirm.typeEnum.info);
               return false;
           }
           //验证邮箱
             var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
           if(!reg.test($("#userEmail").val())){
             window.wxc.xcConfirm("请输入正确的邮箱格式！", window.wxc.xcConfirm.typeEnum.info);
               return false;
           }
           //验证电话号码
           if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test($("#userLxdh").val()))||$("#userLxdh").val().length!=11){ 
             window.wxc.xcConfirm("请输入正确的手机号！", window.wxc.xcConfirm.typeEnum.info);
               return false;
           }
         /*   $("#registerForm").submit(); */
        
        }
         /*
     *手机号验证
     */   
     function beforeLxdhRegister(){
        var userLxdh=$("#userLxdh").val();
        $.ajax({
         type:"GET",
         async:false,
         url:"${pageContext.request.contextPath}/user/beforeRegister.do",
         data:{userLxdh:userLxdh},
         success:function(data){
              var message=eval("("+data+")");
              if('该账号已注册！'==message.message){
              window.wxc.xcConfirm("该手机号已注册", window.wxc.xcConfirm.typeEnum.info);
              $("#userLxdh").val('');
              }
              }
        });
        }
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
              window.wxc.xcConfirm("该账号已注册", window.wxc.xcConfirm.typeEnum.info);
              $("#userLoginnumber").val('');
              }
              }
        });
        }
        </script>
    </head>
<body style="background:url(${pageContext.request.contextPath}/images/827970.jpg)">
        <div class="page-container">
            <form id="registerForm" name="registerForm" action="${pageContext.request.contextPath}/user/addUser.do" method="post" enctype="multipart/form-data" >
            <table style="width:100%">
               <tr><td width="90" align="right">登录账号：</td><td width="280"> <input type="text" id="userLoginnumber" name="userLoginnumber" placeholder="请输入账号" onchange="beforeRegister()"></td>
                   <td width="90" align="right"> 用户姓名：</td><td width="280"> <input type="text" id="username" name="userName" placeholder="请输入姓名"></td>
               </tr>
               <tr><td width="90" align="right">密码：</td><td width="280"><input type="password" id="userPassword"  name="userPassword"  placeholder="请输入密码"></td>
                   <td width="90" align="right">重复密码：</td><td width="280"><input type="password" id="reUserPassword"  placeholder="请输入密码">
              </tr>
               <tr><td width="90" align="right">出生日期： </td><td width="280"><input id="borndate" name="userBornDate" class="Wdate" type="text" style="height:42px"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" value=""></td>
                   <td width="90" align="right"> </td><td width="280"></td>
              </tr>
               <tr><td width="90" align="right">邮箱：</td><td width="280"><input type="text" id="userEmail"  name="userEmail"  placeholder="请输入邮箱"></td>
                   <td width="90" align="right">用户地址： </td><td width="280"><input type="text" id="userAddress" name="userAddress" placeholder="请输入地址"></td>
               </tr>
               <tr><td width="90" align="right">联系电话：</td><td width="280"><input type="text" id="userLxdh" name="userLxdh" onchange="beforeLxdhRegister()" placeholder="请输入手机号码"></td>
                   <td width="90" align="right">上传头像</td><td width="280"><input type="file"  id="myfile" name="myfile" ></td>
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
               <tr><td colspan="4" align="center"> <button type="button" onclick="registerCheck()">注册</button></td></tr> 
               </table>
               
            </form>
            <div class="connect">
                <p></p>
                <p>
                    <a class="facebook" href=""></a>
                    <a class="twitter" href=""></a>
                </p>
            </div>
        </div>
        </body>
</html>