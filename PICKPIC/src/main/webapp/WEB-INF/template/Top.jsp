<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link href="<c:url value='/Bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<link href="<c:url value='/css/Top.css'/>" rel="stylesheet">
<script src="<c:url value='/Bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/js/mostrar_nav.js'/>"></script>
<script src="<c:url value='/js/Top.js'/>"></script>

<header class="container-fluid header_top ">

	<div class="menu_all_wrap_position">
		<div class="main_menu_wrap">
			<div class="logo col-md-2">
				<a href="<c:url value='/'/>">
					<img id="top_logo" src="<c:url value='/resources/images/pickpic_logo_white.png'/>" />
				</a>
			</div>

			<div class="menu_login_wrap col-md-10">
				<div class="menu_login_in">
					<nav class="menu_wrap col-md-9">
						<ul>
							<li class="col-md-2"></li>
							<li class="col-md-3"><a
								href="<c:url value='/'/>">피크픽 스토리</a></li>
							<li class="col-md-3"><a href="#">피크픽 프렌즈</a></li>
							<li class="col-md-3"><a href="<c:url value='/friends/maptest.pic'/>">고객센터</a></li>
							<li class="col-md-1"></li>
						</ul>
					</nav>
					<div class="login_wrap col-md-3">
						<ul>
							<sec:authorize access="isAnonymous()">
								<li><a href="<c:url value='/user/Login.pic'/>">LOGIN<span></span></a></li>
								<li><a href="<c:url value='/user/sign_up.pic'/>">SIGN UP</a></li>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
								<c:if test="${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username eq 'admin' }" var="isAdmin">
									<li><a href="<c:url value='/admin/home.pic'/>"> 관리자 <span></span></a></li>
								</c:if>
								<c:if test="${not isAdmin }">
									<li><a href="<c:url value='/user/myPage.pic'/>">${sessionScope.ppa_nickname }님 <span></span></a></li>
								</c:if>
								<li><a href="javascript:logout()">Logout</a></li>
							</sec:authorize>
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
							<li><a href="<c:url value='/story/tech.pic'/>">사용기술</a></li>
							<li><a href="<c:url value='/story/appDown.pic'/>">다운로드</a></li>
						</ul></li>

					<li class="l_menu_li"><a href="#">피크픽 프렌즈</a>
						<ul class="m_sub" style="display: none;">
							<li><a href="<c:url value='/friends/place.pic'/>">픽플레이스</a></li>
							<li><a href="<c:url value='/friends/filter.pic'/>">필터</a></li>
							<li><a href="<c:url value='/friends/route.pic'/> ">픽로드</a></li>
							<li><a href="<c:url value='/friends/albumDown.pic'/>">앨범다운</a></li>
						</ul></li>

					<li class="l_menu_li"><a href="#">고객센터</a>
						<ul class="m_sub" style="display: none;">
							<li><a href="<c:url value='/help/tip.pic'/>">피크픽TIP</a></li>
							<li><a href="<c:url value='/help/notice/List.pic'/>">공지사항</a></li>
							<li><a href="<c:url value='/help/qna/List.pic'/>">문의사항</a></li>
							<li><a href="<c:url value='/help/guide.pic'/>">초보자가이드</a></li>
						</ul></li>

					<li><a href="<c:url value='/user/Login.pic'/>">LOGIN</a>
					<li><a href="<c:url value='/user/sign_up.pic'/>">SIGN UP</a>
				</ul>
			</nav>
			<!-- 모바일 용 서브 메뉴 창 -->
		</div>

		<div class="button-container-1">
			<span class="mas"></span>
			<button id='work' type="button" name="Hover">
				<img alt="메뉴"
					src="<c:url value='/resources/images/menu_icon_black.png'/>" />
			</button>
		</div>

		<!-- PC버전용 -->
		<div class="nav_wrap_top_position">
			<div class="nav_wrap_main">
				<div class="col-md-3"></div>
				<div class="nav_wrap col-md-2">
					<ul class="ul_submenu">
						<li><a href="<c:url value='/story/vision.pic'/> "> 비전</a></li>
						<li><a href="<c:url value='/story/crewIntro.pic'/> ">크루소개</a></li>
						<li><a href="<c:url value='/story/tech.pic'/>">사용기술</a></li>
						<li><a href="<c:url value='/story/appDown.pic'/> ">다운로드</a></li>
					</ul>
				</div>

				<div class="nav_wrap col-md-1">
					<ul class="ul_submenu">
						<li><a href="<c:url value='/friends/place.pic'/>">픽플레이스</a></li>
						<li><a href="<c:url value='/friends/filter.pic'/> ">필터</a></li>
						<li><a href="<c:url value='/friends/route.pic'/>">픽로드</a></li>
						<li><a href="<c:url value='/friends/albumDown.pic'/> ">앨범다운</a></li>
					</ul>
				</div>

				<div class="nav_wrap col-md-2">
					<ul class="ul_submenu">
						<li><a href="<c:url value='/help/tip.pic'/>">피크픽TIP</a></li>
						<li><a href="<c:url value='/help/notice/List.pic'/> ">공지사항</a></li>
						<li><a href="<c:url value='/help/qna/List.pic'/>">문의사항</a></li>
						<li><a href="<c:url value='/help/guide.pic'/>">초보자가이드</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

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

<script>
	//csrf사용시에만 아래 함수 필요
	function logout() {
		$('#logoutForm').submit();
	}
</script>
<!-- action 은 스프링 씨큐리티의 디폴트 로그아웃 URL지정(/logout) -->
<form id="logoutForm" method="post" action="<c:url value='/logout'/>">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>

