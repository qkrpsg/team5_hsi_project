<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<link href="<c:url value='/css/Place.css'/>" rel="stylesheet">
<script>
$(function(){
	
	$('.l_place_selector_wrap p').click(function(){
		//$(this).find('.l_place_selector_span').css({widtn:"100%"});
		//$('.l_place_selector_span').animate({width:"100%"},2000);
		
		$('.l_place_selector_span').animate({width:"0%"},300);
		$(this).find('.l_place_selector_span').animate({width:"100%"},500);
		
	});
	
	//
	
});

</script>


<div style="margin-top:100px;"></div>

<section class="l_place_sec_all_wrap">
	<div class="l_place_all_margin_wrap">
		
			 <div class="l_place_left_wrap">
				<div>
					<h3>장소</h3>
					<p>전 세계 사진 명소를 빠르게 검색하세요</p>
				</div>
				<div class="l_place_selector_wrap">
					<p>장소<span class="l_place_selector_span"></span></p>
					<p>필터<span class="l_place_selector_span"></span></p>
					<p>루트<span class="l_place_selector_span"></span></p>
				</div>
				<div class="l_place_form_wrap">
					<form action="">
						<input type="text" value="" placeholder="키워드를 검색하세요"/>
						<input type="text" value="" placeholder="국가 -도시명"/>
						<input class="btn btn-info"type="submit" value="검색" />
					</form>
				</div>
				
			</div> 
			
			<%-- <div class="l_place_right_wrap">
				<div><p>주간 베스트 지역</p></div>
				<div class="l_place_best_wrap">
					<div class="l_place_best_img"><img alt="" src="<c:url value='/resources/images/gren1.jpg'/>"/></div>
					<div class="l_place_best_img"><img alt="" src="<c:url value='/resources/images/gren2.jpg'/>"/></div>
					<div class="l_place_best_img"><img alt="" src="<c:url value='/resources/images/gren3.jpg'/>"/></div>
				</div>
			</div> --%>
			
			<div class="l_thumbnail-wrapper">	
<div><p>주간 베스트 지역</p></div>		
<div class="thumbnail-wrapper"> 
  <div class="thumbnail"> 
	  <div class="centered"> 
	  	<img src="https://t1.daumcdn.net/movie/e49c2e4eb419a9813228b5ab6bc5b039362236ea">
	  </div>
  </div>
  
  
 <div class="thumbnail"> 
	  <div class="centered"> 
	  	<img src="http://image.chosun.com/sitedata/image/201706/27/2017062701494_0.jpg"/>
	  </div>
  </div>

  <div class="thumbnail"> 
	  <div class="centered"> 
	  	<img src="http://image.chosun.com/sitedata/image/201711/14/2017111401718_0.jpg"/>
	  </div>
  </div> 
  
  <div class="thumbnail"> 
	  <div class="centered"> 
	  	<img src="http://image.chosun.com/sitedata/image/201711/14/2017111401718_0.jpg"/>
	  </div>
  </div> 
  
  <div class="thumbnail"> 
	  <div class="centered"> 
	  	<img src="http://mblogthumb4.phinf.naver.net/20151027_139/mygomi99_14459070926033WQ0a_JPEG/movie_imageNTRGOCFN.jpg?type=w2"/>
	  </div>
  </div> 
  <div class="thumbnail"> 
	  <div class="centered"> 
	  	<img src="https://t1.daumcdn.net/movie/e49c2e4eb419a9813228b5ab6bc5b039362236ea"/>
	  </div>
  </div> 
  

</div>
</div>
			
			
			

</div>

</section>


<div class="container ">
    <div class="row" >
      <div class="button-group filters-button-group" >
        <ul>
            <button class="button" is-checked" data-filter="*"><span class="nav_color"></span><a >All</a></button>
            <button class="button" data-filter=".ko"><span class="nav_color"></span><a >한국</a></button>
            <button class="button" data-filter=".am"><span class="nav_color"></span><a >미국</a></button>
            <button class="button" data-filter=".ni"><span class="nav_color"></span><a >일본</a></button>
           
            <button class="button" data-filter=".cha"><span class="nav_color"></span><a >중국</a></button>
            <button class="button" data-filter=".ho"><span class="nav_color"></span><a >호주</a></button>
            <button class="button" data-filter=".ap"><span class="nav_color"></span><a >아프리카</a></button>
            
        </ul>
      </div>
    </div>


 

  </div>
 
 
 <div class="container-fluid">
	<div style="float: left;margin:10px;">총 게시물  4,563 </div>
    <div style="float: right;margin:10px;margin-right:20px;"><a href="#">인기순 </a> / <a href="#">최근순</a></div>
    <button class="btn btn-info" style="clear:both;float: right;margin-right:20px;">등록</button>
 
    <div class="grid" style="clear: both;">
      <div class="element-item ko" >
          <a href="#"><img alt="" src="<c:url value='/resources/images/gren1.jpg'/>"/></a>
      </div>
        <div class="element-item am" data-category="post-transition">
        <a href="#"><img alt="" src="<c:url value='/resources/images/gren2.jpg'/>"/></a>
        </div>
        <div class="element-item ni" data-category="alkali ">
            <a href="#"><img alt="" src="<c:url value='/resources/images/gren3.jpg'/>"/></a>
          </div>
          <div class="element-item cha" data-category="post-transition">
          <a href="#"><img alt="" src="<c:url value='/resources/images/gren4.jpg'/>"/></a>
          </div>
          <div class="element-item ho" data-category="alkali">
              <a href="#"><img alt="" src="<c:url value='/resources/images/gren.jpg'/>"/></a>
        </div>
        <div class="element-item ap" data-category="alkali">
            <a href="#"><img alt="" src="<c:url value='/resources/images/gren.jpg'/>"/></a>
      </div>
      </div>

 </div>
 
 <script src="<c:url value='/js/Place.js'/>"></script> 
<script src="<c:url value='/js/isotope-docs.min.js'/>"></script>