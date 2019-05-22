<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<!-- 여기서부터 사용자 관리 페이지 시작 -->
<div class="content-wrapper">
	<section class="content-header">
		<h1>회원 <small>${total }명의 사용자</small></h1>
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
						<!-- 목록데이터 : 사용자 아이디 입력 부분 -->
						<div class="table-responsive mailbox-messages">
							<table class="table table-hover table-striped">
								<thead>
									<tr>
										<th><input type="checkbox" value="all"></th>
										<th>번호</th>
										<th class="">아이디</th>
										<th class="">별명</th>
										<th class="">최종로그인</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${user }" varStatus="loop">
										<tr>
											<td><input type="checkbox"></td>
											<td>${loop.count}</td>
											<td><a href="javascript:void(0)" class="mb-detail">${item.ppa_email }</a></td>
											<td>${item.ppa_nickname}</td>
											<td>${item.lh_ld }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<!-- 목록 바디 끝 -->

					<!-- 목록 풋터 시작 -->
					<div class="box-footer">
						<div class="pull-right">
							1/10
							<div class="btn-group">
								<button type="button" id="prev" class="btn btn-default btn-sm">
									<i class="fa fa-chevron-left"></i>
								</button>
								<button type="button" id="next" class="btn btn-default btn-sm">
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
				<div class="box box-primary detailTop">
					<div class="box-body box-profile">
						<img id="userimage" class="profile-user-img img-responsive img-circle" src="/pickpic/resources/images/defaultProfile.png" alt="User profile picture">
						<h3 id="useremail" class="profile-username text-center">로그인계정</h3>
						<p id="nickname" class="text-muted text-center">별명</p>
					</div>
				</div>
				<!--프로필 사진 끝 -->

				<!-- 활동정보 시작 -->
				<div class="box box-primary detailBody">
					<div class="box-header with-border">
						<h3 class="box-title">사용자 정보</h3>
					</div>
					<div class="box-body">
						<strong><i class="fa fa-info margin-r-5"></i> 정보</strong>
						<ul class="list-group">
							<li class="list-group-item"><b>아이디</b><a id="d-useremail" class="pull-right">-</a></li>
							<li class="list-group-item"><b>별명</b><a id="d-nickname" class="pull-right">-</a></li>
							<li class="list-group-item"><b>가입일</b><a id="d-joindate" class="pull-right">-</a></li>
							<li class="list-group-item"><b>최종로그인</b><a id="d-logindate" class="pull-right">-</a></li>
						</ul>
						<hr>
						
						<strong><i class="fa fa-book margin-r-5"></i> 작성</strong>
						<ul class="list-group">
							<li class="list-group-item"><b>누적 픽</b><a id="d-pick" class="pull-right">-</a></li>
							<li class="list-group-item"><b>게시글</b><a id="d-post" class="pull-right">-</a></li>
							<li class="list-group-item"><b>보유 필터</b><a id="d-filter" class="pull-right">-</a></li>
							<li class="list-group-item"><b>문의</b><a id="d-question" class="pull-right">-</a></li>
						</ul>
						<hr>

						<strong><i class="fa fa-pencil margin-r-5"></i> 권한</strong>
						<p>
							<span id="d-type-admin" style="display:none" class="label label-warning">관리자</span> 
							<span id="d-type-pickpic" style="display:none" class="label label-primary">일반 사용자</span>
							<span id="d-type-ban" style="display:none" class="label label-danger">차단 계정</span> 
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

<script>
	
	$(function() {
// 		var nowPage = 1;
// 		$('#next').click(function() {
// 			$.ajax({
// 				url : '<c:url value="/admin/userPaging.do"/>',
// 				data :{
// 					"nowPage" : parseInt(nowPage),
// 		            "${_csrf.parameterName}" : "${_csrf.token}"
// 				},
// 				dataType : 'json',
// 				type : 'get',
// 				success :function(data){
// 					console.log('성공했습니다');
// 					console.log(data);
// 				},
// 				error : function(data) {
// 					console.log('실패했습니다');
// 					console.log(data);
// 				}
// 			});
// 		});

		$(':checkbox').click(function() {
			if ($(this).val() == 'all') {//전체 선택 클릭
				if ($(this).filter(':checked').length == 1) {//체크한 경우
					$(":checkbox:gt(0)").each(function() {
						$(this).prop("checked", true);
					});
				} 
				else {//체크 해제한 경우
					$(":checkbox:gt(0)").each(function() {
						$(this).prop("checked", false);
					});
				}
			} 
			else {//전체 선택이 아닌 체크박스 클릭
				if ($(this).filter(':checked').length == 1) {//체크한 경우
					if ($(":checkbox:checked").length == $(":checkbox:gt(0)").length) {//체크시 체크된 모든 체크박스의 수와 전체선택을 제외한 체크박스의 수가 같다면 즉 모두 선택되었다면 			
						$(":checkbox:first").prop("checked", true);
					}
				} 
				else {//체크 해제한 경우
					$(":checkbox:first").prop("checked", false);
				}
			}
		});

		$('.mb-detail').click(function() {
			var email = $(this).html();
			console.log(typeof email);
			$.ajax({
				url : '<c:url value="/admin/userDetail.do"/>',
				data : {
					"ppa_email" : email,
					"${_csrf.parameterName}" : "${_csrf.token}"
				},
				dataType : 'json',
				type : "get",
				success : function(data) {
					console.log('성공했습니다');
					console.log(data);

					$.each(data, function(index, element) {
						$('#userimage').attr("src",element["ppa_profile_path"]);
						$('#useremail').html(element["ppa_email"]);
						$('#nickname').html(element['ppa_nickname']);

						$('#d-useremail').html(element["ppa_email"]);
						$('#d-nickname').html(element['ppa_nickname']);
						$('#d-joindate').html(element['ppa_join_date']);
						$('#d-logindate').html(element['lh_ld']);

						$('#d-pick').html(element['totalpick']);
						$('#d-post').html(element['totalpost']);
						$('#d-filter').html(element['totalfilter']);
						$('#d-question').html(element['totalquestion']);

						console.log(element['ppa_type']);
						if (element['as_class'] == "ROLE_ADMIN") {
							console.log('넌관리자야');
							$('#d-type-admin').css('display', 'inline');
							$('#d-type-pickpic').css('display', 'none');
						} else {
							console.log('넌사용자야');
							$('#d-type-admin').css('display', 'none');
							$('#d-type-pickpic').css('display', 'inline');
						}
					});
				},
				error : function(data) {
					console.log('실패했습니다');
					console.log(data);
				}
			});
		});/* 클릭  */
	});
</script>
