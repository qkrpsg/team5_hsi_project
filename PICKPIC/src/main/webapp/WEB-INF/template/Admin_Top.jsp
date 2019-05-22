<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="main-header">
	<!-- Logo -->
	<a href="<c:url value='/'/>" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini"><b>PIC</b></span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>PICKPIC</b></span>
	</a>

	<!-- Header Navbar -->
	<nav class="navbar navbar-static-top" role="navigation">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> <span class="sr-only">Toggle navigation</span></a>
		<!-- Navbar Right Menu -->
		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<!-- User Account Menu -->
				<li class="dropdown user user-menu">
					<!-- Menu Toggle Button --> 
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"> 
						<!-- The user image in the navbar--> 
						<img src="<c:url value='/resources/admin_images/user_icon.png'/>" class="user-image" alt="User Image"> 
						<!-- hidden-xs hides the username on small devices so only the image appears. -->
						<span class="hidden-xs">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username }</span>
					</a>
					<ul class="dropdown-menu">
						<!-- The user image in the menu -->
						<li class="user-header">
							<img src="<c:url value='/resources/admin_images/user_icon.png'/>" class="img-circle" alt="User Image">
							<p>${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username } <small>가입일자</small></p>
						</li>
						<!-- Menu Footer-->
						<li class="user-footer">
							<a href="<c:url value='/user/myPage.pic'/>"><div class="btn-user-footer">마이페이지</div></a>
							<a href="javascript:logout()"><div class="btn-user-footer">로그아웃</div></a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!-- Analytics 추적 코드 -->
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async
		src="https://www.googletagmanager.com/gtag/js?id=UA-138587279-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-138587279-1');
	</script>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">

		<!-- Sidebar user panel (optional) -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="<c:url value='/resources/admin_images/user_icon.png'/>" class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>ADMINSTER</p>
				<p>관리자 ID</p>
			</div>
		</div>

		<!-- search form (Optional) -->
		<form action="#" method="get" class="sidebar-form">
			<div class="input-group">
				<input type="text" name="q" class="form-control" placeholder="Search..."> 
				<span class="input-group-btn">
					<button type="submit" name="search" id="search-btn" class="btn btn-flat">
						<i class="fa fa-search"></i>
					</button>
				</span>
			</div>
		</form>
		<!-- /.search form -->

		<!-- Sidebar Menu -->
		<ul class="sidebar-menu" data-widget="tree">
			<li id="home"><a href="<c:url value='/admin/home.pic'/>"><i class="fa fa-home"></i> <span>HOME</span></a></li>
			
			<li class="header">피크픽 프렌즈</li>
			<li id="users"><a href="<c:url value='/admin/users.pic'/>"><i class="fa fa-fw fa-group"></i> <span>회원관리</span></a></li>
			<li id="pickPlace"><a href="<c:url value='/admin/pickPlace.pic'/>"><i class="fa fa-map"></i> <span>픽플레이스관리</span></a></li>
			<li id="filter"><a href="<c:url value='/admin/filter.pic'/>"><i class="fa fa-clone"></i> <span>필터관리</span></a></li>
			<li id="pickRoad"><a href="<c:url value='/admin/pickRoad.pic'/>"><i class="fa fa-map-signs"></i> <span>픽로드관리</span></a></li>
			<li id="albumDown"><a href="<c:url value='/admin/albumDown.pic'/>"><i class="fa fa-navicon"></i> <span>앨범다운관리</span></a></li>
			
			<li class="header">고객센터</li>
			<li id="gonggi"><a href="<c:url value='/admin/notice.pic'/> "><span>공지사항</span> </a></li>
			<li id="qna"><a href="<c:url value='/admin/qna.pic'/>"><i class="fa fa-question"></i> <span>문의관리</span></a></li>
			<li id="report"><a href="<c:url value='/admin/report.pic'/>"><i class="fa fa-warning"></i> <span>게시물신고함</span></a></li>
			
			<li class="header">Etc</li>
			<li id="recyclebin"><a href="<c:url value='/admin/recyclebin.pic'/>"><i class="fa fa-trash-o"></i> <span>휴지통</span></a></li>
		</ul>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>

<script>
	//csrf사용시에만 아래 함수 필요
	function logout() {
		$('#logoutForm').submit();
	}
</script>
<!-- action 은 스프링 씨큐리티의 디폴트 로그아웃 URL지정(/logout) -->
<form id="logoutForm" method="post" action="<c:url value='/logout'/>">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

