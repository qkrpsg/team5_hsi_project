<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<link href="<c:url value='/css/test/style3.css'/>" rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/css/test/themify-icons.css'/>">
<link rel="stylesheet"
	href="<c:url value='/css/test/simple-line-icons.css'/>">
<link rel="stylesheet"
	href="<c:url value='/css/test/material-design-iconic-font.min.css'/>">
<%-- <link href="<c:url value='/css/test/ionicons.css'/>" rel="stylesheet">  --%>
<script src="<c:url value='/js/test/tether.min.js'/>"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=750e581d29f9f411452640632fee1ead&libraries=services"></script>
<<style>
.map_wrap {
	position: relative;
	width: 100%;
	height: 1900px;
}

.title {
	font-weight: bold;
	display: block;
}

.hAddr {
	position: absolute;
	left: 10px;
	top: 10px;
	border-radius: 2px;
	background: #fff;
	background: rgba(255, 255, 255, 0.8);
	z-index: 1;
	padding: 5px;
}

#centerAddr {
	display: block;
	margin-top: 2px;
	font-weight: normal;
}

.bAddr {
	padding: 5px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
.map_wrap{
	height: 300px;
}
@media screen and (max-width:1000px) and (min-width:0px){
.map_wrap{
	height: 500px;
}



</style>
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
					<!-- <h4 class="font-yellow">프로필수정</h4> -->
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




<section class="light-bg booking-details_wrap">
	<div class="container">
		<div class="row">
		
			<div class="col-md-8 responsive-wrap">
				<div class="booking-checkbox_wrap">
					<div class="booking-checkbox">
						<div class="customer-content">
                                    <div class="customer-review">
                                        <h3><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">${list.PPB_TITLE }</font></font></h3>
                      											
                      												<c:set var="list2"  value="${list.PPB_POST_DATE }"/> 
                                        <p><font style="vertical-align: inherit;">${fn:substring(list2,0,11) }</font></p>
                                    </div>
                                    <div class="customer-rating"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">보관함 담기</font></font></div>
                                </div>
						<hr>
						
						<img src="${list.PPB_IMAGE_PATH }" style="background-color:#ececec;width:100%;height:auto;cursor: pointer;" class="img_click" />
						<input type="hidden" class="lat" name="lat" value="${list.PPB_LONGITUDE }"/><!-- 경도 -->
						<input type="hidden" class="lng" name="lng" value="${list.PPB_LATITUDE }"/><!-- 위도 -->
						<hr>
						<p>
							<font style="vertical-align: inherit;">
								<font style="vertical-align: inherit;">
									${list.PPB_CONTENT }
								</font>
							</font>
						</p>
						<hr>
					</div>
					<div class="row">
						<div class="col-md-4">
							<label class="custom-checkbox"> <span
								class="custom-control-description">
								<span><i class="zmdi zmdi-filter-frames zmdi-hc-lg"></i></span><font
										style="vertical-align: inherit;">${list.F_NAME }</font></span>
							</label>
						</div>						
					</div>
				</div>
			</div>
			<div class="col-md-4 responsive-wrap">
				<div class="contact-info">
					<%-- <img src="<c:url value='/resources/images/test/map.jpg'/>"
						class="img-fluid" alt="#"> --%>
						
						<div class="map_wrap" style="">
							<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
								<div class="hAddr">
									<span id="centerAddr"></span>
								</div>
							<p id="result" style=""></p>	
						</div>
						
						
						
						
						
					<div class="address">
						<span><i class="zmdi zmdi-pin zmdi-hc-lg"></i></span>

						<p>
						<c:set var="addr" value="${list.PPB_ADDR1 }"/>
							<font style="vertical-align: inherit;">
								<font style="vertical-align: inherit;"> ${addr } </font><br />
								<font style="vertical-align: inherit;"> ${list.PPB_ADDR2 } </font>
							</font>
							<br>
							
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

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
	center : new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	level : 3
// 지도의 확대 레벨
};

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption);

// 주소-좌표 변환 객체를 생성합니다
console.log('hi' + new daum.maps.services.Geocoder());
var geocoder = new daum.maps.services.Geocoder();

var marker = new daum.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
infowindow = new daum.maps.InfoWindow({
	zindex : 1
}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다


$(document).ready(function() {	
	console.log("위도"+$('.lng').val());//위도
	console.log("경도"+$('.lat').val());// 경도
	function setCenter() {            
	    // 이동할 위도 경도 위치를 생성합니다 
	    var moveLatLon = new daum.maps.LatLng($('.lng').val(), $('.lat').val());
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	}
	var markerPosition  = new daum.maps.LatLng($('.lng').val(), $('.lat').val()); 
	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	setCenter();
});
 
function fn_spread(id){
    var getID = document.getElementById(id);
    getID.style.display=(getID.style.display=='none') ? 'block' : 'none';
}


</script>
