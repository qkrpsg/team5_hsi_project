<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

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
				<canvas style="width:100%;height:auto;background-color:#ececec;" id="canvas"></canvas>
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

			<button class="btn-danger insert" type="button" style="width: 164px; height: 51px;">등록하기</button>
		</form>

	</div>
	
</div>
<!-- 픽플레이스 생성 폼 끝 -->


<!-- 하단 수평스크롤 시작-->
<div id="filter_list" >
   <div class="container-fluid noMnP scroll_inline box" >
         <!-- 필터 띄우기 -->
      <div class=" card-a cssco card_hover" id="none"
         onclick="filterOn(this)">
         <img src="<c:url value='/resources/images/filter/filter_none.png'/>" />
         <div class="ovrly"></div>
         <span class="name_text"> NONE </span>
      </div>

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


<script>
	$(function(){
		//$('.latlng').
		console.log("뭐 뜨냐? "+typeof $('.filter2').val());
		
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
		 
		 //var currentDate = d.getFullYear() + "년 " + ( d.getMonth() + 1 ) + "월 " + day + "일";
	     //var currentTime = d.getHours() + "시 " + d.getMinutes() + "분 ";// + d.getSeconds() + "초"
	   	
	     //ㅋㅋㅋㅋ
		 $('.latlng2').click(function(){
			 //title   , addr  ,my_calendar  , filter1  ,naiyo
			  //제목 , 상세 주소 , 달력 값 , 사용한 필터  , 내용
			 
			  /* 
			  console.log('제목!!!'+$('.title').val());
			  console.log('상세!!!'+$('.addr').val());
			  console.log('달력!!!'+$('.my_calendar').val());
			  console.log('필터!!!'+$('.filter1').val());
			  console.log('내용!!!'+$('.naiyo').val());
			   */
			  
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
	 //등록하기
	 //  /test/place_view.pic
	$(document).ready(function(){
        $(document).on("click",".insert",function(event){
          // 동적으로 여러 태그가 생성된 경우라면 이런식으로 클릭된 객체를 this 키워드를 이용해서 잡아올 수 있다.
          console.log('제목!!!'+$('.title').val());
		  console.log('상세!!!'+$('.addr').val());
		  console.log('달력!!!'+$('.my_calendar').val());
		  console.log('필터!!!'+$('.filter1').val());
		  console.log('내용!!!'+$('.naiyo').val());
        	var form = document.createElement("form");
	        form.setAttribute("charset", "UTF-8");
	        form.setAttribute("method", "Post");  //Post 방식
	        form.setAttribute("action", "/pickpic/friends/place_view_myPage.pic"); //요청 보낼 주소
	        //insert 체크용
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "insert");
	        hiddenField.setAttribute("value", "insert");
	        form.appendChild(hiddenField);
	        //달력  딱히 필요없는듯 하다
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "ppb_post_date");
	        hiddenField.setAttribute("value", $('.my_calendar').val());
	        form.appendChild(hiddenField);
	        //지번
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "ppb_addr1");
	        hiddenField.setAttribute("value", $('.ppb_addr1').val());
	        form.appendChild(hiddenField);
	        //상세
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "ppb_addr2");
	        hiddenField.setAttribute("value", $('.addr').val());
	        form.appendChild(hiddenField);
	        //위도
	         var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "ppb_latitude");
	        hiddenField.setAttribute("value", $('.ppb_latitude').val());
	        form.appendChild(hiddenField);
	        //경도
	         var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "ppb_longitude");
	        hiddenField.setAttribute("value", $('.ppb_longitude').val());
	        form.appendChild(hiddenField);
	        
	        //이미지 경로
	        /* var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "ppb_image_path");
	        hiddenField.setAttribute("value", newFilename);
	        form.appendChild(hiddenField); */
	       //제목
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "ppb_title");
	        hiddenField.setAttribute("value", $('.title').val());
	        form.appendChild(hiddenField);
	        //내용
	         var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "ppb_content");
	        hiddenField.setAttribute("value", $('.naiyo').val());
	        form.appendChild(hiddenField);
	      
	        //f_id 값 가져올려고
	        var hiddenField = document.createElement("input");
	       hiddenField.setAttribute("type", "hidden");
	       hiddenField.setAttribute("name", "f_name");
	       hiddenField.setAttribute("value", $('.filter1').val());
	       form.appendChild(hiddenField);
	       
	        document.body.appendChild(form);
	        form.submit();
          
          
          
        });
    }); // end of ready()
   
</script>
<script type="text/javascript">
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
	
	/*  등록하기 */
/* 	> 캔버스에서 이미지를 만듭니다 (이전처럼).
> 이미지를 새 페이지에 표시하십시오.
> 사용자가 로컬 드라이브를 마우스 오른쪽 버튼으로 클릭 한 상태로 저장하십시오.
> 그런 다음 파일 입력 요소를 사용하여 새로 생성 된 파일을 업로드 할 수 있습니다.

Ajax를 사용하여 캔바스 데이터를 POST */
	/* var blobBin = atob(dataURL.split(',')[1]);
var array = [];
for(var i = 0; i < blobBin.length; i++) {
    array.push(blobBin.charCodeAt(i));
}
var file=new Blob([new Uint8Array(array)], {type: 'image/png'});


var formdata = new FormData();
formdata.append("myNewFileName", file);
$.ajax({
   url: "uploadFile.php",
   type: "POST",
   data: formdata,
   processData: false,
   contentType: false,
}).done(function(respond){
  alert(respond);
}); */
	

</script>


