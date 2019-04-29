<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->
<link href="<c:url value='/css/Filter.css'/>" rel="stylesheet">
<script src="<c:url value='/js/Filter.js'/>"></script>
<script src="<c:url value='/js/isotope-docs.min.js'/>"></script>


<div style="margin-top: 100px;"></div>

<div class="l_all_wrap">
	<div class="top_wrap"></div>




	<div class="container con">
		<div class="row">
			<div class="button-group filters-button-group">
				<ul>
					<button class="btn btn-info" is-checked" data-filter="*">
						<span class="nav_color"></span><a>All</a>
					</button>
					<button class="btn btn-info" data-filter=".ko">
						<span class="nav_color"></span><a>한국</a>
					</button>
					<button class="btn btn-info" data-filter=".am">
						<span class="nav_color"></span><a>미국</a>
					</button>
					<button class="btn btn-info" data-filter=".ni">
						<span class="nav_color"></span><a>일본</a>
					</button>
					<button class="btn btn-info" data-filter=".cha">
						<span class="nav_color"></span><a>중국</a>
					</button>
					<button class="btn btn-info" data-filter=".ho">
						<span class="nav_color"></span><a>호주</a>
					</button>
					<button class="btn btn-info" data-filter=".ap">
						<span class="nav_color"></span><a>아메</a>
					</button>
				</ul>
			</div>
		</div>
	</div>


	<div class="grid">
		<div class="col-xs-2 element-item img_wrap2 ko">
			<img src="<c:url value='/resources/images/main_image1.jpg' />"
				alt="안나와" />
			<div class="innerText">
				<p class="Text_title">
					<span>TITLE</span>
				</p>
				<p class="">
					<span>Lorem ipsum dolor sit amet, consectetur adipisicing
						elit, sed do eiusmod tempor incididunt ut labore et dolore magna
						aliqua.</span>
				</p>
			</div>
			<div class="hi">
				<a href="<c:url value='#'/>">필터씌우기</a>
			</div>
		</div>

		<div class="col-xs-2 element-item img_wrap2 ko">
			<img src="<c:url value='/resources/images/main_image1.jpg' />"
				alt="안나와" />
			<div class="innerText">
				<p class="Text_title">
					<span>TITLE</span>
				</p>
				<p class="">
					<span>Lorem ipsum dolor sit amet, consectetur adipisicing
						elit, sed do eiusmod tempor incididunt ut labore et dolore magna
						aliqua.</span>
				</p>
			</div>
			<div class="hi">
				<a href="<c:url value='#'/>">필터씌우기</a>
			</div>
		</div>

		<div class="col-xs-2 element-item img_wrap2 ko">
			<img src="<c:url value='/resources/images/main_image1.jpg' />"
				alt="안나와" />
			<div class="innerText">
				<p class="Text_title">
					<span>TITLE</span>
				</p>
				<p class="">
					<span>Lorem ipsum dolor sit amet, consectetur adipisicing
						elit, sed do eiusmod tempor incididunt ut labore et dolore magna
						aliqua.</span>
				</p>
			</div>
			<div class="hi">
				<a href="<c:url value='#'/>">필터씌우기</a>
			</div>
		</div>

		<div class="col-xs-2 element-item img_wrap2 ko">
			<img src="<c:url value='/resources/images/main_image1.jpg' />"
				alt="안나와" />
			<div class="innerText">
				<p class="Text_title">
					<span>TITLE</span>
				</p>
				<p class="">
					<span>Lorem ipsum dolor sit amet, consectetur adipisicing
						elit, sed do eiusmod tempor incididunt ut labore et dolore magna
						aliqua.</span>
				</p>
			</div>
			<div class="hi">
				<a href="<c:url value='#'/>">필터씌우기</a>
			</div>
		</div>

	</div>
</div>