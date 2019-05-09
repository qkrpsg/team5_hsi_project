<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

			daum.maps.event.addListener(marker, 'click', function(mouseEvent) {
				
				
				
		
				
				////////////////////////////
				
				
				
				
				
				var naiyo = '<div class="category_list">'
					+'<div class="l_f"><img src="<c:url  value='/resources/images/map/l_f.png'/>" /></div>'
					+'<div class="x_f">'
					+'<img src="<c:url  value='/resources/images/map/x_f.png'/>"/>'
					+'<p>'+title+'</p>'
					+'<p>거리 ?m</p>'
					+'<p>도보 ?분 승용차 ?분</p>'
					+'</div>'
					+'</div>';
					
				// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
					infowindow.open(map, marker);
					$(".end_btn").click(function(){
						infowindow.close();
					});
					
					$('.suika').click(function(){
						
						
						//var clickPosition = mouseEvent.latLng;
						var clickPosition =  [];  //'('+mapy+','+mapx+')';
						clickPosition.push(mapx);
						clickPosition = new daum.maps.LatLng(mapy, mapx);
						
						console.log('여기옴?'+typeof(clickPosition));
						console.log('여기옴?'+clickPosition);
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
						}
						
						
						
						// 지도에 마우스무브 이벤트를 등록합니다
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

						// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
						// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
						daum.maps.event.addListener(map, 'rightclick', function(mouseEvent) {

							// 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
							if (drawingFlag) {

								// 마우스무브로 그려진 선은 지도에서 제거합니다
								moveLine.setMap(null);
								moveLine = null;

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

									// 선을 구성하는 좌표의 개수가 1개 이하이면 
									// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
									deleteClickLine();
									deleteCircleDot();
									deleteDistnce();

								}

								// 상태를 false로, 그리지 않고 있는 상태로 변경합니다
								drawingFlag = false;
							}
						});

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
									zIndex : 3
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
								zIndex : 1
							});

							// 지도에 표시합니다
							circleOverlay.setMap(map);

							if (distance > 0) {
								// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
								var distanceOverlay = new daum.maps.CustomOverlay(
										{
											content : '<div class="dotOverlay">거리 <span class="number">'
													+ distance + '</span>m</div>',
											position : position,
											yAnchor : 1,
											zIndex : 2
										});

								// 지도에 표시합니다
								distanceOverlay.setMap(map);
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
							var bycicleTime = distance / 227 | 0;
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
						
						//////////////////////////////////////////////////////////////////////
						
						
						
						
						
					
						//category_wrap2
						var category_wrap2 = document.getElementsByClassName('category_wrap2')[0];
						
						category_wrap2.innerHTML += naiyo;
					});
					
					
					
					
					
					
			});
			return marker;
		}
		
		
		
		
		
		
		
		
		
	
		
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
		
		
		category_form
		
		
		
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
							var bycicleTime = distance / 227 | 0;
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

							
							
								var walkHour1 = '', walkMin1 = '';
							return content;
						}
						
		byciclegikan
		walkgikan
		//에이작스  값을 넣어줍니다
		
		ajaxData=data;
		
		크리에이트 마커스
		마커 이미지
		,ajaxData[i].title,ajaxData[i].addr1,ajaxData[i].tel,ajaxData[i].zipcode,ajaxData[i].mapy,ajaxData[i].mapx
		
		
		
		
		
		
		
		
		
		