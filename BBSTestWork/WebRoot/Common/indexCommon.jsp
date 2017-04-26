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
   function alertFunction(){
    window.wxc.xcConfirm("请先登录！", window.wxc.xcConfirm.typeEnum.info);
    
   }

   function findNoteByIdFunction(noteId){
      $("#noteListIframe").attr("src","${pageContext.request.contextPath}/note/findNoteById.do?noteId="+noteId)
   }
</script>
</head>
  
<body>
<section class="container">
<div class="content-wrap">
 <iframe name="noteListIframe" id="noteListIframe" frameborder="0"  width="100%" height="200%" scrolling="yes" 
		           marginwidth="0" marginheight="0" src="${pageContext.request.contextPath}/note/findHotNoteList.do" ></iframe>

</div>
<aside class="sidebar">
<div class="fixed">
  <div class="widget widget-tabs">
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
  </div>
  <div class="widget widget_search">
	<form class="navbar-form" action="/Search" method="post">
	  <div class="input-group">
		<input type="text" name="keyword" class="form-control" size="35" placeholder="请输入关键字" maxlength="15" autocomplete="off">
		<span class="input-group-btn">
		<button class="btn btn-default btn-search" name="search" type="submit">搜索</button>
		</span> </div>
	</form>
  </div>
</div>
<div class="widget widget_hot">
	  <h3>最新评论文章</h3>
	  <ul>            
			<li><a title="用DTcms做一个独立博客网站（响应式模板）" href="#" ><span class="thumbnail">
				<img class="thumb" data-original="images/201610181739277776.jpg" src="images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）"  style="display: block;">
			</span><span class="text">用DTcms做一个独立博客网站（响应式模板）</span><span class="muted"><i class="glyphicon glyphicon-time"></i>
				2016-11-01
			</span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span></a></li>
			<li><a title="用DTcms做一个独立博客网站（响应式模板）" href="#" ><span class="thumbnail">
				<img class="thumb" data-original="images/201610181739277776.jpg" src="images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）"  style="display: block;">
			</span><span class="text">用DTcms做一个独立博客网站（响应式模板）</span><span class="muted"><i class="glyphicon glyphicon-time"></i>
				2016-11-01
			</span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span></a></li>
			<li><a title="用DTcms做一个独立博客网站（响应式模板）" href="#" ><span class="thumbnail">
				<img class="thumb" data-original="images/201610181739277776.jpg" src="images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）"  style="display: block;">
			</span><span class="text">用DTcms做一个独立博客网站（响应式模板）</span><span class="muted"><i class="glyphicon glyphicon-time"></i>
				2016-11-01
			</span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span></a></li>
			<li><a title="用DTcms做一个独立博客网站（响应式模板）" href="#" ><span class="thumbnail">
				<img class="thumb" data-original="images/201610181739277776.jpg" src="images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）"  style="display: block;">
			</span><span class="text">用DTcms做一个独立博客网站（响应式模板）</span><span class="muted"><i class="glyphicon glyphicon-time"></i>
				2016-11-01
			</span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span></a></li>
			<li><a title="用DTcms做一个独立博客网站（响应式模板）" href="#" ><span class="thumbnail">
				<img class="thumb" data-original="images/201610181739277776.jpg" src="images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）"  style="display: block;">
			</span><span class="text">用DTcms做一个独立博客网站（响应式模板）</span><span class="muted"><i class="glyphicon glyphicon-time"></i>
				2016-11-01
			</span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span></a></li>
			<li><a title="用DTcms做一个独立博客网站（响应式模板）" href="#" ><span class="thumbnail">
				<img class="thumb" data-original="images/201610181739277776.jpg" src="images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）"  style="display: block;">
			</span><span class="text">用DTcms做一个独立博客网站（响应式模板）</span><span class="muted"><i class="glyphicon glyphicon-time"></i>
				2016-11-01
			</span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span></a></li>
			<li><a title="用DTcms做一个独立博客网站（响应式模板）" href="#" ><span class="thumbnail">
				<img class="thumb" data-original="images/201610181739277776.jpg" src="images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）"  style="display: block;">
			</span><span class="text">用DTcms做一个独立博客网站（响应式模板）</span><span class="muted"><i class="glyphicon glyphicon-time"></i>
				2016-11-01
			</span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span></a></li>
			<li><a title="用DTcms做一个独立博客网站（响应式模板）" href="#" ><span class="thumbnail">
				<img class="thumb" data-original="images/201610181739277776.jpg" src="images/201610181739277776.jpg" alt="用DTcms做一个独立博客网站（响应式模板）"  style="display: block;">
			</span><span class="text">用DTcms做一个独立博客网站（响应式模板）</span><span class="muted"><i class="glyphicon glyphicon-time"></i>
				2016-11-01
			</span><span class="muted"><i class="glyphicon glyphicon-eye-open"></i>88</span></a></li>

	  </ul>
 </div>
 <div class="widget widget_sentence">    
	<a href="#" target="_blank" rel="nofollow" title="学习资料论坛" >
	<img style="width: 100%" src="images//201610241224221511.jpg" alt="学习资料论坛" ></a>    
 </div>
 <div class="widget widget_sentence">    
	<a href="#" target="_blank" rel="nofollow" title="MZ-NetBlog主题" >
	<img style="width: 100%" src="images/ad.jpg" alt="MZ-NetBlog主题" ></a>    
 </div>
<div class="widget widget_sentence">
  <h3>友情链接</h3>
  <div class="widget-sentence-link">
	<a href="#" title="网站建设" target="_blank" >学习资料论坛</a>&nbsp;&nbsp;&nbsp;
  </div>
</div>
</aside>
</section>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.ias.js"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
</body>
</html>
