<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<link href="<c:url value='/css/Place.css'/>" rel="stylesheet">
<script src="<c:url value='/js/Place.js'/>"></script>
<script src="<c:url value='/js/isotope-docs.min.js'/>"></script>

<div style="margin-top:100px;"></div>

<div class="l_all_wrap">
   <div class="top_wrap">
      <div class="left_wrap">
         <h2>필터</h2>
         <p>사진 명소에 필요한 필터를 빠르게 검색하세요</p>
         <ul class="l_selector">
            <li>장소</li>
            <li>필터</li>
            <li>루트</li>
         </ul>
         <form action="" class="l_search">
            <input type="text" name="a" placeholder="키워드를 검색하세요" />
            <input type="text" name="b" placeholder="필터명" />
            <button  class="btn btn-info">검색</button>   <!-- type="submit" -->
         </form>
      </div><!-- 왼쪽 위 끝 -->
      
      <div class="right_wrap">
         <ul class="l_selector2">
            <li>베스트 필터</li>
            <li>새로운 필터</li>
         </ul>
         <div class="col-xs-4 img_wrap">
            <img src="<c:url value='/resources/images/main_image1.jpg' />" alt="안나와"/>
         </div>
         <div class="col-xs-4 img_wrap">
            <img src="<c:url value='/resources/images/main_image2.jpg' />" alt="안나와"/>
         </div>
         <div class="col-xs-4 img_wrap">
            <img src="<c:url value='/resources/images/main_image3.jpg' />" alt="안나와"/>
         </div>
         
         <div class="col-xs-4 img_wrap">
            <img src="<c:url value='/resources/images/main_image4.jpg' />" alt="안나와"/>
         </div>
         <div class="col-xs-4 img_wrap">
            <img src="<c:url value='/resources/images/main_image5.jpg' />" alt="안나와"/>
         </div>
         <div class="col-xs-4 img_wrap">
            <img src="<c:url value='/resources/images/main_image6.jpg' />" alt="안나와"/>
         </div>
         
         
      </div><!--위 오른쪽 끝-->
      
   </div>
</div>












 


<div class="container con">
    <div class="row" >
      <div class="button-group filters-button-group" >
        <ul>
            <button class="btn btn-info" is-checked" data-filter="*"><span class="nav_color"></span><a >All</a></button>
            <button class="btn btn-info" data-filter=".ko"><span class="nav_color"></span><a >한국</a></button>
            <button class="btn btn-info" data-filter=".am"><span class="nav_color"></span><a >미국</a></button>
            <button class="btn btn-info" data-filter=".ni"><span class="nav_color"></span><a >일본</a></button>
            <button class="btn btn-info" data-filter=".cha"><span class="nav_color"></span><a >중국</a></button>
            <button class="btn btn-info" data-filter=".ho"><span class="nav_color"></span><a >호주</a></button>
            <button class="btn btn-info" data-filter=".ap"><span class="nav_color"></span><a >아메</a></button>
        </ul>
      </div>
    </div>
 

  </div>
  
  
  <div class="grid">
   <div class="col-xs-3 element-item img_wrap2 ko">
      <img src="<c:url value='/resources/images/main_image1.jpg' />" alt="안나와"/>
      <div class="innerText">
              <p class="Text_title" ><span >TITLE</span></p>
            <p class="" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
       </div>
   </div>
   <div class="col-xs-3 element-item img_wrap2 am">
      <img src="<c:url value='/resources/images/main_image2.jpg' />" alt="안나와"/>
      <div class="innerText">
              <p class="Text_title" ><span >TITLE</span></p>
            <p class="" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
       </div>
   </div>
   <div class="col-xs-3 element-item img_wrap2 ni">
      <img src="<c:url value='/resources/images/main_image3.jpg' />" alt="안나와"/>
      <div class="innerText">
              <p class="Text_title" ><span >TITLE</span></p>
            <p class="" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
       </div>
   </div>
   <div class="col-xs-3 element-item img_wrap2 cha">
      <img src="<c:url value='/resources/images/main_image4.jpg' />" alt="안나와"/>
      <div class="innerText">
              <p class="Text_title" ><span >TITLE</span></p>
            <p class="" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
       </div>
   </div>
   <div class="col-xs-3 element-item img_wrap2 ho">
      <img src="<c:url value='/resources/images/main_image5.jpg' />" alt="안나와"/>
      <div class="innerText">
              <p class="Text_title" ><span >TITLE</span></p>
            <p class="" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
       </div>
   </div>
   <div class="col-xs-3 element-item img_wrap2 ap">
      <img src="<c:url value='/resources/images/main_image6.jpg' />" alt="안나와"/>
      <div class="innerText">
              <p class="Text_title" ><span >TITLE</span></p>
            <p class="" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
       </div>
   </div>
   <div class="col-xs-3 element-item img_wrap2 ko">
      <img src="<c:url value='/resources/images/main_image5.jpg' />" alt="안나와"/>
      <div class="innerText">
              <p class="Text_title" ><span >TITLE</span></p>
            <p class="" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
       </div>
   </div>
   <div class="col-xs-3 element-item img_wrap2 ap">
      <img src="<c:url value='/resources/images/main_image6.jpg' />" alt="안나와"/>
      <div class="innerText">
              <p class="Text_title" ><span >TITLE</span></p>
            <p class="" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
       </div>
   </div>
  </div>
  
  
 
