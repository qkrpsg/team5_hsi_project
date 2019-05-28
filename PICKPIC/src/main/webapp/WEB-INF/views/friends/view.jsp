<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="<c:url value='/css/test/style3.css'/>" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/test/themify-icons.css'/>">
<link rel="stylesheet" href="<c:url value='/css/test/material-design-iconic-font.min.css'/>">
<script src="<c:url value='/js/test/tether.min.js'/>"></script>

<link rel="stylesheet" href="<c:url value='/css/test/bootstrap-theme.min.css'/>">
<link rel="stylesheet" href="<c:url value='/css/test/hero-slider.css'/>">
<link rel="stylesheet" href="<c:url value='/css/test/owl-carousel.css'/>">
<link rel="stylesheet" href="<c:url value='/css/test/datepicker.css'/>">
<link rel="stylesheet" href="<c:url value='/css/test/templatemo-style.css'/>">
<link href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<script src="<c:url value='/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js'/>"></script>


<section class="intro-section">
	<div class="container">
		<div class="row">
			<div class="col-md-1 col-lg-2"></div>
			<div class="col-md-10 col-lg-8">
				<div class="intro">
					<div class="profile-img">
						<img class="pr_img"
							src="${road.ppa_profile_path }"
							alt="">
					</div>
					<h3 style="margin-top: 10px">
						<b>${road.ppa_nickname }</b>
					</h3>
					<!-- <h4 class="font-yellow">프로필수정</h4> -->
					<ul class="follow2">
						<li>
							<h6>
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit; color: #4883ff">${road.totalplace }</font></font>
							</h6> <span><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">픽플레이스</font></font></span>
						</li>
						<li>
							<h6>
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit; color: #4883ff">${road.totalroad }</font></font>
							</h6> <span><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">픽로드</font></font></span>
						</li>
						<li>
							<h6>
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit; color: #4883ff">0</font></font>
							</h6> <span><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">보관함</font></font></span>
						</li>
						<li>
							<h6>
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit; color: #4883ff">${road.totalfilter }</font></font>
							</h6> <span><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">보유 필터</font></font></span>
						</li>
					</ul>

				</div>
				<!-- intro -->
			</div>
			<!-- col-sm-8 -->
		</div>
		<!-- row -->
	</div>
	<!-- container -->
</section>

<section class="popular-places" id="popular">
	<div class="container-fluid">
		<div class="owl-carousel owl-theme">

			<c:forEach var="list" items="${list }" varStatus="loop">
				<div id="${list.PRP_ID }" class="item popular-item btnimg">
					<div class="thumb" style="width: 280px; height: 280px;">
						<img src="${list.PRP_IMAGE_PATH }" alt=""
							style="width: 100%; height: 280px;">
						<div class="text-content">
							<h4>${list.PRP_TITLE }</h4>
						</div>
					</div>
				</div>
			</c:forEach>

		</div>
	</div>
</section>



<section class="light-bg booking-details_wrap">
	<div class="container">
		<div class="row">
			<div class="col-md-8 responsive-wrap">
				<div class="booking-checkbox_wrap">
					<div class="booking-checkbox">
						<div class="customer-content">
							<div class="customer-review">
								<h3>
									<font style="vertical-align: inherit;"><font
										style="vertical-align: inherit;">${road.prb_title }</font></font>
								</h3>
								<p>
									<font style="vertical-align: inherit;">${road.prb_post_date }</font>
								</p>
							</div>
						</div>
						<hr>

<%-- 						<canvas style="background-color: #ececec; width: 100%; height: auto;" id="canvas"></canvas> --%>
						<img id="img" src="${list[0].PRP_IMAGE_PATH}"/>
						<hr>
						<p>
							<font style="vertical-align: inherit;"> <font
								style="vertical-align: inherit;"> ${road.prb_content }</font>
							</font>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-4 responsive-wrap">
				<div class="contact-info">
					<img src="/pickpic/resources/images/test/map.jpg" class="img-fluid"
						alt="#">
					<div class="address">
						<span><i class="zmdi zmdi-pin zmdi-hc-lg"></i></span>
						<p>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;"> 서울특별시 </font></font><br> <font
								style="vertical-align: inherit;"><font
								style="vertical-align: inherit;"> 금천구</font></font><br> <font
								style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">426-5 &amp; 가산동</font><font
								style="vertical-align: inherit;"> 월드 메르디앙 벤처 센터 2 차 </font></font><br>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">311호</font></font>
						</p>
					</div>

					<a class="btn btn-outline-danger btn-contact"
						onclick="fn_spread('crowling_result');"> <font
						style="vertical-align: inherit;">+ 이 지역 관련 검색어</font></a>
				</div>
				<div class="follow" id="crowling_result" style="display: none;">
					<a href="#"><font style="vertical-align: inherit;">관련어1</font></a>
					<a href="#"><font style="vertical-align: inherit;">관련어1</font></a>
					<a href="#"><font style="vertical-align: inherit;">관련어1</font></a>
					<a href="#"><font style="vertical-align: inherit;">관련어1</font></a>
					<a href="#"><font style="vertical-align: inherit;">관련어1</font></a>
					<a href="#"><font style="vertical-align: inherit;">관련어1</font></a>
					<a href="#"><font style="vertical-align: inherit;">관련어1</font></a>
				</div>
			</div>
		</div>
	</div>
</section>

<script type="text/javascript">

function fn_spread(id){
    var getID = document.getElementById(id);
    getID.style.display=(getID.style.display=='none') ? 'block' : 'none';
}
$('.btnimg').click(function(){ 
	var prp_id = $(this).attr('id');
	console.log(prp_id);
	$.ajax({
		url:'<c:url value="/friends/pickroadAjax.do"/>',
		dataType : 'json',
		type : 'GET',
		data : {
			'prp_id' : prp_id
		},
		success : function(data){
			console.log(data);
			console.log('성공');
			
			$.each(data, function(index, element){
				console.log(element);
				$('#img').attr('src', element['prp_image_path']);
			});
		},
		error : function(data){
			console.log(data);
		}
	});
	//console.log("fa-plus : " + $(this).find('a').find('.fa-plus'));
});

</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js" type="text/javascript"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

<script src="<c:url value='/js/test/datepicker.js'/>"></script>
<script src="<c:url value='/js/test/plugins.js'/>"></script>
<script src="<c:url value='/js/test/main3.js'/>"></script>