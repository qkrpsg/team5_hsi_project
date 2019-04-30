<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<div class="content-wrapper">
	<!-- 컨텐츠 헤더 시작 -->
	<section class="content-header">
		<h1>문의 <small>30 개의 문의사항</small></h1>
	</section>
	<!-- 컨텐츠 헤더 시작 -->

	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box box-primary">
					<!-- 박스 헤더 시작 -->
					<div class="box-header with-border">
						<h3 class="box-title">문의 목록</h3>
					</div>
					<!-- 박스 헤더 끝 -->

					<!-- 박스 바디 시작 -->
					<div class="box-body">

						<!-- Post -->
						<div class="post clearfix">
							<div class="user-block">
								<img class="img-circle img-bordered-sm" src="<c:url value='/resources/admin_images/user_icon.png'/>" alt="User Image">
								<span class="username"> 
									<a href="#">사용자1</a>
                          			<div class="pull-right text-sm">처리 완료</div>
								</span> 
								<span class="description">2019/03/24 17:33</span>
							</div>
							<p>
								문의내용1
							</p>
<!-- 							<form class="form-horizontal"> -->
<!-- 								<div class="form-group margin-bottom-none"> -->
<!-- 									<div class="col-sm-10"> -->
<!-- 										<input class="form-control input-sm" placeholder="등록"> -->
<!-- 									</div> -->
<!-- 									<div class="col-sm-2"> -->
<!-- 										<button type="submit" class="btn btn-primary pull-right btn-block btn-sm">보내기</button> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</form> -->
							<hr>
							<button type="button" class="btn btn-default btn-sm pull-right">
								<i class="fa fa-eraser">수정</i>
							</button>
							<p>
								답변내용1
							</p>
						</div>
						<!-- /.post -->
						<!-- Post -->
						<div class="post clearfix">
							<div class="user-block">
								<img class="img-circle img-bordered-sm" src="<c:url value='/resources/admin_images/user_icon.png'/>" alt="User Image"> 
								<span class="username"> 
									<a href="#">사용자2</a>
                          			<div class="pull-right text-sm">처리 중</div>
								</span> 
								<span class="description">2019/04/01 19:44 </span>
							</div>
							<!-- /.user-block -->
							<p>
								문의내용2
							</p>

							<form class="form-horizontal">
								<div class="form-group margin-bottom-none">
									<div class="col-sm-10">
										<input class="form-control input-sm" placeholder="등록">
									</div>
									<div class="col-sm-2">
										<button type="submit" class="btn btn-primary pull-right btn-block btn-sm">보내기</button>
									</div>
								</div>
							</form>
						</div>
						<!-- /.post -->
						<!-- Post -->
						<div class="post clearfix">
							<div class="user-block">
								<img class="img-circle img-bordered-sm" src="<c:url value='/resources/admin_images/user_icon.png'/>" alt="User Image"> 
								<span class="username"> 
									<a href="#">사용자3</a>
                          			<div class="pull-right text-sm">처리 중</div>
								</span> 
								<span class="description">2019/04/13 21:39</span>
							</div>
							<!-- /.user-block -->
							<p>
								문의내용3
							</p>

							<form class="form-horizontal">
								<div class="form-group margin-bottom-none">
									<div class="col-sm-10">
										<input class="form-control input-sm" placeholder="등록">
									</div>
									<div class="col-sm-2">
										<button type="submit" class="btn btn-primary pull-right btn-block btn-sm">보내기</button>
									</div>
								</div>
							</form>
						</div>
						<!-- /.post -->
					</div>
					<!-- 박스 바디 끝 -->
				</div>
			</div>
		</div>
	</section>
</div>
