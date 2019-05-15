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
         <h3 class="modal-title" id="option_title">원하는 사진이 있는 곳을 선택하세요.</h3>
      </div>
      <!-- 모달 헤더 끝-->

      <!-- 모달 바디 시작-->
      <div class="modal-body">
         <div class="row text-center">

            <div class="col-xs-3 btn ">
               <img class="img-circle img_100"
                  src="<c:url value='/resources/images/sns/M.PNG'/>" alt="image">
               <h5>내 픽보관함</h5>
            </div>

            <div class="col-xs-3 btn btn-file">
               <input type="file" name="img_mypc[]" id="img_mypc" multiple
                  accept=".jpg, .jpeg, .png"> <img
                  class="img-circle img_100"
                  src="<c:url value='/resources/images/sns/P.png'/>" alt="image">
               <h5>내 PC</h5>
            </div>

            <div class="col-xs-3 btn">
               <img class="img-circle img_100"
                  src="<c:url value='/resources/images/sns/I.PNG'/>" alt="image">
               <h5>인스타그램</h5>
            </div>
            <div class="col-xs-3 btn ">
               <img class="img-circle img_100"
                  src="<c:url value='/resources/images/sns/F.png'/>" alt="image">
               <h5>페이스북</h5>
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
         <li class="active btncolor"><a href="#">되돌리기</a></li>
         <li><a id="myfilter_btn">내 필터 보관함</a></li>
         <li><a class="btn" data-toggle="modal" id="option_btn" href="#">+
               가져오기</a></li>
      </ul>
      <ul class="nav navbar-nav" style="float: right;">
         <li><a href="#"><span class="glyphicon glyphicon-picture"></span>
               12/30</a></li>
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
         <%-- <div class="col-lg-2 col-md-4 col-sm-6 noMnP ">
            <div class=" photo_wrap">
               <div class="photo ">
                  <div class="photo_center_wrap">
                     <div class="photo_center cssco cssco--p5">
                        <img src="<c:url value='/resources/images/cat2.jpg'/>" />
                     </div>
                  </div>
               </div>
               <div class="menu" style="border-top: 1px solid #e6e6e6;">
                  <div class="centered">
                     <div class="btn-group item" role="group">
                        <button type="button" class="btn btn-default">삭제</button>
                        <button type="button" class="btn btn-default">회전</button>
                        <button type="button" class="btn btn-default" id="btn_select">선택</button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-lg-2 col-md-4 col-sm-6 noMnP ">
            <div class=" photo_wrap">
               <div class="photo ">
                  <div class="photo_center_wrap">
                     <div class="photo_center ">
                        <img src="<c:url value='/resources/images/cat3.jpg'/>"
                           style="width: auto; height: 100%;" />
                     </div>
                  </div>
               </div>
               <div class="menu" style="border-top: 1px solid #e6e6e6;">
                  <div class="centered">
                     <div class="btn-group item" role="group">
                        <button type="button" class="btn btn-default">삭제</button>
                        <button type="button" class="btn btn-default">회전</button>
                        <button type="button" class="btn btn-default" id="btn_select">선택</button>
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
            <div class=" card-a cssco cssco--c1 " id="filterIndex" onclick="filterOn(this)">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
               <span class="name_text">
                  C1
               </span>
            </div>
            <div class=" card-a cssco cssco--f2 ">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
               <div class="name_text">
                  F2
               </div>
            </div>
            <div class=" card-a cssco cssco--g3 ">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  G3
               </div>
            </div>
            <div class=" card-a cssco cssco--p5 ">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  P5
               </div>
            </div>
            <div class=" card-a cssco cssco--lv3 ">
               <img src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  LV3
               </div>
            </div>
            <div class=" card-a cssco cssco--b5 ">
               <img
                  src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  B5
               </div>
            </div>
            <div class=" card-a cssco cssco--a6 ">
               <img
                  src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  A6
               </div>
            </div>
            <div class=" card-a cssco cssco--kk2 ">
               <img
                  src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  KK2
               </div>
            </div>
            <div class=" card-a cssco cssco--m5 ">
               <img
                  src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  M5
               </div>
            </div>
            <div class=" card-a cssco cssco--m3 ">
               <img
                  src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  M3
               </div>
            </div>
            <div class=" card-a cssco cssco--hb1 ">
               <img
                  src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  HB1
               </div>
            </div>   
            <div class=" card-a cssco cssco--hb2 ">
               <img
                  src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  HB2
               </div>
            </div>
            <div class=" card-a cssco cssco--acg ">
               <img
                  src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  ACG
               </div>
            </div>   
            <div class=" card-a cssco cssco--x1 ">
               <img
                  src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  X1
               </div>
            </div>   
            <div class=" card-a cssco cssco--t1 ">
               <img
                  src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
                  <div class="name_text">
                  T1
               </div>
            </div>      
      </div>
      <!--scroll_inline box -->
   </div>
   <!--filter_list -->



