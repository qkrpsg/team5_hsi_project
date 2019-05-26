<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/css/Place_Map.css'/>" rel="stylesheet">
<script src="<c:url value='/js/Place_Map.js'/>"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=750e581d29f9f411452640632fee1ead&libraries=services"></script>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Marker Clustering</title>

<style>
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
</style>

<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="map_wrap">
		<div id="map"
			style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		<div class="hAddr">

			<span id="centerAddr"></span>
		</div>
		<p id="result" style=""></p>

	</div>




	<script>
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
		
		// 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
		searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		var lat_,lng_,addr_;
		
		// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
		daum.maps.event
				.addListener(map,'click',function(mouseEvent) {
							
							var latlng = mouseEvent.latLng;
							lat_ = latlng.getLat();
							lng_ = latlng.getLng();
							var message = '클릭한 위치의 위도는 ' + latlng.getLat()
									+ ' 이고, ';
							message += '경도는 ' + latlng.getLng() + ' 입니다';
							var resultDiv = document.getElementById('result');
							resultDiv.innerHTML = message;

							
							searchDetailAddrFromCoords(
									mouseEvent.latLng,
									function(result, status) {
										
										if (status === daum.maps.services.Status.OK) {
											
											var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
													+ result[0].road_address.address_name
													+ '</div>'
													: '';
											detailAddr += '<div>지번 주소 : '
													+ result[0].address.address_name
													+ '</div>';
											addr_ = result[0].address.address_name;
											var content = '<div class="bAddr" style="overflow: hidden;">'
													+'<div class="addr">' +detailAddr+'</div>'
													+ '<div style="float:right;"><a href="#" id="moveBtn" style="color:red;cursor: pointer;">작성하기</a></div>'
											'</div>';
											//   /pickpic/friends/place_write.pic
											// 마커를 클릭한 위치에 표시합니다 
											marker.setPosition(mouseEvent.latLng);
											marker.setMap(map);

											// 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
											infowindow.setContent(content);
											infowindow.open(map, marker);
										}
									});
						});

		// 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
		daum.maps.event.addListener(map, 'idle', function() {
			
			searchAddrFromCoords(map.getCenter(), displayCenterInfo);
		});

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function searchDetailAddrFromCoords(coords, callback) {
			// 좌표로 법정동 상세 주소 정보를 요청합니다
			geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
		}

		// 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
		function displayCenterInfo(result, status) {
			if (status === daum.maps.services.Status.OK) {
				var infoDiv = document.getElementById('centerAddr');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}
			}
		}

		$(document).ready(function() {
			$(document).on("click", "#moveBtn", function(event) {
				//동적으로 생성 후 클릭 하는 방법입니니다
					console.log("나오냐lat:"+lat_);
					console.log("나오냐lng_"+lng_);
					console.log('addr:::'+addr_);
					/* 
					위도 : ppb_latitude
					경도 : ppb_longitude
					지번주소 : ppb_addr1
					*/
					var form = document.createElement("form");
					form.setAttribute("charset", "UTF-8");
					form.setAttribute("method", "Post"); //Post 방식
					form.setAttribute("action", "/pickpic/friends/place_write.pic"); //요청 보낼 주소
					
					//위도
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", "ppb_latitude");
					hiddenField.setAttribute("value", lat_);
					form.appendChild(hiddenField);
					
					//경도
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", "ppb_longitude");
					hiddenField.setAttribute("value", lng_);
					form.appendChild(hiddenField);
					
					//지번
					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", "ppb_addr1");
					hiddenField.setAttribute("value", addr_);
					form.appendChild(hiddenField);

					var hiddenField = document.createElement("input");
					hiddenField.setAttribute("type", "hidden");
					hiddenField.setAttribute("name", "${_csrf.parameterName}");
					hiddenField.setAttribute("value", "${_csrf.token}");
					form.appendChild(hiddenField);
					
					document.body.appendChild(form);
					form.submit();
				
			});
		}); // end of ready()
		
	</script>



</body>
</html>
