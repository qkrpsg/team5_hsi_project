<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<!-- 여기서부터 사용자 관리 페이지 시작 -->
<div class="content-wrapper">
	<section class="content-header">
		<h1>회원 <small class="count"></small></h1>
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
					</div>
					<!-- 목록 헤더 끝-->

					<!-- 목록 바디 시작 -->
					<div class="box-body">
						<!-- 목록데이터 : 사용자 아이디 입력 부분 -->
						<div class="table-responsive mailbox-messages">
							<table id="userTable" class="table table-hover table-striped">
								<thead>
									<tr>
										<th>번호</th>
										<th>고유번호</th>
										<th>아이디</th>
										<th>별명</th>
										<th>최종로그인</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<!-- 목록 바디 끝 -->
				</div>
			</div>
			
			<!-- 프로필 통합 시작 -->
			<div class="col-md-3">
				<!--프로필 사진 시작 -->
				<div class="box box-primary detailTop">
					<div class="box-body box-profile">
						<canvas class="profile-user-img img-responsive img-circle" id="canvas"></canvas>
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
	//데이터 테이블
	$(document).ready(function () {
	    $('#userTable').DataTable({
	    	responsive : true,
            pageLength : 10,
            lengthMenu : [ [ 5, 10, 20, -1 ], [ 5, 10, 20, "All" ] ],
            language: {
                "emptyTable": "데이터가 없어요.",
                "lengthMenu": "페이지당 개수 : _MENU_",
                "info": "현재 _START_ - _END_ / _TOTAL_건",
                "infoEmpty": "데이터 없음",
                "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
                "search": "검색 :",
                "zeroRecords": "일치하는 데이터가 없습니다",
                "loadingRecords": "로딩중...",
                "processing":     "잠시만 기다려 주세요...",
                "paginate": {
                    "next": "다음",
                    "previous": "이전"
                }
            },
            ajax : {
                url:"<c:url value='/admin/userList.do'/>",
                type:"POST",
                dataType:"JSON",
				"${_csrf.parameterName}" : "${_csrf.token}",
			    dataSrc: "",
			    error:function(request, error){
			    	console.log('실패했습니다');
			    	console.log(request.responseText);
			    }
            },
            columns : [
            	{data: "rownum"},
                {data: "ppa_id"},
                {data: "ppa_email",
                	"render" : function(data){
                		data = '<a href="javascript:void(0)" onclick="detail(this)" class="mb-detail">'+data+'</a>';
                		return data;
                	}
                },
                {data: "ppa_nickname"},
                {data: "lh_ld"}
            ]
	    });
	});
	
	//상세보기
	var detail = function(obj) {
		var email = $(obj).html();
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
					var canvas = document.getElementById('canvas');
					ctx = canvas.getContext("2d");
					
					var loadImg = new Image();
					loadImg.src= "https://s3.ap-northeast-2.amazonaws.com/img.pickpic.com/pickpic/image" + element['ppa_profile_path'];
					loadImg.onload = function(e) {
						canvas.width = loadImg.width;
						canvas.height = loadImg.height;
						ctx.drawImage(loadImg, 0, 0, loadImg.width, loadImg.height);
						canvas.removeAttribute("data-caman-id");
					};
					
					
					
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
	};
</script>