<%-- <div id="filter_list">
   <div class="box">
      <div class=" card-a cssco cssco--c1 ">
         <img
            src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
      </div>
      <div class=" card-a cssco cssco--c1 ">
         <img
            src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
      </div>
      <div class=" card-a cssco cssco--c1 ">
         <img
            src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
      </div>
      <div class=" card-a cssco cssco--c1 ">
         <img
            src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
      </div>
      <div class=" card-a cssco cssco--c1 ">
         <img
            src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
      </div>
      <div class=" card-a cssco cssco--c1 ">
         <img
            src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
      </div>
      <div class=" card-a cssco cssco--c1 ">
         <img
            src="<c:url value='/resources/images/filter/filter_default.jpg'/>" />
      </div>
   </div>
</div> --%>
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
         console.log("#img_mypc is NOTNULL");
         modal.style.display = "none";
      }
   });

   /* <!-- 프리뷰에 다중으로 이미지띄우기  --> */
   var fileCollection = new Array();
   var index = 1;
   $('#img_mypc')
         .on(
               'change',
               function(e) {
                  var files = e.target.files;
                  $
                        .each(
                              files,
                              function(i, file) {
                                 fileCollection.push(file);
                                 var reader = new FileReader();
                                 reader.readAsDataURL(file);
                                 reader.onload = function(e) {
                                    var template = '<div class="col-lg-2 col-md-4 col-sm-6 noMnP" id="div_'+index+'" >'
                                          + '<div class=" photo_wrap">'
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
                                          + '<button type="button" class="btn btn-default" id="'
                                          + index
                                          + '" onclick="javascript:deleteItem(this)">삭제</button>'
                                          + '<button type="button" class="btn btn-default" id="'
                                          + index
                                          + '" onclick="javascript:selectItem(this)">선택</button>'
                                          + '</div></div></div>'
                                          + '</div></div>';
                                    index++;
                                    $('#preview').append(template);
                                    /* console.log(e.target.result); */
                                 };
                              });
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
   
   /* 필터버튼 선택 */
    function filterOn(item) {
	   console.log(item);  
   }

   /*<!-- 아이템 선택시 해당이미지src가져오기  --> */
   function selectItem(item) {
      var currentIndex = $(item).attr("id");
      var currentSrc = $("img[id=temp_img_" + currentIndex + "]").attr("src");
      console.log("currentIndex:" + currentIndex + ",currentSrc:"
            + currentSrc);
   }

   /*<!-- 아이템 삭제시 해당이미지 삭제  --> */
   function deleteItem(item) {
      var currentIndex = $(item).attr("id");
      $("div[id='div_" + currentIndex + "']").remove();
   }

   /* <!-- 이미지 선택 시 이미지 정보 가져오기 --> */
   /* $("#btn_select").click(
         function(event) {
            var selected = document
                  .querySelectorAll("div.photo_center img[id=temp_img]");
            console.log(selected);
         }); */
</script>