<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>


<!-- css&js -->
<link href="<c:url value='/css/Navbar.css' />" rel="stylesheet">
<link href="<c:url value='/css/Modal.css'/>" rel="stylesheet">
<link href="<c:url value='/css/Preview.css'/>" rel="stylesheet">
<link href="<c:url value='/css/FilterList.css'/>" rel="stylesheet">
<link href="<c:url value='/css/cssco.css'/>" rel=" stylesheet ">

<script src="https://cdnjs.cloudflare.com/ajax/libs/camanjs/4.1.2/caman.full.min.js"></script>
<script src="Preview.js"></script>
<!-- albumEditor.jsp -->

<!-- 모달 창 시작-->
<div class="modal" id="option_modal">
   <div class="modal-content">

      <!-- 모달 헤더 시작-->
      <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
         </button>
         <h4 class="modal-title" id="option_title">원하는 사진이 있는 곳을 선택하세요.</h4>
      </div>
      <!-- 모달 헤더 끝-->

      <!-- 모달 바디 시작-->
      <div class="modal-body">
         <div class="row text-center">

            <div class="col-xs-4 btn ">
               <img class="img-circle img_100"
                  src="<c:url value='/resources/images/sns/M.PNG'/>" alt="image">
               <h5>내 픽보관함</h5>
            </div>

            <div class="col-xs-4 btn btn-file">
               <input type="file" name="img_mypc[]" id="upload-mypc" multiple
                  accept=".jpg, .jpeg, .png"> <img
                  class="img-circle img_100"
                  src="<c:url value='/resources/images/sns/P.png'/>" alt="image">
               <h5>내 PC</h5>
            </div>

            <div class="col-xs-4 btn">
               <img class="img-circle img_100"
                  src="<c:url value='/resources/images/sns/I.PNG'/>" alt="image">
               <h5>인스타그램</h5>
            </div>
         </div>
         <!-- row text-center -->
      </div>
      <!-- modal-body -->
   </div>
   <!-- modal-content -->
</div>
<!-- modal-->


<!-- 상단 바 시작-->
<nav class="navbar topnav" id="myTopnav">
   <div class="container-fluid">
      <ul class="nav navbar-nav">
         <li><a href="javascript:void(0);" onclick="deleteItem(this)" class="alldelete_btn" >선택 삭제</a></li>
         <li><a id="myfilter_btn">내 필터 보관함</a></li>
         <li><a class="btn" data-toggle="modal" id="option_btn" >+
               가져오기</a></li>
      	<li ><a href="javascript:void(0);" onclick="selectItem(this)" class="allselect_btn">전체 선택</a></li>
      </ul>
      <ul class="nav navbar-nav" style="float: right;">
         <li><a href="#"><span class="glyphicon glyphicon-picture">&nbsp;</span><span id="imgCount">0 / 0</span>
              </a></li>
         <li><a href="javascript:downloadImage()" ><span class="glyphicon glyphicon-log-in"></span>
               저장하기</a></li>
      </ul>
   </div>
</nav>
<!-- 상단 바 끝-->

<!-- 프리뷰 시작 -->
<div class="preview_wrap">
   <div class="preview_container row">
      <div class="preview" id="preview">
         <!-- 사진 리스트 들어가는 곳 -->
			<div class="col-lg-2 col-md-4 col-sm-6 noMnP" id="div_index">
				<div class=" photo_wrap" id="photo_wrap_index">
					<div class="photo">
						<div class="photo_center_wrap">
							<div class="photo_center" id=set_index+>
								<canvas id="canvas"></canvas>
							</div>
						</div>
					</div>
					<div class="menu" style="border-top: 1px solid #e6e6e6;">
						<div class="centered">
							<div class="btn-group item" role="group">
								<button type="button" class="btn btn-default dl_btn" id="index"
									onclick="javascript:deleteItem(this)">삭제</button>
								<button type="button" class="btn btn-default tg_btn" id="index"
									onclick="javascript:selectItem(this)">선택</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
        <!-- preview -->
   </div>
   <!-- preview_container -->      
</div>
<!-- preview_wrap -->
   
<!-- 하단 수평스크롤 시작-->
<div id="filter_list" >
   <div class="container-fluid noMnP scroll_inline box" >
         <!-- 필터 띄우기 -->
		<div class="revert-add card-a card_hover cssco" id="revert" onclick="filterOn(this)">
			<img src="<c:url value='/resources/images/filter/filter_none.png'/>" />
			<div class="ovrly"></div>
			<span class="name_text"> None </span>
		</div>
		<div class="vintage-add card-a card_hover cssco" id="vintage" onclick="filterOn(this)">
			<img src="<c:url value='/resources/images/filter/filter_none.png'/>" />
			<div class="ovrly"></div>
			<span class="name_text"> vintage </span>
		</div>
		<div class="lomo-add card-a card_hover cssco" id="Lomo" onclick="filterOn(this)">
			<img src="<c:url value='/resources/images/filter/filter_none.png'/>" />
			<div class="ovrly"></div>
			<span class="name_text"> Lomo </span>
		</div>

		
	</div>
      <!--scroll_inline box -->
   </div>
   <!--filter_list -->
