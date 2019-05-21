<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="<c:url value='/css/mapWrite.css'/>" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/daterangepicker.css'/>">
<link rel="stylesheet" href="<c:url value='/css/ionicons.css'/>">

<script src="<c:url value='/js/mapWrite.js'/>"></script>
<script src="<c:url value='/js/isotope-docs.min.js'/>"></script>

<!-- date-range-picker -->
<script src="<c:url value='/js/moment.min.js'/>"></script>
<script src="<c:url value='/js/daterangepicker.js'/>"></script>



<!--  -->
<script>
$(function(){
	$('#datepick').daterangepicker({
				locale: {
			        format: 'YYYY-MM-DD' // --------Here
			    }
			});
	$('.main_title').click(function(){
		$(this).val("");
	});
	
	
	var innerHeight = window.innerHeight - 180;
	console.log(innerHeight);
	$('.writePage').css("height",innerHeight + "px");
	$(window).resize(function(){
		innerHeight = window.innerHeight - 180;
		$('.writePage').css("height",innerHeight + "px");		
		console.log(innerHeight);	
		
	});
	
});
</script>
<%-- 
<button class="a">버튼 눌러주세요</button>
 <div style="margin-left:50px;">
	<c:forEach var="data" items="${data}" varStatus="loop">
		 <div>${data.title }</div>
		 <div>${data.addr }</div>
		 <div>${loop.index }</div>
		 <br /><br /><br />
	</c:forEach>
</div> --%>
	<!-- 나만의 사진여행 값 1   사진 값 2 주소 3 전화번호 4 지역제목 5 -->
	<%-- <section class="all_wrap">
		<form action="<c:url value='/friends/notice.pic'/>">
			<div class="writePage">
				<h1>나만의 사진여행기</h1>
				<div class="main_title_wrap">
					<input type="text" name="main_title" value="사진여행기 제목을 입력하세요" class="main_title"/>
					<input type="submit" class="btn btn-info" value="저장">
				</div>
				
				
				<div class="contents_wrap"><!-- 이거 for Eath 안돌림 -->
					<c:forEach var="data" items="${data }" varStatus="loop">
						<div class="contents">
							<div class="contents_img">
								<input type="hidden" name="contents_schedule_pic${loop.index }" value="${data.firstimage }" />
								<img src="${data.firstimage }" />
							</div>
							<div class="contents_right">
								<div class="contents_title">
									<p>${data.title } <span>사진여행 일정</span></p>
								</div>
								<div class="contents_schedule_title">
									<p>일정 제목을 입력해주세요</p>
									<input type="text" name="contents_title${loop.index }" value="" style="word-break:break-all;">
								</div>
								<div class="contents_schedule_naiyo">
									<p>일정 내용을 입력해주세요</p>
									<textarea name="contents_contents${loop.index }"></textarea>
									
								</div>
							</div>
						</div>
					</c:forEach>
			
				
			</div><!-- 여기는 전체 wrap -->
				
				
			</div>
		</form>
	</section> --%>
	
	
	
	
	
	<section class="all_wrap">
	
	
		<form action="<c:url value='/friends/route.pic'/>" method="post">
			<div class="writePage">
				<h1>나만의 사진여행기</h1>
				
				<div class="contents_wrap"><!-- 이거 for Eath 안돌림 -->
					
						<div class="contents">
						<c:forEach var="data" items="${data }" varStatus="loop">
							
							
							<div class="new_mb">
								<div class="contents_img">
									<input type="hidden" name="data${loop.index }" value="${data }" />
									<img src="${data.prp_image_path }" />
								</div>
								<div class="contents_title_2">
									<p class="new_mb2">${loop.index+1 }. ${data.prp_title } </p>
								
								</div>
							</div>
							
							</c:forEach>
						</div>
					
			<div class="contents_schedule_title">
				<p>일정 제목을 입력해주세요</p>
				<input type="text" name="prb_title" value="" style="word-break:break-all;">
			</div>
			
			
			<div class="form_mb">
				
				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</div>
					<input id="datepick" type="text" name="prb_start_date" class="form-control pull-right">
					
				</div>
			</div>
			
			
			
			
			
			
			<div class="contents_schedule_naiyo">
				<p>일정 내용을 입력해주세요</p>
				<textarea name="prb_content"></textarea>
				
			</div>
				<div class="main_title_wrap">
					<input type="submit" class="btn btn-info" value="저장">
				</div>
			</div><!-- 여기는 전체 wrap -->
				
				
			</div>
	
	
	
	
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
		</form>
	</section>
	
	

	
	
	