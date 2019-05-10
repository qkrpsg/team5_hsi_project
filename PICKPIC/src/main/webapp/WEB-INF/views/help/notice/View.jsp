<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->
<link href="<c:url value='/css/Pkp.css' />" rel="stylesheet">
<link href="<c:url value='/css/Help.css' />" rel="stylesheet">

<!-- List.jsp -->
<div class="l_pkp_all_wrap">
	<div class="l_pkp_sub_wrap">

		<div class="l_help_title_wrap">
			<div class="wrapper">
				<div class="box">
					<h2>공지사항</h2>
					<p>피크픽의 새로운 소식을 전합니다.</p>
				</div>
			</div>
			<ol class="home_root">
				<li><a href="#">홈 /</a></li>
				<li><a href="#">고객센터 /</a></li>
				<li class="active">공지사항</li>
			</ol>
		</div>
		<div class="l_help_list_wrap" >
		<div class="view_wrap" style="margin-right: 20%;">
			<!-- 검색용 UI -->
			<div class="row_serch">
				<div class="btn-group" role="group" aria-label="...">
					<button type="submit" class="btn btn-defult btn-sm">이전글</button>
					<button type="submit" class="btn btn-defult btn-sm">다음글</button>
				</div>
			</div>

			<div class="inbox_wrap">
			<table class="table table-responsive">
					
						<tr>
						<td colspan="1">글번호</td>
						<td colspan="2">1</td>
						<td colspan="1">날짜</td>
						<td>2019/02/01</td>
						<td colspan="1">조회수</td>
						<td colspan="2">20</td>
						</tr>
						<tr>
						<td colspan="2">제목</td>
						<td colspan="10">메롱</td>
						
						</tr>
						<tr>
						<td colspan="12" style="padding-left: 5%;padding-right: 5%">내용이지롱~~</td>
						</tr>
						

		</table>
		</div>
			</div>
		</div>
	</div>
	<!-- l_pkp_sub_wrap -->
</div>
<!-- l_pkp_all_wrap -->

<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>