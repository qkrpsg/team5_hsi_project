<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- MATERIAL DESIGN ICONIC FONT -->
<link rel="stylesheet"
	href="<c:url value='/css/test/material-design-iconic-font.min.css'/>">

<!-- STYLE CSS -->
<link rel="stylesheet" href="<c:url value='/css/test/style.css' />">
<link rel="stylesheet"href="<c:url value='/css/test/bootstrap-datetimepicker.min.css'/>" />
<link href="<c:url value='/css/FilterList.css'/>" rel="stylesheet">

<script type="text/javascript" src="<c:url value='/js/moment.min.js'/>"></script>
<script type="text/javascript"src="<c:url value='/js/test/bootstrap-datetimepicker.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/test/ko.js'/>"></script>
<script src="<c:url value='/js/caman.full.min.js'/>"></script>


<style>
.form-control {
	border-radius: 0px;
}
</style>


<!-- 픽플레이스 생성 폼 시작 -->
<div class="wrapper" style="background-color: #ececec;">
	<div class="inner">
		<form action="">
			<div class="image-holder">
				<canvas style="width:100%;height:auto;background-color:#ececec;" id="canvas" data-caman-hidpi-disabled="true"></canvas>
				<%-- <img
					src="<c:url value='/resources/images/filter/filter_default.jpg'/>"
					alt=""> --%>
			</div>

			<div class="btn-group" style="width: 100%">

				<div class="upload-btn-wrapper" >
					<button class="button" >+ 이미지</button>
					<input type="file" name="getfile" id="getfile" accept=".jpg, .png" />
				</div>		
				<button class="button" type="button" style="width: 50%" id="myfilter_btn">+ My 필터</button>
			</div>
		</form>
		<form action="">
			<h3>픽플레이스</h3>

			<div class="form-wrapper">
				<input type="text" placeholder="제목을 입력하세요." class="form-control2 title" value="${title}">
			</div>
			<div class="form-wrapper">
				<input type="text" placeholder="위치를 지정하세요. " class="form-control2 latlng" value="${ppb_addr1}" readonly>
				<i class="zmdi zmdi-pin zmdi-hc-lg latlng2" style="cursor: pointer;"></i>
			</div>
			<div class="form-wrapper">
				<input type="text" placeholder="상세주소" class="form-control2 addr" value="${addr }">
			</div>
			<div class="form-group">
				<div class='input-group date' id='datetimepicker'>
					<input type='text' class="form-control my_calendar" value="${my_calendar }"/> 
					<span class="input-group-addon"> 
						<span class="glyphicon glyphicon-calendar"> </span>
					</span>
				</div>
			</div>


			<div class="form-wrapper">
				<select name="" id="" class="form-control2 filter1" >
					<option value="" disabled selected>사용한 필터를 고르세요.</option>
					
					<c:forEach var="item" items="${list_filter }" varStatus="loop">
						<c:set var="str_f_name" value="${item.F_NAME }" />
						<option value="${item.F_NAME }">${item.F_NAME }</option>
					</c:forEach>
					
				</select> <i class="zmdi zmdi-caret-down zmdi-hc-2x"></i>
			</div>
			<div class="form-wrapper">
				<textarea name="" id="" class="form-control3 naiyo" style="height: 69px"
					placeholder="내용을 작성하세요." >${naiyo }</textarea>
			</div>

			<button class="btn-danger insert" type="button" style="width: 164px; height: 51px;" onclick='imageSummit()'>등록하기</button>
		</form>

	</div>
	
</div>
<!-- 픽플레이스 생성 폼 끝 -->

<!-- 하단 수평스크롤 시작-->
<div id="filter_list" >
   <div class="container-fluid noMnP scroll_inline box" >
         <!-- 필터 띄우기 -->

      <c:forEach var="item" items="${list_filter }"  varStatus="loop">
         <c:set var="str_f_name" value="${item.F_NAME }"/>
         <div class=" card-a cssco card_hover ${item.F_NAME}" id="${item.F_NAME}"
            onclick="filterOn(this)">
            <img src="${item.F_IMAGE_PATH}" />
            <div class="ovrly"></div>
            <span class="name_text">${fn:toUpperCase(str_f_name)}</span>
         </div>
      </c:forEach>
      
      
   </div>
      <!--scroll_inline box -->
   </div>
   <!--filter_list -->
<!-- 하단 스크롤 끝 -->

<input type="hidden" class="filter2" value="${filter1}" />
<input type="hidden" class="my_calendar2" value="${my_calendar}" />
<input type="hidden" class="ppb_addr1" value="${ppb_addr1}" />
<input type="hidden" class="ppb_longitude" value="${ppb_longitude}" />
<input type="hidden" class="ppb_latitude" value="${ppb_latitude}" />


