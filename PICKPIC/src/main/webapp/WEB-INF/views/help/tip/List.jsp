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
					<h2>피크픽TIP</h2>
					<p>피크픽을 사용하면서 생긴 팁을 공유하세요. </p>
				</div>
			</div>
			<ol class="home_root">
				<li><a href="#">홈 /</a></li>
				<li><a href="#">고객센터 /</a></li>
				<li class="active">피크픽TIP</li>
			</ol>
		</div>
		<div class="l_help_list_wrap">

			<!-- 검색용 UI -->
			<div class="row_serch">
				<form class="form-inline" method="post" action="#">
					<div class="form-group pull-left">
						<a class="btn btn-block btn-primary btn-sm"  href="<c:url value='/help/tip/Write.pic'/>">작성하기</a>
					</div>

					<div class="form-group">
						<select name="searchColumn" class="form-control input-sm">
							<option value="title">제목</option>
							<option value="name">사용자</option>
							<option value="content">내용</option>
						</select>
					</div>

					<div class="form-group">
						<input type="text" name="searchWord" class="form-control input-sm" />
					</div>
					<button type="submit" class="btn btn-primary btn-sm">검색</button>
				</form>
			</div>

			<div class="row_list2">
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
						<td>첫번째 팁입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>2</td>
						<td><span class="label label-danger">new</span></td>
						<td>두번째 팁입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="label label-danger">new</span></td>
						<td>세번째 팁입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>4</td>
						<td></td>
						<td>지난주 팁입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>5</td>
						<td></td>
						<td>지난주 팁입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>6</td>
						<td></td>
						<td>지난주 팁입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>7</td>
						<td></td>
						<td>지난주 팁입니다.</td>
						<td>2019-04-22</td>
						<td>23</td>
					</tr>
					<tr>
						<td>8</td>
						<td></td>
						<td>지난주 팁입니다.</td>
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