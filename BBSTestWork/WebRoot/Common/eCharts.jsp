<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
 <script src="${pageContext.request.contextPath}/js/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/js/echarts-gl.min.js"></script>
<script src="${pageContext.request.contextPath}/js/world.js"></script>
<script type="text/javascript">

$(document).ready(function() {
  
  

});

</script>
</head>
  
<body>
     <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
    <div id="main" style="width:400px;height:180px;"></div>
    <script type="text/javascript">
    var str=new Array();
    var name=new Array();
    var ss;
    $.ajax({
	         type:"GET",
	         async:false,
	         url:"${pageContext.request.contextPath}/Common/findCensus.do",
	         success:function(data){
	         ss=data.split(",");
	         str.push(ss[0]);
	          str.push(ss[1]);
	          
                         }
                      });
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            xAxis: {
                data: ["帖子总数("+str[0]+")","文件总数("+str[1]+")"]
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: str
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</body>
</html>