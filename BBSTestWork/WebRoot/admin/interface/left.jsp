<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="shortcut icon" href="assets/ico/favicon.ico" type="image/x-icon" />
		<link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/css/style.css" rel="stylesheet" />
		<script type="text/javascript">
		function returnIndex(){
		  window.parent.returnIndex();
		}
		</script>
	</head>
	<body>
			<div class="row">
				<!-- Sidebar -->
				<div class="sidebar">
					<div class="sidebar-collapse">
						<!-- Sidebar Header Logo-->
						<div class="sidebar-header">
							<img src="assets/img/447692r.jpg"  class="img-responsive" alt="" />
						</div>
						<!-- Sidebar Menu-->
						<div class="sidebar-menu">						
							<nav id="menu" class="nav-main" role="navigation">
								<ul class="nav nav-sidebar">
									<div class="panel-body text-center">								
										 <small><font size="4" color="blue"><c:if test="${user.userRole =='1'}">欢迎版主：</c:if>
										 <c:if test="${user.userRole =='2'}">管理员：</c:if>
										${user.userName}</font></small>
									</div>
				                    <c:if test="${user.userRole =='1'}">
									  <li>
										  <a href="${pageContext.request.contextPath}/bigSection/getAll.do" target="main">
											  <i class="fa fa-font" aria-hidden="true"></i><span>大版块管理</span>
										  </a>
									  </li>
									
									  <li>
										  <a href="${pageContext.request.contextPath}/smallSection/getAll.do" target="main">
											  <i class="fa fa-font" aria-hidden="true"></i><span>小版块管理</span>
										  </a>
									  </li>
                                                                          <li>
										  <a href="../user_getpageList.action" target="main">
											  <i class="fa fa-font" aria-hidden="true"></i><span>用户管理</span>
										  </a>
									  </li>
									  <li>
										<a href="../user_getsalepageList.action" target="main">
											<i class="fa fa-font" aria-hidden="true"></i><span>帖子管理</span>
										</a>
									  </li>
                                      <li>                                  
										  <a href='../store_getPageList.action?uid=' target="main">
											  <i class="fa fa-font" aria-hidden="true"></i><span>文件管理</span>
										  </a>
									  </li>
									  <li>
										  <a href="../../Selectconsume.jsp" target="main">
											  <i class="fa fa-font" aria-hidden="true"></i><span>系统公告</span>
										  </a>
									  </li>
                                   </c:if>
                                       <li>
										<a onclick="javascript:returnIndex()" style="cursor:pointer" >
											<i class="fa fa-font" aria-hidden="true"></i><span>返回主页</span>
										</a>
									</li>
									
							</ul>	
							</nav>	
					</div>
					
				</div></div></div></div>
		
	
		
		
	
</body>
</html>