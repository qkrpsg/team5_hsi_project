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
		<div class="l_help_list_wrap">
			<!-- 검색용 UI -->
			<div class="row_serch">
					
						<button type="submit" class="btn btn-primary btn-sm" onclick="location.href='<c:url value="/help/notice/Write.pic"/>'">관리자 등록</button>
			</div>

			<div class="row_list">
				<table class="table table-hover table-responsive">
					<tr>
						<th class="text-center">번호</th>
						<th class="text-center">최신</th>
						<th>제목</th>
						<th>날짜</th>
						<th class="text-center">조회수</th>
					</tr>
					<tr>
						<td>1</td>
						<td><span class="label label-danger">new</span></td>
						<td><a href="<c:url value='/help/notice/View.pic'/>">첫번째 공지사항입니다.</a></td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>2</td>
						<td><span class="label label-danger">new</span></td>
						<td>두번째 공지사항입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="label label-danger">new</span></td>
						<td>세번째 공지사항입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>4</td>
						<td></td>
						<td>지난주 공지사항입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>5</td>
						<td></td>
						<td>지난주 공지사항입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>6</td>
						<td></td>
						<td>지난주 공지사항입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>7</td>
						<td></td>
						<td>지난주 공지사항입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>8</td>
						<td></td>
						<td>지난주 공지사항입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="text-center">
				<ul class="pagination pagination-md d-flex">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- l_pkp_sub_wrap -->
</div>
<!-- l_pkp_all_wrap -->

<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>