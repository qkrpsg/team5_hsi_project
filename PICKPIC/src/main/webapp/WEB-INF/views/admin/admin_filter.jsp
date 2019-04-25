<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<div class="content-wrapper">
	<!-- 콘텐츠 헤더 시작 -->
	<section class="content-header">
		<h1>필터 <small>20개의 필터</small></h1>
	</section>
	<!-- 콘텐츠 헤더 끝 -->
	
	<!-- 콘텐츠 시작 -->
    <section class="content">
	    <div class="row">
	    	<div class="col-md-9">
	    		<div class="box">
					<div class="box-header">
						<h3 class="box-title">필터 목록</h3>
						
						
						<div class="box-tools pull-right">
							<div class="has-feedback">
								<input type="text" class="form-control input-sm" placeholder="Search Filter"> 
								<span class="glyphicon glyphicon-search form-control-feedback"></span>
							</div>
						</div>
					</div>
					
					<div class="box-body table-responsive">
						<button type="button" class="btn btn-default btn-sm checkbox-toggle">
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
						<table class="table table-hover table-striped" >
							<thead>
								<tr>
									<th></th>
									<th>번호</th>
									<th>필터명</th>
									<th>가격</th>
									<th>등록일</th>
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
									<td>2019/03/24</td>
									<td>판매중</td>
									<td><i class="fa fa-circle text-red"></i></td>
								<tr>
									<td><input type="checkbox"></td>
									<td>2</td>
									<td><a href="#">필터명2</a></td>
									<td>2,500</td>
									<td>2019/03/30</td>
									<td>판매중</td>
									<td><i class="fa fa-circle text-green"></i></td>
								<tr>
									<td><input type="checkbox"></td>
									<td>3</td>
									<td><a href="#">필터명3</a></td>
									<td>3,900</td>
									<td>2019/04/15</td>
									<td>판매중</td>
									<td><i class="fa fa-circle text-red"></i></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="box-footer">
						<button type="button" class="btn btn-default btn-sm checkbox-toggle">
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
			<!-- 프로필 통합 시작 -->
			<div class="col-md-3">
				<!--프로필 사진 시작 -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="profile-user-img img-responsive" src="<c:url value='/resources/images/route2.jpg'/>" alt="User profile picture">
						<h3 class="profile-username text-center">필터명1</h3>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><b>가격변경 </b><input type="text" name="가격 설정" class="form-control" /></li>
							<li class="list-group-item"><b>변경사유</b><input type="text" name="가격 설정" class="form-control" /></li>
						</ul>
						<a href="#" class="btn btn-primary btn-block"><b>가격 설정</b></a>
					</div>
				</div>
				<!--프로필 사진 끝 -->

				<!-- 활동정보 시작 -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">필터 정보</h3>
					</div>
					<div class="box-body">
						<strong><i class="fa fa-info margin-r-5"></i> 상세정보</strong>
						<ul class="list-group">
							<li class="list-group-item"><b>정가</b><a class="pull-right">3,000</a></li>
							<li class="list-group-item"><b>현재가</b><a class="pull-right">3,000</a></li>
							<li class="list-group-item"><b>판매수</b><a class="pull-right">45개</a></li>
							<li class="list-group-item"><b>등록일</b><a class="pull-right">2019/03/24</a></li>
							<li class="list-group-item"><b>최근 가격 변경일</b><a class="pull-right">2019/03/24</a></li>
						</ul>
						<hr>
						
						<strong><i class="fa fa-tag margin-r-5"></i> 키워드</strong>
						<p class="text-muted"> 인물, 배경, 음식</p>
						<hr>

						<strong><i class="fa fa-star margin-r-5"></i> 상태</strong>
						<p>
							<span class="label label-primary">판매중</span>
							<span class="label label-danger">판매 중지</span>
							<span class="label label-success">할인중</span>
						</p>
						<hr>
					</div>
				</div>
				<!-- 활동정보 끝 -->
			</div>
			<!-- 프로필 통합 끝 -->
		</div>
	</section>
	<!-- 콘텐츠 끝 -->
</div>