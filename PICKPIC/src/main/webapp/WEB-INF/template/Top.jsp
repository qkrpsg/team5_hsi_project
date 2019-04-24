<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/Bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/Top.css'/>" rel="stylesheet">
<script src="<c:url value='/Bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/mostrar_nav.js'/>"></script>
<script src="<c:url value='/js/Top.js'/>"></script>
<!--  -->
<header class="container-fluid header_top ">

	<div class="menu_all_wrap_position">
		<div class="main_menu_wrap">
			<div class="logo col-md-2">
				<a href="<c:url value='/admin/home.pic'/>"> 
					<img id="top_logo" src="<c:url value='/resources/images/pickpic_logo_white.png'/>" />
				</a>
			</div>

			<div class="menu_login_wrap col-md-10">
				<div class="menu_login_in">
					<nav class="menu_wrap col-md-9">
						<ul>
							<li class="col-md-2"></li>
							<li class="col-md-3"><a href="#">피크픽 스토리</a></li>
							<li class="col-md-3"><a href="#">피크픽 프렌즈</a></li>
							<li class="col-md-3"><a href="#">고객센터</a></li>
							<li class="col-md-1"></li>
						</ul>
					</nav>

					<div class="login_wrap col-md-3">
						<ul>
							<li><a href="<c:url value='/user/Login.pic'/>">LOGIN<span></span></a>
							<li><a href="<c:url value='#'/>">SIGN UP</a>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 모바일 용 메뉴 -->
		<div id="mobile-nav">
			<nav>
				<ul class="menu">
					<li class="l_menu_li"><a href="#">피크픽 스토리</a>
						<ul class="m_sub">
							<li><a href="<c:url value='/story/back.pic'/> "> 비전</a></li>
							<li><a href="<c:url value='/story/crewIntro.pic'/> ">크루소개</a></li>
							<li><a href="<c:url value='#'/>">사용기술</a></li>
							<li><a href="<c:url value='#'/>">다운로드</a></li>
						</ul>
					</li>

					<li class="l_menu_li"><a href="#">피크픽 프렌즈</a>
						<ul class="m_sub" style="display: none;">
						
	     					<li><a href="<c:url value='/PICKPIC/friends/Place.pic'/>">픽플레이스</a></li>
							<li><a href="<c:url value='/PICKPIC/friends/picpic.pic'/>">필터</a></li> 
							<li><a href="<c:url value='/PICKPIC/friends/route.pic'/> ">픽로드</a></li>
							<li><a href="#">앨범다운</a></li>
						</ul></li>


					<li class="l_menu_li"><a href="#">고객센터</a>
						<ul class="m_sub" style="display: none;">
							<li><a href="<c:url value='/PICKPIC/help/picktip.pic'/>">피크픽TIP</a></li>
							<li><a href="#">공지사항</a></li>
							<li><a href="#">문의사항</a></li>
							<li><a href="<c:url value='/PICKPIC/help/guide.pic'/>">초보자가이드</a></li>
						</ul></li>

					<li><a href="<c:url value='/user/Login.pic'/>">LOGIN</a>
					<li><a href="<c:url value='#'/>">SIGN UP</a>
				</ul>
			</nav>
			<!-- 모바일 용 서브 메뉴 창 -->
		</div>

		<div class="button-container-1">
			<span class="mas"></span>
			<button id='work' type="button" name="Hover"><img alt="메뉴" src="<c:url value='/resources/images/menu_icon_black.png'/>"/></button>
		</div>

		<!-- PC버전용 -->
		<div class="nav_wrap_top_position">
			<div class="nav_wrap_main">
				<div class="col-md-3"></div>
				<div class="nav_wrap col-md-2">
					<ul class="ul_submenu">
						<li><a href="<c:url value='/story/vision.pic'/> "> 비전</a></li>
						<li><a href="<c:url value='/story/crewIntro.pic'/> ">크루소개</a></li>
						<li><a href="<c:url value='#'/> ">사용기술</a></li>
						<li><a href="<c:url value='#'/> ">다운로드</a></li>
					</ul>
				</div>

				<div class="nav_wrap col-md-1">
					<ul class="ul_submenu">
						<li><a href="<c:url value='/PICKPIC/friends/Place.pic'/>">픽플레이스</a></li>
						<li><a href="<c:url value='/PICKPIC/friends/picpic.pic'/>">필터</a></li>
						<li><a href="<c:url value='/PICKPIC/friends/route.pic'/>">픽로드</a></li>
						<li><a href="#">앨범다운</a></li>
					</ul>
				</div>
            
				<div class="nav_wrap col-md-2">
					<ul class="ul_submenu">
					    <li><a href="<c:url value='/PICKPIC/help/picktip.pic'/>">피크픽TIP</a></li>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">문의사항</a></li>
						<li><a href="<c:url value='/PICKPIC/help/guide.pic'/>">초보자가이드</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- Analytics 추적 코드 -->
	<!-- Global site tag (gtag.js) - Google Analytics -->
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-138587279-1"></script>
	<script>
		window.dataLayer = window.dataLayer || [];
		function gtag() {
			dataLayer.push(arguments);
		}
		gtag('js', new Date());

		gtag('config', 'UA-138587279-1');
	</script>
</header>