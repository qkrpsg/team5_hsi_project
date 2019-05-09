<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/css/Map.css'/>" rel="stylesheet">
<script src="<c:url value='/js/Map.js'/>"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=750e581d29f9f411452640632fee1ead"></script>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<title>Marker Clustering</title>


<script type="text/javascript">

</script>
</head>
<body>



	<!--<div style="width:200px;height:100%;background:white;position:absolute;top:0;left:0;z-index:1;border:1px red solid;">
           <input type="button" id="btnAjaxJson" name="btnAjaxJson" class="like_conbini" value="음식점" style="margin-top:300px;"/>
           <input type="button" id="btnAjaxJson2" name="btnAjaxJson2" class="like_conbini2" value="음식점2" style="margin-top:300px;"/>
        
           <a href="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=A2dHFUxH72X%2BT%2Br66B8tkGckWP9SAktj5ZoV43XBB2OH2T5TA6r8W9VN%2FL%2F1nIc5I3SpAuLm%2FtBIpLVGb2jfvg%3D%3D&contentTypeId=39&areaCode=39&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1">>여기를 눌러보세요</a>
           <a href="http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=A2dHFUxH72X%2BT%2Br66B8tkGckWP9SAktj5ZoV43XBB2OH2T5TA6r8W9VN%2FL%2F1nIc5I3SpAuLm%2FtBIpLVGb2jfvg%3D%3D&contentTypeId=39&areaCode=39&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=12&pageNo=1">여눌러</a>
            
        </div>
      -->
	<div id="mapwrap">
		<!-- 지도가 표시될 div -->
		<div id="map" style="width: 100%;"></div>
		<!-- 지도 위에 표시될 마커 카테고리 -->

		<div class="category_wrap">
			<div class="write">
				<button class='btn btn-info'>작성하러 가기1</button>
			</div>
			<div class="category_wrap2">
				<form id="category_form"></form>
				<%--<div class="category_list">
				 	<div class="l_f"><img src="<c:url  value='/resources/images/map/l_f.png'/>" /></div>
					<div class="x_f">
						<img src="<c:url  value='/resources/images/map/x_f.png'/>"/>
						<p>이름 뿌려주기</p>
						<p>거리 ?m</p>
						<p>도보 ?분 승용차 ?분</p>
					</div>
				</div> --%>


			</div>




			<div class="category">
				<ul>
					<li id="coffeeMenu" class="f_f"><img
						src="<c:url value='/resources/images/map/f_f.png' />" /><span></span>
						음식점</li>
					<li id="storeMenu" class="k_f"><img
						src="<c:url value='/resources/images/map/k_f.png' />" /> <span></span>
						문화</li>
					<li id="carparkMenu" class="h_f"><img
						src="<c:url value='/resources/images/map/h_f.png' />" /> <span></span>
						숙박시설</li>
					<li id="Menu" class="c_f"><img
						src="<c:url value='/resources/images/map/c_f.png' />" /> <span></span>
						관광</li>
				</ul>
			</div>
		</div>

	</div>



	<script>
	
		
	
		var changeAs = "";
		var storePositions = [];
		var carparkPositions = [];
		var coffeePositions = [];
		var mapy = []; //lat
		var mapx = [];//lng
	
		var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
		var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
		var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
		var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
		var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.
		
		//내가 만든 변수
		var index_naiyo = 0;
		var old_distance = 0;
		var old_distance2 = 0;
		
		var walkgikan = '';
		var byciclegikan = '';
		
		var map;
		window.onload = function() {
			
			
			navigator.geolocation.getCurrentPosition(sucCall);
		}
		var sucCall = function(position) {
			//위도/경도 얻기]
			var lat = position.coords.latitude;
			var lng = position.coords.longitude;
			//지도표시하기
			displayMap(lat, lng);

		}//////////////

		function displayMap(lat, lng) {
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center : new daum.maps.LatLng(37.499590490909185,
						127.0263723554437), //지도의 중심좌표. lat, lng
				level : 9
			//지도의 레벨(확대, 축소 정도)
			};

			map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
			//지도에 마커 표시하기
			//setMarker(lat, lng,"<div style='padding:5px'>현재 나의 위치</div>");
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		}///////////displayMap(lat,lng)

		/* 
		/////// 마커 
		function setMarker(lat,lng,content) {
		      // 마커가 표시될 위치입니다 
		      var markerPosition = new daum.maps.LatLng(lat, lng);
		      // 마커를 생성합니다
		      var marker = new daum.maps.Marker({
		          position: markerPosition,
		          clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하도록 설정합니다
		      });
		      // 마커가 지도 위에 표시되도록 설정합니다
		      marker.setMap(map);
		      //마커에 클릭 이벤트 등록하기
		      setMarkerClick(marker,content);
		  }/////////////setMarker
		
		///// 마커 클릭 이벤트요
		function setMarkerClick(marker,content) {
		      var infowindow = new daum.maps.InfoWindow({
		          content: content,
		          removable: true
		      });
		      // 마커에 클릭이벤트를 등록합니다
		      daum.maps.event.addListener(marker, 'click', function () {
		          // 마커 위에 인포윈도우를 표시합니다
		          infowindow.open(map, marker);
		      });
		  }///////////////////setMarkerClick
		 */

		$("#map").css("height", document.body.scrollHeight);// 맵 높이 값 
		
		var ajaxData;
		$('#coffeeMenu').click(
				function() {
					changeAs = "coffee";

					var contenttypeid = 39;
					var areacode = 1;
					var numOfRows = 12;
					//이건 음식점 받아오는 코드이다(제주도)
					$.ajax({
						url : '<c:url value="/tourapi/download_csv.do"/>',
						dataType : 'json',//json
						data : {
							contenttypeid : contenttypeid,
							areacode : areacode,
							numOfRows : numOfRows
						},
						success : function(data) {
						
							console.log(data);
							ajaxData=data;
							
							successAjax(data);
							if (changeAs == 'coffee') {
								coffeePositions.length = 0;
								for (var i = 0; i < mapy.length; i++) {
									//위도/경도
									coffeePositions.push(new daum.maps.LatLng(
											mapy[i], mapx[i]));
									
								}
								createCoffeeMarkers();
								changeMarker(changeAs);
							}
						},
						error : function(request, error) {
							console.log('상태코드111:', request.status);
							console.log('서버로부터 받은 HTML데이타 222:',
									request.responseText);
							console.log('에러333:', error);
						}
					}); //ajax 끝 
		});//click
		
		$('#storeMenu').click(function() {//여행코스 서울
			changeAs = "store";
			var contenttypeid = 14;
			var areacode = 1;
			var numOfRows = 12;
			$.ajax({
				url : '<c:url value="/tourapi/download_csv.do"/>',
				dataType : 'json',//json
				data : {
					contenttypeid : contenttypeid,
					areacode : areacode,
					numOfRows : numOfRows
				},
				success : function(data) {
					ajaxData=data;
				
					successAjax(data);
					if (changeAs == 'store') {
						storePositions.length = 0;
						for (var i = 0; i < mapy.length; i++) {
							storePositions.push(new daum.maps.LatLng(
									mapy[i], mapx[i]));
						}
						createStoreMarkers();
						changeMarker(changeAs);
					}

				},
				error : function(request, error) {
					console.log('상태코드111:', request.status);
					console.log('서버로부터 받은 HTML데이타 222:', request.responseText);
					console.log('에러333:', error);
				}
			}); //ajax 끝 

		}); //$('#storeMenu').click(function()

		$('#carparkMenu').click(function() { //문화 시설
			changeAs = "carpark";

			var contenttypeid = 32;
			var areacode = 1;
			var numOfRows = 12;

			$.ajax({
				url : '<c:url value="/tourapi/download_csv.do"/>',
				dataType : 'json',//json
				data : {
					contenttypeid : contenttypeid,
					areacode : areacode,
					numOfRows : numOfRows
				},
				success : function(data) {
					ajaxData=data;
					successAjax(data);
					if (changeAs == 'carpark') {
						carparkPositions.length = 0;
						for (var i = 0; i < mapy.length; i++) {
							carparkPositions.push(new daum.maps.LatLng(
									mapy[i], mapx[i]));
						}
						createCarparkMarkers();
						changeMarker(changeAs);
					}

				},
				error : function(request, error) {
					console.log('상태코드111:', request.status);
					console.log('서버로부터 받은 HTML데이타 222:', request.responseText);
					console.log('에러333:', error);
				}
			}); //ajax 끝 
		});//ㄴ

		

		var successAjax = function(data) {
			mapy = [];
			mapx = [];
			$.each(data, function(key, value) {
				mapy.push(value['mapy']);//37.481868
				mapx.push(value['mapx']);//126.883202
			});
		}///////////////// 함수 커피!
		/* // 편의점 마커가 표시될 좌표 배열입니다
		var storePositions = [ new daum.maps.LatLng(37.481868, 126.883202),
				new daum.maps.LatLng(37.49671536281186, 127.03020491448352),
				new daum.maps.LatLng(37.496201943633714, 127.02959405469642),
				new daum.maps.LatLng(37.49640072567703, 127.02726459882308),
				new daum.maps.LatLng(37.49640098874988, 127.02609983175294),
				new daum.maps.LatLng(37.49932849491523, 127.02935780247945),
				new daum.maps.LatLng(37.49996818951873, 127.02943721562295) ];

		// 주차장 마커가 표시될 좌표 배열입니다
		var carparkPositions = [
				new daum.maps.LatLng(37.49966168796031, 127.03007039430118),
				new daum.maps.LatLng(37.499463762912974, 127.0288828824399),
				new daum.maps.LatLng(37.49896834100913, 127.02833986892401),
				new daum.maps.LatLng(37.49893267508434, 127.02673400572665),
				new daum.maps.LatLng(37.49872543597439, 127.02676785815386),
				new daum.maps.LatLng(37.49813096097184, 127.02591949495914),
				new daum.maps.LatLng(37.497680616783086, 127.02518427952202) ]; */
		var markerImageSrcA = '/pickpic/resources/images/map/f_b.png'; // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
		var markerImageSrcB = '/pickpic/resources/images/map/k_b.png'; 
		var markerImageSrcC = '/pickpic/resources/images/map/h_b.png';
		var markerImageSrcD = '/pickpic/resources/images/map/c_b.png';
		
	    //http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png
		
		coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
		storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
		carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

		createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
		createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
		createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

		/* coffeePositions = [];   */

		//changeMarker(changeAs); // 지도에 커피숍 마커가 보이도록 설정합니다    
		//changeMarker("coffee"); // 지도에 커피숍 마커가 보이도록 설정합니다    

		// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다

		function createMarkerImage(src, size, options) {
			var markerImage = new daum.maps.MarkerImage(src, size, options);
			return markerImage;
		}

		// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
		function createMarker(position, image,title,addr1,tel,zipcode,mapy,mapx,ajaxData_i) {
			var marker = new daum.maps.Marker({
				position : position,
				image : image
			});
	
			var iwContent = '<div style="padding:5px;width:200px;overflow:hidden;z-index:9999;">'
							+'<div style="float:right;display:block;"><img src="/pickpic/resources/images/map/x_f.png"  class="end_btn" style="z-index:9999;" /></div>'
							+'<div style="width:80%;float:left;display:block;word-break:break-all;"><p style="color:#333;">'+title+'</p></div>'
							+'<div style="clear: both;"><p style="color:#333;">'+addr1+'</p><span style="color:#999">'+tel+'</span><br /><span style="font-size:0.8em;color:#999;">( 우편번호:'+zipcode+' )</span><span style="font-size:0.8em;color:#333;right:0px;cursor: pointer;margin-left:5px;z-index:9999;" class="suika">추가</span></div>'
							+''
							+'</div>';
							// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			
			
			
							
			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
				content : iwContent
			});
			
							
			// 마커에 마우스오버 이벤트를 등록합니다
			daum.maps.event.addListener(marker, 'click', function(mouseEvent) {
				////////////////////////////
				// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
					infowindow.open(map, marker);
					$(".end_btn").click(function(){
						infowindow.close();
					});
					
					
					
					
					$('.suika').click(function(){
						
						
						//var clickPosition = mouseEvent.latLng;
						//var clickPosition =  [];  //'('+mapy+','+mapx+')';
						//clickPosition.push(mapx);
						clickPosition = new daum.maps.LatLng(mapy, mapx);
						
						
						// 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
						if (!drawingFlag) {

							// 상태를 true로, 선이 그리고있는 상태로 변경합니다
							drawingFlag = true;

							// 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
							deleteClickLine();

							// 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
							deleteDistnce();

							// 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
							deleteCircleDot();

							// 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
							clickLine = new daum.maps.Polyline({
								map : map, // 선을 표시할 지도입니다 
								path : [ clickPosition ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
								strokeWeight : 3, // 선의 두께입니다 
								strokeColor : '#db4040', // 선의 색깔입니다
								strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
								strokeStyle : 'solid' // 선의 스타일입니다
							});

							// 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
							moveLine = new daum.maps.Polyline({
								strokeWeight : 3, // 선의 두께입니다 
								strokeColor : '#db4040', // 선의 색깔입니다
								strokeOpacity : 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
								strokeStyle : 'solid' // 선의 스타일입니다    
							});

							// 클릭한 지점에 대한 정보를 지도에 표시합니다
							displayCircleDot(clickPosition, 0);

						} else { // 선이 그려지고 있는 상태이면
							
							// 그려지고 있는 선의 좌표 배열을 얻어옵니다
							var path = clickLine.getPath();

							// 좌표 배열에 클릭한 위치를 추가합니다
							path.push(clickPosition);

							// 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
							clickLine.setPath(path);

							var distance = Math.round(clickLine.getLength());
							displayCircleDot(clickPosition, distance);
							//2 줄로 총거리와 도보 자전거 시간을 구할 수 있다
							content = getTimeHTML(distance);
							showDistance(content, path[path.length -1]);
							
							
							
							
						}
						
						
						
						/* // 지도에 마우스무브 이벤트를 등록합니다
						// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
						daum.maps.event
								.addListener(
										map,
										'mousemove',
										function(mouseEvent) {

											// 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
											if (drawingFlag) {

												// 마우스 커서의 현재 위치를 얻어옵니다 
												var mousePosition = mouseEvent.latLng;

												// 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
												var path = clickLine.getPath();

												// 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
												var movepath = [ path[path.length - 1],
														mousePosition ];
												moveLine.setPath(movepath);
												moveLine.setMap(map);

												var distance = Math.round(clickLine.getLength()
														+ moveLine.getLength()), // 선의 총 거리를 계산합니다
												content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">'
														+ distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다

												// 거리정보를 지도에 표시합니다
												showDistance(content, mousePosition);
											}
										});
 */
						// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
						// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
						/* daum.maps.event.addListener(map, 'rightclick', function(mouseEvent) {

							// 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
							if (drawingFlag) {

								// 마우스무브로 그려진 선은 지도에서 제거합니다
								moveLine.setMap(null); //이건 남기자
								moveLine = null;	   //이건 남기자

								// 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
								var path = clickLine.getPath();

								// 선을 구성하는 좌표의 개수가 2개 이상이면
								if (path.length > 1) {

									// 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
									if (dots[dots.length - 1].distance) {
										dots[dots.length - 1].distance.setMap(null);
										dots[dots.length - 1].distance = null;
									}

									var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
									content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

									// 그려진 선의 거리정보를 지도에 표시합니다
									showDistance(content, path[path.length - 1]);

								} else { 
									//이건 남기자
									// 선을 구성하는 좌표의 개수가 1개 이하이면 
									// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
									deleteClickLine();
									deleteCircleDot();
									deleteDistnce();

								}
								//이건 남기자
								// 상태를 false로, 그리지 않고 있는 상태로 변경합니다
								drawingFlag = false;
							}
						}); */

						// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
						function deleteClickLine() {
							if (clickLine) {
								clickLine.setMap(null);
								clickLine = null;
							}
						}

						// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
						// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
						function showDistance(content, position) {

							if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면

								// 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
								distanceOverlay.setPosition(position);
								distanceOverlay.setContent(content);

							} else { // 커스텀 오버레이가 생성되지 않은 상태이면

								// 커스텀 오버레이를 생성하고 지도에 표시합니다
								distanceOverlay = new daum.maps.CustomOverlay({
									map : map, // 커스텀오버레이를 표시할 지도입니다
									content : content, // 커스텀오버레이에 표시할 내용입니다
									position : position, // 커스텀오버레이를 표시할 위치입니다.
									xAnchor : 0,
									yAnchor : 0,
									zIndex : 0
								});
							}
						}

						// 그려지고 있는 선의 총거리 정보와 
						// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
						function deleteDistnce() {
							if (distanceOverlay) {
								distanceOverlay.setMap(null);
								distanceOverlay = null;
							}
						}

						// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
						// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
						function displayCircleDot(position, distance) {

							// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
							var circleOverlay = new daum.maps.CustomOverlay({
								content : '<span class="dot"></span>',
								position : position,
								zIndex : 0
							});

							// 지도에 표시합니다
							circleOverlay.setMap(map);

							if (distance > 0) {
								// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
								var distanceOverlay = new daum.maps.CustomOverlay(
										{
											content : '<div class="dotOverlay" >거리 <span class="number">'
													+ distance + '</span>m</div>',
											position : position,
											yAnchor : 1,
											zIndex : 0
										});

								// 지도에 표시합니다
								//distanceOverlay.setMap(map);
								
							}

							// 배열에 추가합니다
							dots.push({
								circle : circleOverlay,
								distance : distanceOverlay
							});
						}

						// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
						function deleteCircleDot() {
							var i;

							for (i = 0; i < dots.length; i++) {
								if (dots[i].circle) {
									dots[i].circle.setMap(null);
								}

								if (dots[i].distance) {
									dots[i].distance.setMap(null);
								}
							}

							dots = [];
						}
						var naiyo = '';
						// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
						// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
						// HTML Content를 만들어 리턴하는 함수입니다
						function getTimeHTML(distance) {

							// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
							var walkkTime = distance / 67 | 0;
							var walkHour = '', walkMin = '';

							// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
							if (walkkTime > 60) {
								walkHour = '<span class="number">' + Math.floor(walkkTime / 60)
										+ '</span>시간 '
							}
							walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

							// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
							var bycicleTime = distance / 454 | 0;
							var bycicleHour = '', bycicleMin = '';

							// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
							if (bycicleTime > 60) {
								bycicleHour = '<span class="number">'
										+ Math.floor(bycicleTime / 60) + '</span>시간 '
							}
							bycicleMin = '<span class="number">' + bycicleTime % 60
									+ '</span>분'

							// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
							var content = '<ul class="dotOverlay distanceInfo">';
							content += '    <li>';
							content += '        <span class="label">총거리</span><span class="number">'
									+ distance + '</span>m';
							content += '    </li>';
							content += '    <li>';
							content += '        <span class="label">도보</span>' + walkHour
									+ walkMin;
							content += '    </li>';
							content += '    <li>';
							content += '        <span class="label">자전거</span>' + bycicleHour
									+ bycicleMin;
							content += '    </li>';
							content += '</ul>'

							
							
								
							return content;
						}
						
							
						
						if(distance == undefined){
							
							distance = '0';
						}else{
							
						}
						
						
						
						
						var walkkTime1 =  (distance - old_distance2) / 67 | 0;
						var walkHour1 = '', walkMin1 = '';
						if (walkkTime1 > 60) {
							walkHour1 =  Math.floor(walkkTime1 / 60);
							walkgikan ='시간';
						}
						walkMin1 = walkkTime1 % 60 ;
						
						var bycicleTime1 = (distance - old_distance2) / 454 | 0;
						var bycicleHour1 = '', bycicleMin1 = '';
						if (bycicleTime1 > 60) {
							bycicleHour1 =Math.floor(bycicleTime1 / 60) ; 
						 byciclegikan = '시간 ';
						}
						bycicleMin1 = bycicleTime1 % 60 ;
						var bun =  '분';
						
					
						index_naiyo++;
					
						
						/* var naiyo = '<input type="text" name="title1" value="abc" readonly />'; */
						console.log("ajaxData_i::::"+JSON.stringify(ajaxData_i).replace(/\"/gi,''));
						var ajaxData_str=JSON.stringify(ajaxData_i).replace(/\"/gi,'')
						console.log("ajaxData_i2"+ajaxData_i.title);
						var naiyo = 
									'<div class="category_list">'
									+'<div class="l_f"><img src="<c:url  value='/resources/images/map/l_f.png'/>" /></div>'
									+'<div class="x_f">'
									+'<img src="<c:url  value='/resources/images/map/x_f.png'/>"/>'
									+'<input type="hidden" name="title'+index_naiyo+'" value="'+ajaxData_str+'"  style="border:none;background:none;"/>'
									+'<p>거리  '+ (Math.floor( distance / 1000)-old_distance)+' km</p>'//'+distance+'
									+'<p>도보 '+walkHour1+''+walkgikan+''+walkMin1 +''+bun+'<br /> 승용차 '+bycicleHour1+''+byciclegikan+''+bycicleMin1+''+bun+'</p>'
									+'</div>'
									+'</div>';
									
							
									
						
						old_distance = Math.floor(distance / 1000);
						old_distance2 = distance;
						
						//////////////////////////////////////////////////////////////////////
						
						
						
						
					
						//category_form category_wrap2
					    /*
						var category_wrap2 = document.getElementById('category_form');
						console.log("=============="+toString.call(category_wrap2));
						//category_wrap2 = document.getElementsByClassName('category_wrap2')[0];
						category_wrap2.innerHTML += naiyo;
						*/
						formSubmit(naiyo);
						
						//$('.category_form').submit();
					});
					
					
					
					
					
					
			});
			return marker;
		}
		
		function formSubmit(data){
			var category_wrap2 = document.getElementById('category_form');
			/* console.log("=============="+data); */
			//category_wrap2 = document.getElementsByClassName('category_wrap2')[0];
			category_wrap2.innerHTML += data;
			/* console.log('aaaaaaaaa:'+document.getElementsByName('title1')[0].value) */
			
		}
		
		$('.btn-info').click(function(){
			/*
			console.log($('.x_f').find('input').val());
			var a = $('.x_f').find('input').val();
			console.log("a는 찍히나요?"+a);
			//action="<c:url value='/friends/write.pic'/>"
			
			alert($('#category_form').attr("action","/pickpic/friends/write.pic?title1=aaa"));
			$('#category_form').attr("action","/pickpic/friends/write.pic?test=aaa"+a);
			*/
			//$('#category_form').attr("action","/pickpic/friends/write.pic?test=1111");
			//$('#category_form').submit();
			var category_wrap2 = document.getElementById('category_form');
			category_wrap2.action="<c:url value='/friends/write.pic'/>"
			
			category_wrap2.submit();
		});
		

		// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
		function createCoffeeMarkers() {
			
			for (var i = 0; i < coffeePositions.length; i++) {

				var imageSize = new daum.maps.Size(40, 40), imageOptions = {
					spriteOrigin : new daum.maps.Point(0, 0),
					spriteSize : new daum.maps.Size(40, 40)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrcA, imageSize,
						imageOptions), marker = createMarker(
						coffeePositions[i], markerImage,ajaxData[i].title,ajaxData[i].addr1,ajaxData[i].tel,ajaxData[i].zipcode,ajaxData[i].mapy,ajaxData[i].mapx,ajaxData[i]);
					marker_i = i;
				// 생성된 마커를 커피숍 마커 배열에 추가합니다
				coffeeMarkers.push(marker);

			}

		}

		// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCoffeeMarkers(map) {

			for (var i = 0; i < coffeeMarkers.length; i++) {
				coffeeMarkers[i].setMap(map);
			}
		}

		// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
		function createStoreMarkers() {
			for (var i = 0; i < storePositions.length; i++) {

				var imageSize = new daum.maps.Size(40, 40), imageOptions = {
					spriteOrigin : new daum.maps.Point(0, 0),
					spriteSize : new daum.maps.Size(40, 40)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrcB, imageSize,
						imageOptions), marker = createMarker(storePositions[i],
						markerImage,ajaxData[i].title,ajaxData[i].addr1,ajaxData[i].tel,ajaxData[i].zipcode,ajaxData[i].mapy,ajaxData[i].mapx);

				// 생성된 마커를 편의점 마커 배열에 추가합니다
				storeMarkers.push(marker);
			}
		}

		// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setStoreMarkers(map) {

			for (var i = 0; i < storeMarkers.length; i++) {
				if (map == null) {
					storeMarkers[i].setMap(null);
				} else {
					storeMarkers[i].setMap(map);
				}
			}

		}

		// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
		function createCarparkMarkers() {
			for (var i = 0; i < carparkPositions.length; i++) {

				var imageSize = new daum.maps.Size(40, 40), imageOptions = {
					spriteOrigin : new daum.maps.Point(0, 0),
					spriteSize : new daum.maps.Size(40, 40)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrcC, imageSize,
						imageOptions), marker = createMarker(
						carparkPositions[i], markerImage,ajaxData[i].title,ajaxData[i].addr1,ajaxData[i].tel,ajaxData[i].zipcode,ajaxData[i].mapy,ajaxData[i].mapx);

				// 생성된 마커를 주차장 마커 배열에 추가합니다
				carparkMarkers.push(marker);
			}
		}

		// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCarparkMarkers(map) {
			for (var i = 0; i < carparkMarkers.length; i++) {
				carparkMarkers[i].setMap(map);
			}
		}

		// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type) {

			var coffeeMenu = document.getElementById('coffeeMenu');
			var storeMenu = document.getElementById('storeMenu');
			var carparkMenu = document.getElementById('carparkMenu');

			// 커피숍 카테고리가 클릭됐을 때
			if (type === 'coffee') {

				// 커피숍 카테고리를 선택된 스타일로 변경하고
				coffeeMenu.className = '';//menu_selected

				// 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
				storeMenu.className = '';
				carparkMenu.className = '';

				// 커피숍 마커들만 지도에 표시하도록 설정합니다
				setCoffeeMarkers(map);
				setStoreMarkers(null);
				setCarparkMarkers(null);
				

			} else if (type === 'store') { // 편의점 카테고리가 클릭됐을 때

				// 편의점 카테고리를 선택된 스타일로 변경하고
				coffeeMenu.className = '';
				storeMenu.className = '';
				carparkMenu.className = '';

				// 편의점 마커들만 지도에 표시하도록 설정합니다
				setCoffeeMarkers(null);
				setStoreMarkers(map);
				setCarparkMarkers(null);

			} else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때

				// 주차장 카테고리를 선택된 스타일로 변경하고
				coffeeMenu.className = '';
				storeMenu.className = '';
				carparkMenu.className = '';

				// 주차장 마커들만 지도에 표시하도록 설정합니다
				setCoffeeMarkers(null);
				setStoreMarkers(null);
				setCarparkMarkers(map);

			}
		}
		
		
		
		
		
		
		
		/* 
		// 마커에 마우스아웃 이벤트를 등록합니다
		daum.maps.event.addListener(marker, 'mouseout', function() {
		    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
		    infowindow.close();
		});
		 */
		
		
		
		
	</script>
	<script type="text/javascript">
		/*  var map;
		function initMap() {
		  map = new google.maps.Map(document.getElementById('map'), {
		    zoom: 2,
		    center: new google.maps.LatLng(2.8,-187.3),
		    mapTypeId: 'terrain'
		  });

		  // Create a <script> tag and set the USGS URL as the source.
		  var script = document.createElement('script');
		  // This example uses a local copy of the GeoJSON stored at
		  // http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.geojsonp
		  script.src = 'https://developers.google.com/maps/documentation/javascript/examples/json/earthquake_GeoJSONP.js';
		  document.getElementsByTagName('head')[0].appendChild(script);
		}//////////////
		
		 window.eqfeed_callback = function(results) {
		      for (var i = 0; i < results.features.length; i++) {
		        var coords = results.features[i].geometry.coordinates;
		        var latLng = new google.maps.LatLng(coords[1],coords[0]);
		        var marker = new google.maps.Marker({
		          position: latLng,
		          map: map
		        });
		      }
		    } *///구글 맵 나중에 해보자
	</script>
	<!-- <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkhKvFtIGbYlt2lsb2uVnrSK3gWSja-S0&callback=initMap"
    async defer></script> -->
</body>
</html>

<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkhKvFtIGbYlt2lsb2uVnrSK3gWSja-S0&callback=initMap"
    async defer></script> -->