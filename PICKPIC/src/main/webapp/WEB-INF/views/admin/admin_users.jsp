<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<!-- 여기서부터 사용자 관리 페이지 시작 -->
<div class="content-wrapper">
	<section class="content-header">
		<h1>회원 <small>224 명의 사용자</small></h1>
<!-- 		<ol class="breadcrumb"> -->
<!-- 			<li><a href="#"><i class="fa fa-dashboard"></i> 홈</a></li> -->
<!-- 			<li class="active">회원관리</li> -->
<!-- 		</ol> -->
	</section>
	
	<!-- 프로필사진+목록 통합 시작 -->
	<section class="content">
		<div class="row">
			<!-- 사용자 목록 통합 시작 -->
			<div class="col-md-9">
				<div class="box box-primary">
					<!-- 목록 헤더 시작 -->
					<div class="box-header with-border">
						<h3 class="box-title">사용자 목록</h3>
						<div class="box-tools pull-right">
							<div class="has-feedback">
								<input type="text" class="form-control input-sm" placeholder="Search User"> 
								<span class="glyphicon glyphicon-search form-control-feedback"></span>
							</div>
						</div>
					</div>
					<!-- 목록 헤더 끝-->

					<!-- 목록 바디 시작 -->
					<div class="box-body">
						<!-- 목록 버튼 시작 -->
						<div class="userbox-controls">
							<button type="button" class="btn btn-default btn-sm checkbox-toggle">
								<i class="fa fa-square-o"> 전체 선택</i>
							</button>
							<button type="button" class="btn btn-default btn-sm">
								<i class="fa fa-ban"> 차단</i>
							</button>
							<button type="button" class="btn btn-default btn-sm">
								<i class="fa fa-reply"></i>
							</button>
							<button type="button" class="btn btn-default btn-sm">
								<i class="fa fa-share"></i>
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
										<th class="">사용자</th>
										<th class="">별명</th>
										<th class="">최종로그인</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox"></td>
										<td class=""><a href="#">사용자1</a></td>
										<td class="">별명1</td>
										<td class="">차단 됨</td>
									</tr>
									<tr>
										<td><input type="checkbox"></td>
										<td class=""><a href="#">사용자2</a></td>
										<td class="">별명2</td>
										<td class="">2019.03.25</td>
									</tr>
									<tr>
										<td><input type="checkbox"></td>
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
						<button type="button" class="btn btn-default btn-sm checkbox-toggle">
							<i class="fa fa-square-o"> 전체 선택</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-ban"> 차단</i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-reply"></i>
						</button>
						<button type="button" class="btn btn-default btn-sm">
							<i class="fa fa-share"></i>
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
			</div>
			
			<!-- 프로필 통합 시작 -->
			<div class="col-md-3">
				<!--프로필 사진 시작 -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive img-circle" src="<c:url value='/resources/admin_images/user_icon.png'/>" alt="User profile picture">
						<h3 class="profile-username text-center">로그인계정</h3>
						<p class="text-muted text-center">별명</p>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><b>가입일 </b> <a class="pull-right">2018-02-12</a></li>
							<li class="list-group-item"><b>최종 로그인 날짜</b> <a class="pull-right">2019-04-03</a></li>
						</ul>
						<a href="#" class="btn btn-primary btn-block"><b>사용자 페이지로 이동</b></a>
					</div>
				</div>
				<!--프로필 사진 끝 -->

				<!-- 활동정보 시작 -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">사용자 정보</h3>
					</div>
					<div class="box-body">
						<strong><i class="fa fa-info margin-r-5"></i> 상세정보</strong>
						<ul class="list-group">
							<li class="list-group-item"><b>id</b><a class="pull-right">사용자id</a></li>
							<li class="list-group-item"><b>이름</b><a class="pull-right">사용자이름</a></li>
							<li class="list-group-item"><b>별명</b><a class="pull-right">사용자별명</a></li>
							<li class="list-group-item"><b>성별</b><a class="pull-right">남</a></li>
							<li class="list-group-item"><b>가입일</b><a class="pull-right">2019/02/02</a></li>
						</ul>
						<hr>
						
						<strong><i class="fa fa-book margin-r-5"></i> 작성</strong>
						<ul class="list-group">
							<li class="list-group-item"><b>누적 픽</b><a class="pull-right">56개</a></li>
							<li class="list-group-item"><b>게시글</b><a class="pull-right">10개</a></li>
							<li class="list-group-item"><b>보유 필터</b><a class="pull-right">45개</a></li>
							<li class="list-group-item"><b>문의</b><a class="pull-right">2개</a></li>
						</ul>
						<hr>
						
						<strong><i class="fa fa-map-marker margin-r-5"></i> 거주 지역</strong>
						<p class="text-muted">국가,지역</p>
						<hr>

						<strong><i class="fa fa-pencil margin-r-5"></i> 권한</strong>
						<p>
							<span class="label label-danger">차단 계정</span> 
							<span class="label label-warning">관리자</span> 
							<span class="label label-primary">일반 사용자</span>
						</p>
						<hr>
					</div>
				</div>
				<!-- 활동정보 끝 -->
			</div>
			<!-- 프로필 통합 끝 -->
		</div>
	</section>
	<!-- 프로필사진+목록 통합 끝 -->
</div>
<!-- 여기까지 사용자 관리 페이지 끝 -->