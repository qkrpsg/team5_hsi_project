<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>

<div class="content-wrapper">
	<!-- 콘텐츠 헤더 시작 -->
	<section class="content-header">
		<h1>필터 <small id="count"></small></h1>
	</section>
	<!-- 콘텐츠 헤더 끝 -->
	
	<!-- 콘텐츠 시작 -->
    <section class="content">
	    <div class="row">
	    	<div class="col-md-9">
	    		<div class="box">
					<div class="box-header">
						<h3 class="box-title">필터 목록</h3>
					</div>
					
					<div class="box-body table-responsive">
						<table id="userTable" class="table table-hover table-striped" >
							<thead>
								<tr>
									<th>번호</th>
									<th>고유번호</th>
									<th>필터명</th>
									<th>가격</th>
									<th>상태</th>
									<th>이벤트 여부</th>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<!-- 프로필 통합 시작 -->
			<div class="col-md-3">
				<!--프로필 사진 시작 -->
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img id="d-filterImage" class="profile-user-img img-responsive" src="<c:url value='/resources/pay_img/none.jpg'/>" alt="User profile picture"/>
						<h3 id="d-filterName" class="profile-username text-center" fname="">필터명</h3>
						<ul class="list-group list-group-unbordered">
							<li class="list-group-item"><b>가격변경 </b><input type="number" id="d-change" class="form-control" /></li>
							<li class="list-group-item"><b>변경사유</b><input type="text" id="d-reason" class="form-control" /></li>
						</ul> 
						<button id="priceSummit" class="btn btn-primary btn-block">가격 설정</button>
						<div class="table-responsive">
							<button id="d-saleToggle" class="btn btn-primary col-xs-6">판매 중지</button>
							<button id="d-eventToggle" class="btn btn-primary col-xs-6">이벤트 시작</button>
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
						
						<strong><i class="fa fa-bookmark margin-r-5"></i> 최근 가격 변경 사유</strong>
						<p><span id="d-reasonText">-</span></p>
						<hr>
						
						<strong><i class="fa fa-star margin-r-5"></i> 상태</strong>
						<p>
							<span id="d-typeSaleToggle" class="label label-primary">판매중</span>
							<span id="d-typeEventToggle" class="label label-success">이벤트 진행중</span>
							
