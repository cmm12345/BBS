<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.mm {
    width: 250px;
    height: 42px;
    float:left;
    margin-top: 10px;
    padding: 0 15px;
    background: #2d2d2d; /* browsers that don't support rgba */
    background: rgba(45,45,45,.15);
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    border: 1px solid #3d3d3d; /* browsers that don't support rgba */
    border: 1px solid rgba(255,255,255,.15);
    -moz-box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;
    -webkit-box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;
    box-shadow: 0 2px 3px 0 rgba(0,0,0,.1) inset;
    font-family: 'PT Sans', Helvetica, Arial, sans-serif;
    font-size: 14px;
    color: #000000;
    text-shadow: 0 1px 2px rgba(0,0,0,.1);
    -o-transition: all .2s;
    -moz-transition: all .2s;
    -webkit-transition: all .2s;
    -ms-transition: all .2s;
}
.ss {
    cursor: pointer;
    width: 150px;
    height: 44px;
    margin-top: 10px;
    margin-left: 100px;
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
 <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
function paycheck(uid){
			var anum=$("#anum").val();
		     if(anum==""){
				 window.parent.alertFunction("请填写金额");
				 return false;
				}
			if(isNaN(anum)){
			   window.parent.alertFunction("金额应为数字");
			     return false;
	            }
	        if(anum<1){
	           window.parent.alertFunction("请输入大于0的金额");
	             return false;
	            } 
	       window.location.href="${pageContext.request.contextPath}/user/addPoint.do?userId="+uid+"&anum="+anum;
			}	
			
</script>
</head>
<body>
<table border="0px" align="left" height="500px" >
<tr height="30px"></tr>
<tr height="30px">
<td width="200px"><input type="radio" value="支付宝" name="pay" checked="checked"/><img src="${pageContext.request.contextPath}/payimage/1.png"></td>
<td width="200px"><input type="radio" value="北京农商银行" name="pay"/><img src="${pageContext.request.contextPath}/payimage/2.png"></td>
<td width="200px"><input type="radio" value="北京银行" name="pay"/><img src="${pageContext.request.contextPath}/payimage/3.png"></td>
</tr>
<tr height="50px">
<td><input type="radio" value="交通银行" name="pay"/><img src="${pageContext.request.contextPath}/payimage/4.png"></td>
</tr>
<tr height="50px">
<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;充值金额：</td><td><input class="mm" type="text"  id="anum"></td>
<td>
<input type="button" class="ss"  value="确定" onclick="paycheck('${user.userId}')">
</td>
</tr>
</table> 
</body>
</html>