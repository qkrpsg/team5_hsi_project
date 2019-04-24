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
					<h2>문의사항</h2>
					<p>피크픽에대한 문의사항을 보내주세요.</p>
				</div>
			</div>
			<ol class="home_root">
				<li><a href="#">홈 /</a></li>
				<li><a href="#">고객센터 /</a></li>
				<li class="active">문의사항</li>
			</ol>
		</div>
		<div class="l_help_list_wrap">

			<!-- 검색용 UI -->
			<div class="row_serch">
				<form class="form-inline" method="post" action="#">
					<div class="form-group pull-left">
						<button type="button" class="btn btn-block btn-success btn-sm">문의하기</button>
					</div>

					<div class="form-group">
						<select name="searchColumn" class="form-control input-sm">
							<option value="title">제목</option>
							<option value="date">날짜</option>
							<option value="content">내용</option>
						</select>
					</div>

					<div class="form-group">
						<input type="text" name="searchWord" class="form-control input-sm" />
					</div>
					<button type="submit" class="btn btn-primary btn-sm">검색</button>
				</form>
			</div>

			<div class="row_list">
				<table class="table table-hover table-responsive">
					<tr>
						<th>번호</th>
						<th>최신</th>
						<th>제목</th>
						<th>등록일</th>
						<th>답변등록일</th>
					</tr>
					<tr>
						<td>1</td>
						<td><span class="label label-danger">new</span></td>
						<td>내가 문의한 첫번째 문의사항입니다.</td>
						<td>2019-04-22</td>
						<td>2019-04-24</td>
					</tr>
					<tr>
						<td>2</td>
						<td><span class="label label-danger">new</span></td>
						<td>내가 문의한 두번째 문의사항입니다.</td>
						<td>2019-04-22</td>
						<td>2019-04-24</td>
					</tr>
					<tr>
						<td>3</td>
						<td><span class="label label-danger">new</span></td>
						<td>내가 문의한 세번째 문의사항입니다.</td>
						<td>2019-04-22</td>
						<td>2019-04-24</td>
					</tr>
					<tr>
						<td>4</td>
						<td></td>
						<td>내가 문의한 지난 문의사항입니다.</td>
						<td>2019-04-22</td>
						<td>2019-04-24</td>
					</tr>
					<tr>
						<td>5</td>
						<td></td>
						<td>내가 문의한 지난 문의사항입니다.</td>
						<td>2019-04-22</td>
						<td>2019-04-24</td>
					</tr>
					<tr>
						<td>6</td>
						<td></td>
						<td>내가 문의한 지난 문의사항입니다.</td>
						<td>2019-04-22</td>
						<td>2019-04-24</td>
					</tr>
					<tr>
						<td>7</td>
						<td></td>
						<td>내가 문의한 지난 문의사항입니다.</td>
						<td>2019-04-22</td>
						<td>2019-04-24</td>
					</tr>
					<tr>
						<td>8</td>
						<td></td>
						<td>내가 문의한 지난 문의사항입니다.</td>
						<td>2019-04-22</td>
						<td>2019-04-24</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="l_help_button_wrap">
			<div>
				<ul class="pagination pagination-md justify-content-center">
					<li class="page-item">
					<a class="page-link" href="#" aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span>
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
		<div class="l_help_button_wrap"></div>
	</div>
	<!-- l_pkp_sub_wrap -->
</div>
<!-- l_pkp_all_wrap -->

<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>