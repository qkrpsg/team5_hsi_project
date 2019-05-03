<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <title>Marker Clustering</title>
    <style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      
     #mapwrap{position:relative;overflow:hidden;}
.category, .category *{margin:0;padding:0;color:#000;}
.category ul{}   
.category {position:absolute;overflow:hidden;top:200px;left:10px;width:250px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
.category li{list-style:none;float:left;width:50px;height:45px;padding-top:5px;cursor:pointer;} 
.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
.category .ico_coffee {background-position:-10px 0;}  
.category .ico_store {background-position:-10px -36px;}   
.category .ico_carpark {background-position:-10px -72px;} 
    </style>
    
   
    
    
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
    <div id="map" style="width:100%;"></div>
    <!-- 지도 위에 표시될 마커 카테고리 -->
    <div class="category">
        <ul>
            <li id="coffeeMenu" class="coffee" onclick="">
                <span class="ico_comm ico_coffee"></span>
                커피숍
            </li>
            <li id="storeMenu" onclick="changeMarker('store')">
                <span class="ico_comm ico_store"></span>
                편의점
            </li>
            <li id="carparkMenu" onclick="changeMarker('carpark')">
                <span class="ico_comm ico_carpark"></span>
                주차장
            </li>
            
             <li id="Menu" >
                <span class="ico_comm ico_carpark"></span>
                test
            </li>
        </ul>
    </div>
    
    
</div>

	    
	    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=750e581d29f9f411452640632fee1ead"></script>
    <script>
    
  		
    
    
    	  
    	  
    	  
    	  
    	  
    	  
      var map;
      window.onload = function(){
    	  navigator.geolocation.getCurrentPosition(sucCall);
      }
      var sucCall = function (position) {
          //위도/경도 얻기]
          var lat = position.coords.latitude;
          var lng = position.coords.longitude;
          //지도표시하기
          displayMap(lat, lng);            

      }//////////////
      
      
      function displayMap(lat,lng) {
      var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
      var options = { //지도를 생성할 때 필요한 기본 옵션
      	center: new daum.maps.LatLng( 37.499590490909185, 127.0263723554437), //지도의 중심좌표. lat, lng
      //임시
      	level: 14 //지도의 레벨(확대, 축소 정도)
      };

      map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
      //지도에 마커 표시하기
      //setMarker(lat, lng,"<div style='padding:5px'>현재 나의 위치</div>");
      }///////////displayMap(lat,lng)
      
      /* */
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
       
        
        
        $("#map").css("height",document.body.scrollHeight);// 맵 높이 값 
	    	$('#storeMenu').click(function(){//여행코스 서울
	    		var contenttypeid = 25;
	    		var areacode = 1;
	    		var numOfRows = 12;
	    	}); 
			$('#carparkMenu').click(function(){ //문화 시설
				var contenttypeid = 14;
	    		var areacode = 32;
	    		var numOfRows = 12;
	    	});
        
      	 $('#coffeeMenu').click(function(){
      		var contenttypeid = 39;
    		var areacode = 39;
    		var numOfRows = 12;
      		//이건 음식점 받아오는 코드이다(제주도)
  			 $.ajax({
  				url:'<c:url value="/tourapi/download_csv.do"/>',
  				dataType:'json',//json
  				data:{contenttypeid:contenttypeid,areacode:areacode,numOfRows:numOfRows}, 
  				success:function(data){
					successAjax(data);					
				}
  				/* success:function(data){
  					//console.log("data111:"+data);
  					$.each(data,function(key,value){
  						mapy.push(value['mapy']);
  						mapx.push(value['mapx']);
  					});
  				} */,
  				error:function(request,error){
  					console.log('상태코드111:',request.status);
  					console.log('서버로부터 받은 HTML데이타 222:',request.responseText);
  					console.log('에러333:',error);					
  				}				
  			});	//ajax 끝 
  		});//click
        
  		
  		
  		
  		var coffeePositions =[];
  		var mapy=[]; //lat
  		var mapx=[];//lng
  		
      	var successAjax= function(data){
      		mapy = [];
      		mapx = [];
    		$.each(data,function(key,value){
    			
    				mapy.push(value['mapy']);
    				mapx.push(value['mapx']);
    				console.log("successAjax::"+mapy.length);
    				//coffeePositions.push("new daum.maps.LatLng("+value['mapy']+","+value['mapx']+")");
    					
    		});
    		
    		coffeePositions.length = 0;
    		for(var i=0;i<mapy.length;i++){
    			//coffeePositions.push("new daum.maps.LatLng("+mapy[i]+","+mapx[i]+")");
    			
    			coffeePositions.push(new daum.maps.LatLng(mapy[i],mapx[i]));
	        }
    		
	
    		
    		/* coffeePositions = [
         	    new daum.maps.LatLng(37.499590490909185, 127.0263723554437),
         	    new daum.maps.LatLng(37.499427948430814, 127.02794423197847),
         	    new daum.maps.LatLng(37.498553760499505, 127.02882598822454),
         	    new daum.maps.LatLng(37.497625593121384, 127.02935713582038),
         	    new daum.maps.LatLng(37.49646391248451, 127.02675574250912),
         	    new daum.maps.LatLng(37.49629291770947, 127.02587362608637),
         	    new daum.maps.LatLng(37.49754540521486, 127.02546694890695)                
         	];   */
             
        	// 편의점 마커가 표시될 좌표 배열입니다
        	var storePositions = [
        	    new daum.maps.LatLng(37.497535461505684, 127.02948149502778),
        	    new daum.maps.LatLng(37.49671536281186, 127.03020491448352),
        	    new daum.maps.LatLng(37.496201943633714, 127.02959405469642),
        	    new daum.maps.LatLng(37.49640072567703, 127.02726459882308),
        	    new daum.maps.LatLng(37.49640098874988, 127.02609983175294),
        	    new daum.maps.LatLng(37.49932849491523, 127.02935780247945),
        	    new daum.maps.LatLng(37.49996818951873, 127.02943721562295)
        	];

        	// 주차장 마커가 표시될 좌표 배열입니다
        	var carparkPositions = [
        	    new daum.maps.LatLng(37.49966168796031, 127.03007039430118),
        	    new daum.maps.LatLng(37.499463762912974, 127.0288828824399),
        	    new daum.maps.LatLng(37.49896834100913, 127.02833986892401),
        	    new daum.maps.LatLng(37.49893267508434, 127.02673400572665),
        	    new daum.maps.LatLng(37.49872543597439, 127.02676785815386),
        	    new daum.maps.LatLng(37.49813096097184, 127.02591949495914),
        	    new daum.maps.LatLng(37.497680616783086, 127.02518427952202)                       
        	];    

        	
         
        	

    		var markerImageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png';  // 마커이미지의 주소입니다. 스프라이트 이미지 입니다
    	    coffeeMarkers = []; // 커피숍 마커 객체를 가지고 있을 배열입니다
    	    storeMarkers = []; // 편의점 마커 객체를 가지고 있을 배열입니다
    	    carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다

    	    
    	createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
    	createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
    	createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

    	changeMarker('coffee'); // 지도에 커피숍 마커가 보이도록 설정합니다    


    	// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
    	function createMarkerImage(src, size, options) {
    	    var markerImage = new daum.maps.MarkerImage(src, size, options);
    	    return markerImage;            
    	}

    	// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
    	function createMarker(position, image) {
    	    var marker = new daum.maps.Marker({
    	        position: position,
    	        image: image
    	    });
    	    
    	    return marker;  
    	}   
    	
    	
    	
    	
    	   
    	// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
    	function createCoffeeMarkers() {
    	    
    	    for (var i = 0; i < coffeePositions.length; i++) {  
    	        
    	        var imageSize = new daum.maps.Size(22, 26),
    	            imageOptions = {  
    	                spriteOrigin: new daum.maps.Point(10, 0),    
    	                spriteSize: new daum.maps.Size(36, 98)  
    	            };     
    	        
    	        // 마커이미지와 마커를 생성합니다
    	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
    	            marker = createMarker(coffeePositions[i], markerImage);  
    	        
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
    	        
    	        var imageSize = new daum.maps.Size(22, 26),
    	            imageOptions = {   
    	                spriteOrigin: new daum.maps.Point(10, 36),    
    	                spriteSize: new daum.maps.Size(36, 98)  
    	            };       
    	     
    	        // 마커이미지와 마커를 생성합니다
    	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
    	            marker = createMarker(storePositions[i], markerImage);  

    	        // 생성된 마커를 편의점 마커 배열에 추가합니다
    	        storeMarkers.push(marker);    
    	    }        
    	}

    	// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
    	function setStoreMarkers(map) {        
    	    for (var i = 0; i < storeMarkers.length; i++) {  
    	        storeMarkers[i].setMap(map);
    	    }        
    	}

    	// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
    	function createCarparkMarkers() {
    	    for (var i = 0; i < carparkPositions.length; i++) {
    	        
    	        var imageSize = new daum.maps.Size(22, 26),
    	            imageOptions = {   
    	                spriteOrigin: new daum.maps.Point(10, 72),    
    	                spriteSize: new daum.maps.Size(36, 98)  
    	            };       
    	     
    	        // 마커이미지와 마커를 생성합니다
    	        var markerImage = createMarkerImage(markerImageSrc, imageSize, imageOptions),    
    	            marker = createMarker(carparkPositions[i], markerImage);  

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
    	function changeMarker(type){
    	    
    	    var coffeeMenu = document.getElementById('coffeeMenu');
    	    var storeMenu = document.getElementById('storeMenu');
    	    var carparkMenu = document.getElementById('carparkMenu');
    	    
    	    // 커피숍 카테고리가 클릭됐을 때
    	    if (type === 'coffee') {
    	    
    	        // 커피숍 카테고리를 선택된 스타일로 변경하고
    	        coffeeMenu.className = 'menu_selected';
    	        
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
    	        storeMenu.className = 'menu_selected';
    	        carparkMenu.className = '';
    	        
    	        // 편의점 마커들만 지도에 표시하도록 설정합니다
    	        setCoffeeMarkers(null);
    	        setStoreMarkers(map);
    	        setCarparkMarkers(null);
    	        
    	    } else if (type === 'carpark') { // 주차장 카테고리가 클릭됐을 때
    	     
    	        // 주차장 카테고리를 선택된 스타일로 변경하고
    	        coffeeMenu.className = '';
    	        storeMenu.className = '';
    	        carparkMenu.className = 'menu_selected';
    	        
    	        // 주차장 마커들만 지도에 표시하도록 설정합니다
    	        setCoffeeMarkers(null);
    	        setStoreMarkers(null);
    	        setCarparkMarkers(map);  
    	    }    
    	} 
    		
    		
    		
    		
    		
    	}/////////////////
        
    	$('#map').click(function(){
    		console.log(mapy.length);
    		
    		console.log("asdsad"+coffeePositions);
        		
    		
    		
    		
    		
    		
    		
    		
    	});
    	
    	$('#Menu').click(function(){
    		//console.log("asdsad::::::::::"+coffeePositions);
        	
    		
    	});
    	
    	
    	 /*$('#carparkMenu').click(function(){
     		console.log("asdsad::::::::::"+coffeePositions);
     	}); */
		 
     	
		
    	
    	
    	
    	
    	
    	
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