<!-- 							<span id="d-typeSaleStart" style="display:none" class="label label-primary">판매중</span> -->
<!-- 							<span id="d-typeSaleStop" style="display:none" class="label label-warning">판매 중지</span> -->
<!-- 							<span id="d-typeEventStart" style="display:none" class="label label-success">이벤트 진행중</span> -->
<!-- 							<span id="d-typeEventStop" style="display:none" class="label label-danger">이벤트 종료</span> -->
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
	//데이터 테이블
	$(document).ready(function() {
	    InitUserTable();
	});
	
	var table;
	function InitUserTable() {
		table = $('#userTable').DataTable({
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
	            url:"<c:url value='/admin/filterList.do'/>",
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
	            {data: "f_id"},
	            {data: "f_name",
	            	"render" : function(data){
	            		data = '<a href="javascript:void(0)" onclick="detail(this)">'+data+'</a>';
	            		return data;
	            	}
	            },
	            {data: "f_change"},
	            {data: "f_sale_yn",
	            	"render" : function(data) {
						if(data == 'Y')
							data = '판매중';
						else
							data = '판매 중지';
						return data;
					}
	            },
				{data : "f_event_yn",
					"render":function(data){
						if(data == 'Y')
							data = '이벤트 진행중';
						else
							data = '이벤트 종료';
						return data;
					}
	            }
	        ]
	    });
	};
	
	//상세보기
	var detail = function(obj) {
		var filter = $(obj).html();
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
					$('#d-filterImage').attr("src",element["f_image_path"]);
					$('#d-filterName').html(element['f_name']);
					$('#d-change').attr('placeholder', element['f_change']);
					$('#d-change').val('');
					$('#d-reason').val('');
					
					if (element['f_sale_yn'] == "Y") {
						$('#d-saleToggle').html('판매 중지');
					} else {
						$('#d-saleToggle').html('판매 시작');
					}
					if (element['f_event_yn'] == "Y") {
						$('#d-eventToggle').html('이벤트 중지');
					} else {
						$('#d-eventToggle').html('이벤트 시작');
					}
					
					$('#d-priceStart').html(element['f_price']);
					$('#d-price').html(element['f_change']);
					$('#d-saleCount').html(element['totalFilter']);
					$('#d-postDate').html(element['f_post_date']);
					$('#d-changeDate').html(element['f_change_date']);
					$('#d-reasonText').html(element['f_reason']);
					
					
					if (element['f_sale_yn'] == "Y") {
						$('#d-typeSaleToggle').html('판매중');
						$('#d-typeSaleToggle').attr('class', 'label label-primary');
					} else {
						$('#d-typeSaleToggle').html('판매중지');
						$('#d-typeSaleToggle').attr('class', 'label label-warning');
					}
					if (element['f_event_yn'] == "Y") {
						$('#d-typeEventToggle').html('이벤트 진행중');
						$('#d-typeEventToggle').attr('class', 'label label-success');
					} else {
						$('#d-typeEventToggle').html('이벤트 종료');
						$('#d-typeEventToggle').attr('class', 'label label-danger');
					}
					
				});
			},
			error : function(data) {
				console.log('실패했습니다');
				console.log(data);
			}
		});
	};/* 클릭  */
		
	//가격 변경
	$('#priceSummit').click(function() {
		if($('#d-change').val() < 0){
			alert('숫자는 양수만 입력해주세요');
		}
		else if($('#d-change').val().length > 0 && $('#d-reason').val().length > 0){
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
						$('#d-change').val('');
						$('#d-change').attr('placeholder', element['f_change']);
						$('#d-reason').val('');
						$('#d-price').html(element['f_change']);
						$('#d-reasonText').html(element['f_reason']);
					});
					table.ajax.reload();
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
		
	//판매 여부
	$('#d-saleToggle').click(function() {
		var sale;
		$('#d-saleToggle').html() == "판매 중지" ? sale="N" : sale="Y";
		$.ajax({
			url : '<c:url value="/admin/filterSaleUpdate.do"/>',
			data : {
				"f_name" : $('#d-filterName').html(),
				"f_sale_yn" : sale,
				"${_csrf.parameterName}" : "${_csrf.token}"
			},
			dataType : 'json',
			type : "get",
			success : function(data) {
				console.log('성공했습니다');
				console.log(data);
				table.ajax.reload();
				$.each(data, function(index, element) {
					if(element['f_sale_yn'] == "Y"){
						$('#d-saleToggle').html('판매 중지');
						$('#d-typeSaleToggle').html('판매중');
						$('#d-typeSaleToggle').attr('class', 'label label-primary');
					}
					else{
						$('#d-saleToggle').html('판매 시작');
						$('#d-typeSaleToggle').html('판매중지');
						$('#d-typeSaleToggle').attr('class', 'label label-warning');
					}
				});
			},
			error : function(data) {
				console.log('실패했습니다');
				console.log(data);
			}
		});
	});
		
	//이벤트 여부
	$('#d-eventToggle').click(function() {
		var event;
		$('#d-eventToggle').html() == "이벤트 시작" ? event="Y" : event="N";
		$.ajax({
			url : '<c:url value="/admin/filterEventUpdate.do"/>',
			data : {
				"f_name" : $('#d-filterName').html(),
				"f_event_yn" : event,
				"${_csrf.parameterName}" : "${_csrf.token}"
			},
			dataType : 'json',
			type : "get",
			success : function(data) {
				console.log('성공했습니다');
				console.log(data);
				table.ajax.reload();
				$.each(data, function(index, element) {
					if(element['f_event_yn'] == "Y"){
						$('#d-eventToggle').html('이벤트 중지');
						$('#d-typeEventToggle').html('이벤트 진행중');
						$('#d-typeEventToggle').attr('class', 'label label-success');
					}
					else{
						$('#d-eventToggle').html('이벤트 시작');
						$('#d-typeEventToggle').html('이벤트 종료');
						$('#d-typeEventToggle').attr('class', 'label label-danger');
					}
				});
			},
			error : function(data) {
				console.log('실패했습니다');
				console.log(data);
			}
		});
	});
</script>
