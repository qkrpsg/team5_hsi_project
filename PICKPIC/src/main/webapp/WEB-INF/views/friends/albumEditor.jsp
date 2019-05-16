<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- css&js -->
<link href="<c:url value='/css/Navbar.css' />" rel="stylesheet">
<link href="<c:url value='/css/Modal.css'/>" rel="stylesheet">
<link href="<c:url value='/css/Preview.css'/>" rel="stylesheet">
<link href="<c:url value='/css/FilterList.css'/>" rel="stylesheet">
<link href="<c:url value='/css/cssco.css'/>" rel=" stylesheet ">

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
               <input type="file" name="img_mypc[]" id="img_mypc" multiple
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
         <li><a href="#" id="imgCount"><span class="glyphicon glyphicon-picture"></span>
               0 / 0</a></li>
         <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
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
			<%-- <div class="col-lg-2 col-md-4 col-sm-6 noMnP" id="div_'+index+'">
				<div class=" photo_wrap">
					<div class="photo">
						<div class="photo_center_wrap">
							<div class="photo_center">
								<img id="temp_img_index"
									src="<c:url value='/resources/images/cat2.jpg'/>"
									onload="resize(this)" />
							</div>
						</div>
					</div>
					<div class="menu" style="border-top: 1px solid #e6e6e6;">
							<div class="centered">
							<div class="btn-group item" role="group">
								<button type="button" class="btn btn-default" id="index" onclick="javascript:deleteItem(this)">삭제</button>
								<button type="button" class="btn btn-default tgbtn" id="index" onclick="javascript:selectItem(this)">선택</button>
							</div> 
						</div>
					</div>
				</div>
			</div> --%>

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
                        
         <div class=" card-a cssco cssco--none card_hover" id="cssco--none" onclick="filterOn(this)">
               <img src="<c:url value='/resources/images/filter/filter_none.png'/>" />
			<div class="ovrly"></div>
			<span class="name_text">
                  None
               </span>
		</div>
            <div class=" card-a cssco cssco--c1 card_hover" id="cssco--c1" onclick="filterOn(this)">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
               <div class="ovrly"></div>
               <span class="name_text">
                  C1
               </span>
            </div>
            <div class=" card-a cssco cssco--f2 card_hover" id="cssco--f2" onclick="filterOn(this)">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
               <div class="ovrly"></div>
                <span class="name_text">
                  F2
               </span>
            </div>
            <div class=" card-a cssco cssco--g3 card_hover" id="cssco--g3" onclick="filterOn(this)">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />              
               <div class="ovrly"></div>
                <span class="name_text">
                  G3
               </span>
            </div>
             <div class=" card-a cssco cssco--p5 card_hover" id="cssco--p5" onclick="filterOn(this)">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
               <div class="ovrly"></div>
                <span class="name_text">
                  P5
               </span>		
            </div>
             <div class=" card-a cssco cssco--lv3 card_hover" id="cssco--lv3" onclick="filterOn(this)">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
               <div class="ovrly"></div>
               <span class="name_text">
                  LV3
               </span>			
            </div>
            <div class=" card-a cssco cssco--b5 card_hover" id="cssco--b5" onclick="filterOn(this)">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
               <div class="ovrly"></div>
               <span class="name_text">
                  B5
               </span>			
            </div>
            <div class=" card-a cssco cssco--a6 card_hover" id="cssco--a6" onclick="filterOn(this)">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
               <div class="ovrly"></div>	
               <span class="name_text">
                  A6
               </span>		
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
   var input = document.getElementById("img_mypc");
   function isEmpty(str) {
      return !str.replace(/\s+/, '').length;
   }
   input.addEventListener("input", function() {
      if (!isEmpty(this.value)) {
         /* console.log("#img_mypc is NOTNULL"); */
         modal.style.display = "none";
      }
   });

   
   /* <!-- 프리뷰에 다중으로 이미지띄우기  --> */
   var fileCollection = new Array();
   var index = 0;
   var idArray =new Array();
   $('#img_mypc').on( 'change',function(e) {
                  var files = e.target.files;
                  $ .each( files, function(i, file) {
                                 fileCollection.push(file);
                                 var reader = new FileReader();
                                 reader.readAsDataURL(file);
                                 reader.onload = function(e) {
                                    var template = '<div class="col-lg-2 col-md-4 col-sm-6 noMnP" id="div_'+index+'" >'
                                          + '<div class=" photo_wrap" id="photo_wrap_'+index+'">'
                                          + '<div class="photo" >'
                                          + '<div class="photo_center_wrap" >'
                                          + '<div class="photo_center" >'
                                          + '<img id="temp_img_'
                                          + index
                                          + '" src="'
                                          + e.target.result
                                          + '" onload="resize(this)"/>'
                                          + '</div></div></div>'
                                          + '<div class="menu" style="border-top: 1px solid #e6e6e6;">'
                                          + '<div class="centered">'
                                          + '<div class="btn-group item" role="group">'
                                          + '<button type="button" class="btn btn-default dl_btn" id="'
                                          + index
                                          + '" onclick="javascript:deleteItem(this)">삭제</button>'
                                          + '<button type="button" class="btn btn-default tg_btn" id="'
                                          + index
                                          + '" onclick="javascript:selectItem(this)">선택</button>'
                                          + '</div></div></div>'
                                          + '</div></div>';
                                    idArray[idArray.length]=index;
                                    index++;
                                    /* console.log("원:"+i,index); */
                                    $('#preview').append(template);
                                    /* console.log(e.target.result); */
                                 };
                                 
                             });
                  console.log(idArray);
               });

   /* 이미지 기준 가로 또는 세로 적용 */
   function resize(img) {
      var width = $(img).width();
      var height = $(img).height();
      if (width < height) {
         img.style.width = "auto";
         img.style.height = "100%";
      }
   }
   
   /*<!-- 아이템 선택  --> */
	var selectArray = new Array();
   
	function selectItem(item) {
		var selectBtnClass=$(item).attr("class");
		if(selectBtnClass.indexOf('allselect_btn')!=-1){/* 전체선택해제 */
			if(idArray.length!=0){				
				if ($(item).html() == '전체 선택') {
					/* 선택 후 효과 */
					selectArray=[];
					selectArray=selectArray.concat(idArray);
					$.each(selectArray, function(index, id) {
						$('div[id=photo_wrap_' + id + ']').css('box-shadow','5px 5px 5px #c9e3f7');
						$("button[id=" + id + "]").eq(1).html('해제');
					});				
				} else if ($(item).html() == '전체 해제') {
					/* 해제 후 */
					$.each(selectArray, function(index, id) {
						$('div[id=photo_wrap_' + id + ']').css('box-shadow','');
						$("button[id=" + id + "]").eq(1).html('선택');
					});
					selectArray = [];
				}
			$(item).html($(item).html() == '전체 선택' ? '전체 해제' : '전체 선택');
			}else {
				alert("이미지를 +가져오기 해주세요.")
			}
		console.log("전체선택 : idArray"+idArray+",selectArray:"+selectArray);
		}
		else if(selectBtnClass.indexOf("tg_btn")!=-1){/* 부분선택/해제 */
			var currentId = $(item).attr("id");
			console.log("currentId: "+currentId);
			var currentSrc = $("img[id=temp_img_" + currentId + "]").attr("src");
			/* 선택/해제버튼 토글 */
			if ($(item).html() == '선택') {
				/* 선택 후 효과 */
				$('div[id=photo_wrap_' + currentId + ']').css('box-shadow',
						'5px 5px 5px #c9e3f7');
				selectArray.push(Number(currentId));
				if(selectArray.length==idArray.length){
					$('.allselect_btn').html('전체 해제');
				}
			} else if ($(item).html() == '해제') {
				/* 해제 후 */
				$('div[id=photo_wrap_' + currentId + ']').css('box-shadow', '');
 				selectArray.splice(selectArray.indexOf(Number(currentId)),1);
				
				console.log("시작");
				console.log(idArray);
				console.log(selectArray.indexOf(Number(currentId)));
				console.log(selectArray);
				console.log(selectArray[0]);
				console.log(selectArray[1]);
				console.log(selectArray[2]);
				console.log("끝");
 				
				if(selectArray.length!=idArray.length){
					$('.allselect_btn').html('전체 선택');
				}
			}
			$(item).html($(item).html() == '선택' ? '해제' : '선택');
			console.log("부분선택 : idArray:"+idArray+",selectArray:"+selectArray);		
		}
	
	}

	/* <!-- 이미지 선택 시 이미지 정보 가져오기 --> */
	/* $("#btn_select").click(
	      function(event) {
	         var selected = document
	               .querySelectorAll("div.photo_center img[id=temp_img]");
	         console.log(selected);
	      }); */

	/*<!-- 아이템 삭제  --> */
	function deleteItem(item) {
		var selectBtnClass=$(item).attr("class");		
		if(selectBtnClass.indexOf('dl_btn')!=-1){/* 부분삭제 */
			var currentId = $(item).attr("id");
			var findIndex = idArray.indexOf(parseInt(currentId));
			if (findIndex != -1
					&& $("button[id=" + currentId + "]").eq(1).html() == '선택') {
				idArray.splice(findIndex, 1);
				if(selectArray.length==idArray.length) $('.allselect_btn').html('전체 해제');
				$("div[id='div_" + currentId + "']").remove();
			} else {
				alert('선택해제후 삭제하세요.');
			}
			console.log("부분삭제 : idArray"+idArray+",selectArray:"+selectArray);
		}
		else if(selectBtnClass.indexOf('alldelete_btn')!=-1){/* 선택된 전체삭제 */
			$('.allselect_btn').html('전체 선택');
			if(selectArray.length == idArray.length){
				$('#preview').empty();	
				idArray = [];
				selectArray = []
				index = 0;
				console.log("idArray:"+idArray+",selectArray:" + selectArray);
			}
			else if(selectArray.length != idArray.length){
				
				$.each(selectArray, function(index, id) {
					$('div[id="div_' + id + '"]').remove();
					
				});
			}
			console.log("선택전체삭제 : idArray"+idArray+",selectArray:"+selectArray);
		}
	}

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

	/* <div class=" card-a cssco cssco--a6 card_hover" id="cssco--a6" onclick="filterOn(this)">
	<img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
	<div class="ovrly"></div>	
	<span class="name_text">
	   A6
	</span>		
	</div> */
	/* 필터버튼 선택 */
	function filterOn(item) {
		console.log(item);
		var filterName = $(item).attr("id");

	}
</script>