<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/Bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/Top.css'/>" rel="stylesheet">
<script src="<c:url value='/Bootstrap/js/bootstrap.min.js'/>"></script>   
<script src="<c:url value='/js/mostrar_nav.js'/>"></script>   
<script src="<c:url value='/js/Top.js'/>"></script>

		<header class="container-fluid header_top ">
 
				<div class="menu_all_wrap_position">
				
					<div class="logo"><a href="<c:url value='/PICKPIC/admin/home.pic'/>"><img src="<c:url value='/resources/images/a1.PNG'/>" /></a></div>
					
						<div class="menu_login_wrap">
							<div class="menu_login_in">
								<nav class="menu_wrap">
									<ul>
										<li><a href="#">피크픽 스토리</a></li>
										<li><a href="#">피크픽 프렌즈</a></li>
										<li><a href="#">고객센터</a></li>
									</ul>
									
								</nav>
							 
								
								<div class="login_wrap">
									<ul>
										<li><a href="#">LOGIN<span></span></a>
										<li><a href="#">SING UP</a>
									</ul>
								</div>
						 </div>
					 
					 </div>
					 
					 <!-- 모바일 용 메뉴 -->
					 <div id="mobile-nav">
							 <nav>
								 <ul class="menu" >
								 
								 
									 <li class="l_menu_li"><a href="#">피크픽 스토리</a>
											 <ul class="m_sub" >
													 <li><a href="<c:url value='/PICKPIC/story/back.pic'/> "> 개발배경</a></li>
													 <li><a href="<c:url value='/PICKPIC/story/culture.pic'/> ">피크픽 문화</a></li>
													 <li><a href="#">팀원소개</a></li>
													 <li><a href="#">앞으로의 행보</a></li>
											 </ul>
									 </li>
									 
									 
									 <li class="l_menu_li"><a href="#">피크픽 프렌즈</a>
										 <ul class="m_sub" style="display: none;">
													 <li><a href="#">필터링</a></li>
													 <li><a href="#">명소찾아주기</a></li>
													 <li><a href="#">피크픽추천</a></li>
											 </ul>
									 </li>
									 
									 
									 <li class="l_menu_li"><a href="#">고객센터</a>
										 <ul class="m_sub" style="display: none;">
													 <li><a href="#">피크픽 이렇게 활용하세요</a></li>
													 <li><a href="#">피크픽's Pick!</a></li>
													 <li><a href="#">베스트 픽</a></li>
													 <li><a href="#">피크픽 명소찾기</a></li>
											 </ul>
									 </li>
									 
									 
									 
									 <li><a href="#">LOGIN</a>
							 <li><a href="#">SING UP</a>
									 
								 </ul>
							</nav>
							<!-- 모바일 용 서브 메뉴 창 -->
							
							
							
							
					 </div>
					 
					 <div class="button-container-1">
							 <span class="mas">Menu</span>
							 <button id='work' type="button" name="Hover">Menu</button>
						 </div>
						 
						 
					 <!-- 모바일 용 메뉴 -->
						<div class="nav_wrap_top_position">
				
						 <div class="nav_wrap_main">
									 <div class="nav_wrap">
											<ul class="ul_submenu">
											 <li><a href="<c:url value='/PICKPIC/story/back.pic'/> "> 개발배경</a></li>
													 <li><a href="<c:url value='/PICKPIC/story/culture.pic'/> ">피크픽 문화</a></li>
												 <li><a href="#">팀원소개</a></li>
												 <li><a href="#">앞으로의 행보</a></li>
											</ul>
									 </div>
			 
									 <div class="nav_wrap">
											<ul class="ul_submenu" >
												 <li><a href="#">필터링</a></li>
												 <li><a href="#">명소찾아주기</a></li>
												 <li><a href="#">피크픽추천</a></li>
											</ul>
									 </div>
			 
									 <div class="nav_wrap">
											<ul class="ul_submenu" >
												 <li><a href="#">피크픽 이렇게 활용하세요</a></li>
												 <li><a href="#">피크픽's Pick!</a></li>
												 <li><a href="#">베스트 픽</a></li>
												 <li><a href="#">피크픽 명소찾기</a></li>
											</ul>
									 </div>
			 
									 
								</div>
						</div> 
				</div>
			</header>
				





