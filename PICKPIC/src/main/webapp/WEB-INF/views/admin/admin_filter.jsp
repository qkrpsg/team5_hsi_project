<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<div class="content-wrapper">
	<!-- 콘텐츠 헤더 시작 -->
	<section class="content-header">
		<h1>필터 <small>${total }개의 필터</small></h1>
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
						<table class="table table-hover table-striped" >
							<thead>
								<tr>
									<th><input type="checkbox" value="all"></th>
									<th>번호</th>
									<th>필터명</th>
									<th>가격</th>
									<th>상태</th>
									<th>이벤트 여부</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="item" items="${filter }" varStatus="loop">
									<tr>
										<td><input type="checkbox"></td>
										<td>${loop.count}</td>
										<td><a href="javascript:void(0)" class="detail" id="detail${loop.count }" value="${item.f_name }">${item.f_name }</a></td>
										<td>${item.f_change}</td>
										<c:if test="${item.f_sale_yn eq 'Y' }" var="isSale">
											<td>판매중</td>
										</c:if>
										<c:if test="${not isSale }">
											<td>미판매중</td>
										</c:if>
										<c:if test="${item.f_event_yn eq 'Y' }" var="isEvent">
											<td>이벤트 진행중</td>
										</c:if>
										<c:if test="${not isEvent }">
											<td>이벤트 종료</td>
										</c:if>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<div class="box-footer">
						<div class="pull-right">
							1/10
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
						<img id="d-filterImage" class="profile-user-img img-responsive" src="<c:url value='/resources/images/route2.jpg'/>" alt="User profile picture"/>
						<h3 id="d-filterName" class="profile-username text-center" fname="">필터명</h3>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><b>가격변경 </b><input type="number" id="d-change" class="form-control" /></li>
							<li class="list-group-item"><b>변경사유</b><input type="text" id="d-reason" class="form-control" /></li>
						</ul> 
						<button id="priceSummit" class="btn btn-primary btn-block">가격 설정</button>
						<div class="table-responsive">
							<button id="d-saleStart" class="btn btn-primary col-xs-6" style='display:none'>판매시작</button>
							<button id="d-saleStop" class="btn btn-primary col-xs-6" style='display:none'>판매중지</button>
							<button id="d-eventStart" class="btn btn-primary col-xs-6" style='display:none'>이벤트시작</button>
							<button id="d-eventStop" class="btn btn-primary col-xs-6" style='display:none'>이벤트중지</button>
						</div>
					</div>
				</div>
				<!--프로필 사진 끝 -->

				<!-- 활동정보 시작 -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">필터 정보</h3>
					</div>
					<div class="box-body">
						<strong><i class="fa fa-info margin-r-5"></i> 정보</strong>
						<ul class="list-group">
							<li class="list-group-item"><b>정가</b><a id="d-priceStart" class="pull-right">-</a></li>
							<li class="list-group-item"><b>현재가</b><a id="d-price" class="pull-right">-</a></li>
							<li class="list-group-item"><b>판매수</b><a id="d-saleCount" class="pull-right">-</a></li>
							<li class="list-group-item"><b>등록일</b><a id="d-postDate" class="pull-right">-</a></li>
							<li class="list-group-item"><b>가격 변경일</b><a id="d-changeDate" class="pull-right">-</a></li>
						</ul>
						<hr>

						<strong><i class="fa fa-star margin-r-5"></i> 상태</strong>
						<p>
							<span id="d-typeSaleStart" style="display:none" class="label label-primary">판매중</span>
							<span id="d-typeSaleStop" style="display:none" class="label label-warning">판매 중지</span>
							<span id="d-typeEventStart" style="display:none" class="label label-success">이벤트 진행중</span>
							<span id="d-typeEventStop" style="display:none" class="label label-danger">이벤트 종료</span>
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

<script>
	
	$(function() {
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

		$('.detail').click(function() {
			var filter = $(this).attr('value');
			console.log(filter);
			$.ajax({
				url : '<c:url value="/admin/filterDetail.do"/>',
				data : {
					"f_name" : filter,
					"${_csrf.parameterName}" : "${_csrf.token}"
				},
				dataType : 'json',
				type : "get",
				success : function(data) {
					console.log('성공했습니다');
					console.log(data);

					$.each(data, function(index, element) {
// 						$('#d-filterImage').html(element['']);
						$('#d-filterName').html(element['f_name']);
						$('#d-change').attr('placeholder', element['f_change']);
						$('#d-change').val('');
						$('#d-reason').val('');
						
						
						if (element['f_sale_yn'] == "Y") {
							$('#d-saleStart').css('display', 'none');
							$('#d-saleStop').css('display', 'inline');
						} else {
							$('#d-saleStart').css('display', 'inline');
							$('#d-saleStop').css('display', 'none');
						}
						if (element['f_event_yn'] == "Y") {
							$('#d-eventStart').css('display', 'none');
							$('#d-eventStop').css('display', 'inline');
						} else {
							$('#d-eventStart').css('display', 'inline');
							$('#d-eventStop').css('display', 'none');
						}
						
						$('#d-priceStart').html(element['f_price']);
						$('#d-price').html(element['f_change']);
						$('#d-saleCount').html(element['totalFilter']);
						$('#d-postDate').html(element['f_post_date']);
						$('#d-changeDate').html(element['f_change_date']);
						
						if (element['f_sale_yn'] == "Y") {
							$('#d-typeSaleStart').css('display', 'inline');
							$('#d-typeSaleStop').css('display', 'none');
						} else {
							$('#d-typeSaleStart').css('display', 'none');
							$('#d-typeSaleStop').css('display', 'inline');
						}
						if (element['f_event_yn'] == "Y") {
							$('#d-typeEventStart').css('display', 'inline');
							$('#d-typeEventStop').css('display', 'none');
						} else {
							$('#d-typeEventStart').css('display', 'none');
							$('#d-typeEventStop').css('display', 'inline');
						}
						
					});
				},
				error : function(data) {
					console.log('실패했습니다');
					console.log(data);
				}
			});
		});/* 클릭  */
		
		$('#priceSummit').click(function() {
// 			console.log($('#d-change').val().length);
// 			console.log($('#d-filterName').html().length);
			if($('#d-change').val().length > 0 && $('#d-reason').val().length > 0){
				$.ajax({
					url : '<c:url value="/admin/filterPriceChange.do"/>',
					data : {
						"f_name" : $('#d-filterName').html(),
						"f_change" : $('#d-change').val(),
						"f_reason" : $('#d-reason').val(),
						"${_csrf.parameterName}" : "${_csrf.token}"
					},
					dataType : 'json',
					type : "get",
					success : function(data) {
						console.log('성공했습니다');
						console.log(data);
						
						$.each(data, function(index, element) {
							$('#d-change').val(element['f_change']);
							$('#d-reason').val('');
							$('#d-price').html(element['f_change']);
						});
					},
					error : function(data) {
						console.log('실패했습니다');
						console.log(data);
					}
				});
			}
			else if($('#d-change').val().length > 0 && $('#d-reason').val().length == 0){
				alert('변경 사유를 입력해주세요');
			}
		});
	});
</script>