<!-- 하단 스크롤 끝 -->


<script type="text/javascript">
<!-- 모달창 열고 닫기 -->
	//모달요소 얻기
	var modal = document.getElementById('option_modal');
	// 모달창 열기 버튼요소 얻기
	var btn = document.getElementById("option_btn");
	// 모달창 닫기(span) 태그요소 얻기
	var span = document.getElementsByClassName("close")[0];

	//페이지 로드하면서 모달창 열기(띄우기)
	window.onload = function() {
		modal.style.display = "block";
	}
	// 버튼 클릭시 모달창 열기(보이기)
	btn.onclick = function() {
		modal.style.display = "block";
	}
	// 닫기 클릭시 모달창 닫기(감추기)
	span.onclick = function() {
		modal.style.display = "none";
	}
	// 모달창 외의 바깥부분 클릭시 모달창 닫기(감추기)
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	//프리뷰에 로드시 모달창 자동 닫기(감추기)
	var input = document.getElementById("upload-mypc");
	function isEmpty(str) {
		return !str.replace(/\s+/, '').length;
	}
	input.addEventListener("input", function() {
		if (!isEmpty(this.value)) {
			/* console.log("#img_mypc is NOTNULL"); */
			modal.style.display = "none";
		}
	});
	
	/*<!-- 필터창 열고 닫기  --> */
	var filter_list = document.getElementById('filter_list');
	var preview_wrap = document.getElementsByClassName('preview_wrap')[0];
	$("#myfilter_btn").click(function() {
		if (filter_list.style.display == "block") {
			filter_list.style.display = "none";
			preview_wrap.style.paddingBottom = "0";
		} else {
			filter_list.style.display = "block";
			preview_wrap.style.paddingBottom = "100px";
		}
	});


/* <!-- 프리뷰에 다중으로 이미지띄우기  --> */
var fileCollection = new Array();
var index = 0;
var idArray = new Array();
$('#upload-mypc').on('change',
				function(e) {
					var files = e.target.files;
					loadcount = 0;
				    loadtotal = files.length;
				    preloaded = false;
					$.each(files,
							function(i, file) {
										fileCollection.push(file);
										var reader = new FileReader();
										reader.readAsDataURL(file);
										reader.onload = function(e) {
											console.log(e);
											console.log(e.target.result);
											var template = '<div class="col-lg-2 col-md-4 col-sm-6 noMnP" id="div_'+index+'">'
											+'<div class=" photo_wrap" id="photo_wrap_'+index+'">'
											+'<div class="photo">'
											+'<div class="photo_center_wrap">'
											+'<div class="photo_center" id=set_index+>'
											+'<canvas id="canvas" onload="loadImage(this)"></canvas>'
											+'</div></div></div>'
											+'<div class="menu" style="border-top: 1px solid #e6e6e6;">'
											+'<div class="centered">'
											+'<div class="btn-group item" role="group">'
											+'<button type="button" class="btn btn-default dl_btn" id="'+index+'" onclick="javascript:deleteItem(this)">삭제</button>'
											+'<button type="button" class="btn btn-default tg_btn" id="'+index+'" onclick="javascript:selectItem(this)">선택</button>'
											+'</div></div></div></div></div>';
											
											
											function lodeImage(e) {
												console.log("55555");
												var image =  new Image ( ) ;
												image.src = e.target.result;
												image.onload = function() {
											        canvas.width = img.width;
											        canvas.height = img.height;
											        ctx.drawImage(img, 0, 0, image.width, image.height);
											        canvas.removeAttribute("data-caman-id");
											      };
											};
											
											idArray[idArray.length] = index;
											index++;
											
											$('#preview').append(template);
											
											console.log(e.target.result);
											$('#imgCount').html('0 / ' + idArray.length);

										};

									});
					console.log(idArray);

				});	
	
	

/* 필터 선택시 이미지에 필터 적용*/
function filterOn(item) {
	console.log("item: "+item);
	if (item.classList.contains("revert-add")) {
	      Caman("#canvas", img, function() {
	    	  console.log("this: "+this);
	    	  this.revert();	    	  
	      });
	    } 
	else if (item.classList.contains("lomo-add")) {
	      Caman("#canvas", img, function() {
	    	  console.log("this: "+this);
	        this.lomo().render();
	      });
	    } 
	else if (item.classList.contains("vintage-add")) {
	      Caman("#canvas", img, function() {
	    	  console.log("this: "+this);
	        this.vintage().render();
	      });
	    }

}

</script>