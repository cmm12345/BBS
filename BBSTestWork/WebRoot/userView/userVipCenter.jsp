<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <style type="text/css">
.ss {
    cursor: pointer;
    width: 100px;
    height:30px;
    margin-top: 10px;
    margin-left: 0px;
    padding: 0;
    background: #ef4300;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    border: 1px solid #ff730e;
    -moz-box-shadow:
        0 15px 30px 0 rgba(255,255,255,.25) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    -webkit-box-shadow:
        0 15px 30px 0 rgba(255,255,255,.25) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    box-shadow:
        0 15px 30px 0 rgba(255,255,255,.25) inset,
        0 2px 7px 0 rgba(0,0,0,.2);
    font-family: 'PT Sans', Helvetica, Arial, sans-serif;
    font-size: 14px;
    font-weight: 700;
    color: #fff;
    text-shadow: 0 1px 2px rgba(0,0,0,.1);
    -o-transition: all .2s;
    -moz-transition: all .2s;
    -webkit-transition: all .2s;
    -ms-transition: all .2s;
}
</style>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/xcConfirm.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
        <script src="${pageContext.request.contextPath}/js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript">
        
      $(document).ready(function() {
		   var userDate='${user.userYnVipEnddate}';
		   var ss='${user.userYnVipEnddate}';
		   var str="";
		   if(userDate!=''){
			   userDate = eval('new Date(' + userDate.replace(/\d+(?=[^]+$)/, 
			   function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) + ')');
			    var date1=new Date();
				if(-userDate.getTime()<date1.getTime()){
				str="<tr><td align='right'>欢迎您尊贵的Vip用户:<a href='javaScript:addVip()'>续费</a></td><td>您的Vip在<fmt:formatDate value='${user.userYnVipEnddate}' pattern='yyyy-MM-dd HH:mm:ss'/>截至</td></tr>";
				}else{
				str="<tr><td align='right'>您的Vip已过期，<a href='javaScript:addVip()'>续费Vip用户</a></td><td>您的Vip在<fmt:formatDate value='${user.userYnVipEnddate}' pattern='yyyy-MM-dd HH:mm:ss'/>截至</td></tr>";
				}
			}else{
			    str="<tr><td align='right'><a href='javaScript:addVip()'>成为Vip用户</a></td></tr>";
			}
			$("#vipId").append(str);
	});
	
	function addVip(){
	     $("#vipTable").show();
	}
	 //充值vip
	function changeVip(){
	   var userId='${user.userId}';
	   var pay= document.getElementsByName("pay");
	   var str="";	
	   for(var i=0;i<pay.length;i++){
			    if(pay[i].checked==true){
                      str=pay[i].value;
			    }
	   }
	   var ss="";
	   if(str==0){
	   ss=1;
	   }
	   if(str==1){
	   ss=2;
	   }
	   if(str==2){
	   ss=3;
	   }
	   if(str==3){
	   ss=6;
	   }
	   if(str==4){
	   ss=12;
	   }
	   
	   window.location.href="${pageContext.request.contextPath}/user/changeVip.do?userId="+userId+"&str="+ss;
	} 
    </script>
    </head>
<body >
            <div style="width:830px;height:130%;">
           <br><br>
            <form id="registerForm" name="registerForm"  action="${pageContext.request.contextPath}/user/insertUser.do" enctype="multipart/form-data" method="POST" >
            <table  style="width:100%;text-align:left">
            <tbody id="vipId">
               <tr><td width="40%"><input type="hidden" name="userId" value="${user.userId }"></td>
               <td width="40%"><img src="${pageContext.request.contextPath}/${user.userPicture }" width="100px" height="50px"></td>
                <td width="90" align="right"></td><td width="280">
                 </td>
               </tr>
               <tr><td></td></tr>
               <tr><td width="90" align="right">登录账号：</td><td width="280">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.userLoginnumber }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
               </tr>
                <tr>
               <td width="90" align="right">剩余积分：</td><td width="280"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.userPoint }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
               </tr>
              </tbody>
               </table>
               <br><br>
         <table id="vipTable" style="width:100%;text-align:left;display:none">
            <tbody id="">
               <tr><input type="hidden" name="userId" value="${user.userId }"></tr>
              <tr> <td width="">充值Vip</td><td><input type="button" class="ss"  value="确定" onclick="changeVip()"></td><td></td><td></td><td></td></tr>
                <tr><td width="200">1个月<input type="radio" value="0" name="pay" checked="checked"/>(10元)</td>
                <td width="200">2个月<input type="radio" value="1" name="pay"/>(20元)</td>
                 <td width="200">3个月<input type="radio" value="2" name="pay" />(30元)</td>
                 <td width="200">6个月<input type="radio" value="3" name="pay"/>(50元)</td>
                 <td width="200">12个月<input type="radio" value="4" name="pay" />(100元)</td>
               </tr>
               <tr></tr>
               <tr><td>选择支付方式</td></td>
               <td width="200px"><input type="radio" value="支付宝" name="payType" checked="checked"/><img src="${pageContext.request.contextPath}/payimage/1.png"></td>
               <td width="200px"><input type="radio" value="北京农商银行" name="payType"/><img src="${pageContext.request.contextPath}/payimage/2.png"></td>
               <td width="200px"><input type="radio" value="北京银行" name="payType"/><img src="${pageContext.request.contextPath}/payimage/3.png"></td>
              </tr>
              </tbody>
               </table>  
               
            </form>
            </div>
          
        </body>
</html>