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
				<canvas style="width:315px;height:315px;background-color:#ececec;" id="canvas"></canvas>
				<%-- <img
					src="<c:url value='/resources/images/filter/filter_default.jpg'/>"
					alt=""> --%>
			</div>

			<div class="btn-group" style="width: 100%">

				<div class="upload-btn-wrapper">
					<button class="button" >+ 이미지</button>
					<input type="file" name="getfile" id="getfile" accept=".jpg, .png"/>
				</div>		
				<button class="button" type="button" style="width: 50%" id="myfilter_btn">+ My 필터</button>
			</div>
		</form>
		<form action="">
			<h3>픽플레이스</h3>

			<div class="form-wrapper">
				<input type="text" placeholder="제목을 입력하세요." class="form-control2">
			</div>
			<div class="form-wrapper">
				<input type="text" placeholder="위치를 지정하세요." class="form-control2">
				<i class="zmdi zmdi-pin zmdi-hc-lg"></i>
			</div>
			<div class="form-wrapper">
				<input type="text" placeholder="상세주소" class="form-control2">
			</div>
			<div class="form-group">
				<div class='input-group date' id='datetimepicker'>
					<input type='text' class="form-control" /> <span
						class="input-group-addon"> <span
						class="glyphicon glyphicon-calendar"> </span>
					</span>
				</div>
			</div>


			<div class="form-wrapper">
				<select name="" id="" class="form-control2">
					<option value="" disabled selected>사용한 필터를 고르세요.</option>
					
					<c:forEach var="item" items="${list_filter }" varStatus="loop">
						<c:set var="str_f_name" value="${item.F_NAME }" />
						<option value="vintage">${item.F_NAME }</option>
					</c:forEach>
					
				</select> <i class="zmdi zmdi-caret-down zmdi-hc-2x"></i>
			</div>
			<div class="form-wrapper">
				<textarea name="" id="" class="form-control3" style="height: 69px"
					placeholder="내용을 작성하세요."></textarea>
			</div>

			<button class="btn-danger" type="button" style="width: 164px; height: 51px;">등록하기</button>
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
			filter_list.style.display = "none";
		} else {
			filter_list.style.display = "block";
		}
	});
	
	/* 필터 선택시 이미지에 필터 적용*/
	var toggle=false;
	var filterNameAfter;
	function filterOn(item) {
		console.log(toggle);
		console.log(typeof(toggle));
		var filterName = $(item).attr("id");
		var img = new Image();		
		console.log(filterName != filterNameAfter);
		if(filterName != filterNameAfter){
			Caman('#canvas', img, function() {this.revert();});	
			toggle = !toggle;
		}
		
		switch (filterName) {
		case 'vintage':
			console.log(toggle);
			if(!toggle){
				console.log(toggle);
				Caman('#canvas', img, function() {this.revert();});		
			}
			else{
				console.log(toggle);
				Caman('#canvas', img, function() {this.vintage().render();});
			}
			toggle = !toggle;		
			console.log(toggle);
			break;
		case 'lomo':
			if(!toggle)
				Caman('#canvas', img, function() {this.revert();});		
			else
				Caman('#canvas', img, function() {this.lomo().render();});
			toggle = !toggle;	
			break;
		case 'clarity':
			Caman('#canvas', img, function() {
				this.clarity().render();
			});
			break;
		case 'sinCity':
			Caman('#canvas', img, function() {
				this.sinCity().render();
			});
			break;
		case 'crossProcess':
			Caman('#canvas', img, function() {
				this.crossProcess().render();
			});
			break;
		case 'pinhole':
			Caman('#canvas', img, function() {
				this.pinhole().render();
			});
			break;
		case 'nostalgia':
			Caman('#canvas', img, function() {
				this.nostalgia().render();
			});
			break;
		case 'herMajesty':
			Caman('#canvas', img, function() {
				this.herMajesty().render();
			});
			break;
		default:
			Caman('#canvas', img, function() {
				this.revert();
			});
		}
		filterNameAfter = $(item).attr("id");

	}

</script>