<script>
	$(function(){
		if($('.filter2').val() != "null"){
		   $('.filter1').val($('.filter2').val());
		}
		
		 var d = new Date();
		 var day = parseInt(d.getDate());
		 var myDate = d.getFullYear()+"-"+( d.getMonth() + 1 )+"-"+day+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
		 $('.my_calendar').val(myDate);
		 if($('.my_calendar2').val() != ''){
		 	$('.my_calendar').val($('.my_calendar2').val());
		 }
		 //맵 페이지
		 $('.latlng2').click(function(){
			  var form = document.createElement("form");
		      form.setAttribute("charset", "UTF-8");
		      form.setAttribute("method", "Post");  //Post 방식
		      form.setAttribute("action", "/pickpic/friends/place_map.pic"); 
			 
		      var hiddenField = document.createElement("input");
		      hiddenField.setAttribute("type", "hidden");
		      hiddenField.setAttribute("name", "title");
		      hiddenField.setAttribute("value", $('.title').val());
		      form.appendChild(hiddenField);
		      
		      var hiddenField = document.createElement("input");
		      hiddenField.setAttribute("type", "hidden");
		      hiddenField.setAttribute("name", "addr");
		      hiddenField.setAttribute("value", $('.addr').val());
		      form.appendChild(hiddenField);
		      
		      var hiddenField = document.createElement("input");
		      hiddenField.setAttribute("type", "hidden");
		      hiddenField.setAttribute("name", "my_calendar");
		      hiddenField.setAttribute("value", $('.my_calendar').val());
		      form.appendChild(hiddenField);
		      
		      var hiddenField = document.createElement("input");
		      hiddenField.setAttribute("type", "hidden");
		      hiddenField.setAttribute("name", "filter1");
		      hiddenField.setAttribute("value", $('.filter1').val());
		      form.appendChild(hiddenField);
		      
		      var hiddenField = document.createElement("input");
		      hiddenField.setAttribute("type", "hidden");
		      hiddenField.setAttribute("name", "naiyo");
		      hiddenField.setAttribute("value", $('.naiyo').val());
		      form.appendChild(hiddenField);
		     
		      var hiddenField = document.createElement("input");
		      hiddenField.setAttribute("type", "hidden");
		      hiddenField.setAttribute("name", "${_csrf.parameterName}");
		      hiddenField.setAttribute("value", "${_csrf.token}");
		      form.appendChild(hiddenField);
		      
		      document.body.appendChild(form);
		      form.submit();
		 });
	});
	
	/* 날짜 시간 찍기 */
	$(function() {
		$('#datetimepicker').datetimepicker({
			locale : 'ko',
			format : 'YYYY-MM-DD HH:mm:ss'
		});
	});
	
	/* 파일  이미지띄우기  */
	var file = document.querySelector('#getfile');
	$('#getfile').click(function(){
		if($('.latlng').val() == ''){
			alert('먼저 위치를 설정해주세요');
			return false;
		} 	 
	});
	
	file.onchange = function() {
		var fileList = file.files;
		// 읽기
		var reader = new FileReader();
		console.log(fileList[0].name);
		reader.readAsDataURL(fileList[0]);
		//로드 한 후
		reader.onload = function() {
			const canvas = document.getElementById('canvas');
			const ctx = canvas.getContext("2d");
			var img = new Image();
			img.src= reader.result;
			img.onload = function(e) {
				canvas.width = img.width;
				canvas.height = img.height;
				ctx.drawImage(img, 0, 0, img.width, img.height);
				canvas.removeAttribute("data-caman-id");
			};
			
		};
		
	};
	
	/*<!-- 필터창 열고 닫기  --> */
	var filter_list = document.getElementById('filter_list');
	var preview_wrap = document.getElementsByClassName('wrapper')[0]; 
	$("#myfilter_btn").click(function() {
		
		if (filter_list.style.display == "block") {
			if($('.latlng').val() == ''){
				alert('먼저 위치를 설정해주세요');
				return;
			} 	 
			filter_list.style.display = "none";
		} else {
			if($('.latlng').val() == ''){
				alert('먼저 위치를 설정해주세요');
				return;
			} 	 
			filter_list.style.display = "block";
		}
	});
	
	/* 필터 선택시 이미지에 필터 적용*/
	   var toggle=false;
	   var filterNameAfter;
	   function filterOn(item) {
	      /* 
	      console.log(toggle);
	      console.log(typeof(toggle));
	       */
	      var filterName = $(item).attr("id");
	       console.log(filterName);
	      var img = new Image();   
	      /* 
	      console.log(filterName != filterNameAfter);
	       */
	      if(filterName != filterNameAfter){
	         console.log("!="+toggle);
	         Caman('#canvas', img, function() {this.revert();});   
	         toggle = !toggle;
	         console.log("2!="+toggle);
	      }
	      
	      switch (filterName) {
	      case 'vintage':
	         $('.filter1').val(filterName);
	         console.log("v="+toggle);
	         if(!toggle){
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.vintage().render();});
	         }
	         
	         toggle = !toggle;   
	         console.log("v2="+toggle);
	         
	         break;
	      case 'lomo':
	         $('.filter1').val(filterName);
	         console.log("l="+toggle);
	         if(!toggle)
	            Caman('#canvas', img, function() {this.revert();});      
	         else
	            Caman('#canvas', img, function() {this.lomo().render();});
	         toggle = !toggle;   
	         console.log("l2="+toggle);
	         
	         break;
	      case 'clarity':
	         $('.filter1').val(filterName);
	         console.log("c="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.clarity().render();});
	         }
	         toggle = !toggle;   
	         console.log("c2="+toggle);
	         
	         break;
	      case 'sincity':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("s="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.sinCity().render();});
	         }
	         toggle = !toggle;   
	         console.log("s2="+toggle);
	         
	         break;
	      case 'crossprocess':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("c="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.crossProcess().render();});
	         }
	         toggle = !toggle;   
	         console.log("c2="+toggle);
	         
	         break;
	      case 'pinhole':
	         $('.filter1').val(filterName);
	         console.log("p="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.pinhole().render();});
	         }
	         toggle = !toggle;   
	         console.log("p2="+toggle);
	         
	         break;
	      case 'nostalgia':
	         $('.filter1').val(filterName);
	         console.log("n="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.nostalgia().render();});
	         }
	         toggle = !toggle;   
	         console.log("n2="+toggle);
	         
	         break;
	      case 'hermajesty':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("h="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.herMajesty().render();});
	         }
	         toggle = !toggle;   
	         console.log("h2="+toggle);
	         
	         break;
	      case 'orangepeel':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("h="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.orangePeel().render();});
	         }
	         toggle = !toggle;   
	         console.log("h2="+toggle);
	         
	         break;
	      case 'oldboot':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("h="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.oldBoot().render();});
	         }
	         toggle = !toggle;   
	         console.log("h2="+toggle);
	         
	         break;
	      case 'love':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("h="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.love().render();});
	         }
	         toggle = !toggle;   
	         console.log("h2="+toggle);
	         
	         break;
	      case 'jarques':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("h="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.jarques().render();});
	         }
	         toggle = !toggle;   
	         console.log("h2="+toggle);
	         
	         break;
	      case 'hazydays':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("h="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.hazyDays().render();});
	         }
	         toggle = !toggle;   
	         console.log("h2="+toggle);
	         
	         break;
	      case 'grungy':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("h="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.grungy().render();});
	         }
	         toggle = !toggle;   
	         console.log("h2="+toggle);
	         
	         break;
	      case 'glowingsun':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("h="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.glowingSun().render();});
	         }
	         toggle = !toggle;   
	         console.log("h2="+toggle);
	         
	         break;
	      case 'concentrate':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("h="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.concentrate().render();});
	         }
	         toggle = !toggle;   
	         console.log("h2="+toggle);
	         
	         break;
	      case 'hemingway':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("h="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.revert();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.hemingway().render();});
	         }
	         toggle = !toggle;   
	         console.log("h2="+toggle);
	         
	         break;
	      case 'sunrise':
	         $('.filter1').val(filterName);
	         /* 안됨 */
	         console.log("h="+toggle);
	         if(!toggle){
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.sunrise();});      
	         }
	         else{
	            console.log(toggle);
	            Caman('#canvas', img, function() {this.concentrate().render();});
	         }
	         toggle = !toggle;   
	         console.log("h2="+toggle);
	         
	         break;
	      default:
	         $('.filter1').val(filterName);
	         console.log("dr="+toggle);
	         Caman('#canvas', img, function() {
	            this.revert();
	         });
	         toggle = !toggle;
	         console.log("dr2="+toggle);
	         
	      }
	      filterNameAfter = $(item).attr("id");

	   }
	   
	
	var imageSummit = function() {
		var imgCan = document.getElementById('canvas');
		console.log(imgCan);
		console.log(typeof(imgCan));
		var canvImgStr = imgCan.toDataURL('image/png', 1.0);
		console.log('적용되니');
		$.ajax({
			url:"<c:url value='/user/uploadImage.do'/>",
			type:"POST",
			data:{
				"ppb_post_date" : $('.my_calendar').val(),
				"ppb_addr1" : $('.ppb_addr1').val(),
				"ppb_addr2" : $('.addr').val(),
				"ppb_latitude" : $('.ppb_latitude').val(),
				"ppb_longitude" : $('.ppb_longitude').val(),
				"ppb_title" : $('.title').val(),
				"ppb_content" : $('.naiyo').val(),
				"f_name" : $('.filter1').val(),
				"strImg": canvImgStr,
				"type" : "place"
			},
			dataType:'json',
			success : function(data) {
				console.log('성공했습니다');
				console.log(data);
				location.href = "<c:url value='/user/myPage.pic' />";
			},
			error : function(data) {
				console.log('실패했습니다');
				console.log(data);
			}
		});
	}
</script>


