<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/registerStyle.css">
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
<td>充值金额：<input class="aa" type="text"  id="anum"></td>
<td>
<input type="button" class="ss"  value="确定" onclick="paycheck('${user.userId}')">
</td>
</tr>
</table> 
</body>
</html>