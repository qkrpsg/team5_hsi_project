<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<link href="<c:url value='/css/test/style3.css'/>" rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/css/test/themify-icons.css'/>">
<link rel="stylesheet"
	href="<c:url value='/css/test/simple-line-icons.css'/>">
<link rel="stylesheet"
	href="<c:url value='/css/test/material-design-iconic-font.min.css'/>">
<%-- <link href="<c:url value='/css/test/ionicons.css'/>" rel="stylesheet">  --%>
<script src="<c:url value='/js/test/tether.min.js'/>"></script>


<%-- <script src="<c:url value='/js/test/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/js/test/isotope.pkgd.min.js'/>"></script>
<script src="<c:url value='/js/test/jquery.waypoints.min.js'/>"></script>
<script src="<c:url value='/js/test/progressbar.min.js'/>"></script>
<script src="<c:url value='/js/test/scripts.js'/>"></script> --%>

<section class="intro-section">
	<div class="container">
		<div class="row">
			<div class="col-md-1 col-lg-2"></div>
			<div class="col-md-10 col-lg-8">
				<div class="intro">
					<div class="profile-img">
						<img class="pr_img"
							src="<c:url value='/resources/images/team/memberPark.jpg'/>"
							alt="">
					</div>
					<h3 style="margin-top: 10px">
						<b>슬기로운다슬기</b>
					</h3>
					<h4 class="font-yellow">프로필수정</h4>
					<ul class="follow2">
						<li>
							<h6>
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit; color: #4883ff">5</font></font>
							</h6> <span><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">픽플레이스</font></font></span>
						</li>
						<li>
							<h6>
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit; color: #4883ff">3</font></font>
							</h6> <span><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">픽로드</font></font></span>
						</li>
						<li>
							<h6>
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit; color: #4883ff">4</font></font>
							</h6> <span><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">보관함</font></font></span>
						</li>
						<li>
							<h6>
								<font style="vertical-align: inherit;"><font
									style="vertical-align: inherit; color: #4883ff">7</font></font>
							</h6> <span><font style="vertical-align: inherit;"><font
									style="vertical-align: inherit;">내 필터</font></font></span>
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




<section class="light-bg booking-details_wrap">
	<div class="container">
		<div class="row">
			<div class="col-md-8 responsive-wrap">
				<div class="booking-checkbox_wrap">
					<div class="booking-checkbox">
						<div class="customer-content">
                                    <div class="customer-review">
                                        <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">가산역 최고의 장소</font></font></h3>
                      
                                        <p>
                                        <font style="vertical-align: inherit;">2019-05-29 12:30:15</font></p>
                                    </div>
                                    <div class="customer-rating"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">보관함 담기</font></font></div>
                                </div>
						<hr>
						
						<canvas style="background-color:#ececec;width:100%;height:auto;" id="canvas"></canvas>
						
						<hr>
						<p>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">
								사진 위치 내용 소개하기</font></font>
						</p>
						<hr>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label class="custom-checkbox"> <span
								class="custom-control-description">
								<span><i class="zmdi zmdi-filter-frames zmdi-hc-lg"></i></span><font
										style="vertical-align: inherit;">Vintage</font></span>
							</label>
						</div>						
					</div>
				</div>
			</div>
			<div class="col-md-4 responsive-wrap">
				<div class="contact-info">
					<img src="<c:url value='/resources/images/test/map.jpg'/>"
						class="img-fluid" alt="#">
					<div class="address">
						<span><i class="zmdi zmdi-pin zmdi-hc-lg"></i></span>

						<p>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;"> 서울특별시 </font></font><br>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;"> 금천구</font></font><br>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">426-5 &amp; 가산동</font><font
								style="vertical-align: inherit;"> 월드 메르디앙 벤처 센터 2 차 </font></font><br>
							<font style="vertical-align: inherit;"><font
								style="vertical-align: inherit;">311호</font></font>
						</p>
					</div>

					<a class="btn btn-outline-danger btn-contact" onclick="fn_spread('crowling_result');">
					<font style="vertical-align: inherit;">+ 이 지역 관련 검색어</font></a>
				</div>
				<div class="follow" id="crowling_result" style="display:none;">
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
</section>

<script type="text/javascript">

function fn_spread(id){
    var getID = document.getElementById(id);
    getID.style.display=(getID.style.display=='none') ? 'block' : 'none';
}


</script>
