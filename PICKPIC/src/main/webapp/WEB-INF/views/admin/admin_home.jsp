<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>Home <small></small></h1>
	</section>

	<section class="content">
		<!-- 대시보드 시작 -->
		<div class="row">
			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-aqua"><i
						class="fa fa-thumb-tack"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">신규 픽</span> <span
							class="info-box-number">10</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-red"><i class="fa fa-krw"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">신규 판매</span> <span
							class="info-box-number">30</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-green"><i class="fa fa-group"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">신규 회원</span> <span
							class="info-box-number">5</span>
					</div>
				</div>
			</div>

			<div class="col-md-3 col-sm-6 col-xs-12">
				<div class="info-box">
					<span class="info-box-icon bg-yellow"><i
						class="fa fa-newspaper-o"></i></span>
					<div class="info-box-content">
						<span class="info-box-text">신규 게시물</span> <span
							class="info-box-number">2,000</span>
					</div>
				</div>
			</div>
		</div>
		<!-- 대시보드 끝 -->
		
		
	</section>
</div>

		<!-- 목록 바디 시작 -->
		<div class="row">
			<div class="col-md-12">
				<div class="col-md-6">
					<h4 class="box-title">유저 목록</h4>
					<div class="box-body">
						<!-- 목록 버튼 시작 -->
						<div class="userbox-controls">
							<button type="button"
								class="btn btn-default btn-sm checkbox-toggle">
								<i class="fa fa-square-o"> 전체 선택</i>
							</button>
							<button type="button" class="btn btn-default btn-sm">
								<i class="fa fa-ban"> 차단</i>
							</button>
							<button type="button" class="btn btn-default btn-sm">
								<i class="fa fa-refresh"> 새로 고침</i>
							</button>
							<div class="pull-right">
								1-50/200
								<div class="btn-group">
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-chevron-left"></i>
									</button>
									<button type="button" class="btn btn-default btn-sm">
										<i class="fa fa-chevron-right"></i>
									</button>
								</div>
							</div>
						</div>
						<!-- 목록 버튼 끝 -->

						<!-- 목록데이터 : 사용자 아이디 입력 부분 -->
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th></th>
										<th>번호</th>
										<th class="">사용자</th>
										<th class="">별명</th>
										<th class="">최종로그인</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox"></td>
										<td>1</td>
										<td class=""><a href="#">사용자1</a></td>
										<td class="">별명1</td>
										<td class="">차단 됨</td>
									</tr>
									<tr>
										<td><input type="checkbox"></td>
										<td>2</td>
										<td class=""><a href="#">사용자2</a></td>
										<td class="">별명2</td>
										<td class="">2019.03.25</td>
									</tr>
									<tr>
										<td><input type="checkbox"></td>
										<td>3</td>
										<td class=""><a href="#">사용자3</a></td>
										<td class="">별명3</td>
										<td class="">활동 중...</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 목록 바디 끝 -->

					<!-- 목록 풋터 시작 -->
					<div class="box-footer">
						<button type="button"
							class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"> 전체 선택</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-ban"> 차단</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"> 새로 고침</i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>
						<!-- 목록 풋터 끝 -->
					</div>
				</div>



				<!-- 유저끝 -->
				<div class="col-md-6">

					<div class="box-header">
						<h3 class="box-title">필터 목록</h3>


						<div class="box-tools pull-right">
							<div class="has-feedback">
								<input type="text" class="form-control input-sm"
									placeholder="Search Filter"> <span
									class="glyphicon glyphicon-search form-control-feedback"></span>
							</div>
						</div>
					</div>

					<div class="box-body table-responsive">
						<button type="button"
							class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"> 전체 선택</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-spinner"> 활성/비활성</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"> 새로고침</i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>
						<table class="table table-hover table-striped">
							<thead>
								<tr>
									<th></th>
									<th>번호</th>
									<th>필터명</th>
									<th>가격</th>
									<th>상태</th>
									<th>이벤트 여부</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="checkbox"></td>
									<td>1</td>
									<td><a href="#">필터명1</a></td>
									<td>3,000</td>
									<td>판매중</td>
									<td><i class="fa fa-circle text-red"></i></td>
								<tr>
									<td><input type="checkbox"></td>
									<td>2</td>
									<td><a href="#">필터명2</a></td>
									<td>2,500</td>
									<td>판매중</td>
									<td><i class="fa fa-circle text-green"></i></td>
								<tr>
									<td><input type="checkbox"></td>
									<td>3</td>
									<td><a href="#">필터명3</a></td>
									<td>3,900</td>
									<td>판매중</td>
									<td><i class="fa fa-circle text-red"></i></td>
								</tr>
							</tbody>
						</table>
					</div>

					<div class="box-footer">
						<button type="button"
							class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"> 전체 선택</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-spinner"> 활성/비활성</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-refresh"> 새로고침</i>
						</button>
						<div class="pull-right">
							1-50/200
							<div class="btn-group">
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-right"></i>
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>