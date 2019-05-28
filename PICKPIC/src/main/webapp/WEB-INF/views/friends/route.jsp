<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<link href="<c:url value='/css/Filter2.css'/>" rel="stylesheet">
<script src="<c:url value='/js/Filter.js'/>"></script>
<script src="<c:url value='/js/isotope-docs.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/css/fontAwesome.css'/>">
<link rel="stylesheet" href="<c:url value='/css/hero-slider.css' /> ">
<link rel="stylesheet" href="<c:url value='/css/owl-carousel.css'/>">
<link rel="stylesheet" href="<c:url value='/css/datepicker.css' /> ">
<link rel="stylesheet" href="<c:url value='/css/test/style2.css'/>">

<!-- 첫상단 고정 필터용 -->
<link href="<c:url value='/css/cssco.css'/>" rel=" stylesheet ">
<link href="<c:url value='/css/FilterList.css'/>" rel="stylesheet">
<link rel="stylesheet"
   href="<c:url value='/css/templatemo-style2.css'/>">

<link
   href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900"
   rel="stylesheet">

<script
   src="<c:url value='js/vendor/modernizr-2.8.3-respond-1.4.2.min.js'/>"></script>
<style>
.new{
padding: 5px;
   position: relative;
   overflow: hidden;
   
}
.new img{
   width:100%;
   height:285px;
   cursor: pointer;
}
.new2{
padding: 5px;
   position: relative;
   overflow: hidden;
  
}
.new2 img{
   width:100%;
   height:285px;
   cursor: pointer;
}

 .new:after{
   ontent: "";
    position: absolute;
    z-index: 1;
    width: 100px;
    height: auto;
    background: red;
    content: "New"; 
    text-align: center;
    color: #fff;
    font-family: 'Arial';
    font-weight: bold;
    padding: 5px 10px;
    left: -30px;
    top: 3px;
    transform: rotate(-30deg);
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.3);
}   
.tt{
margin-left:5%;

font-size: 25px;
color: white;
text-align: left;


}


</style>
<section class="banner" id="top">
   <div class="container">
      <div class="row">
         <div class="col-md-10 col-md-offset-1">
            <div class="banner-caption">
               <div class="line-dec"></div>
               <h2>픽 로드</h2>
               <span>원하는 루트로 자기만의 픽 로드를 만들어 봐요! </span>
               
               <div class="form-submit" >
                  <font style="vertical-align: inherit;"> 
                     <font style="vertical-align: inherit;"> 
                        <input type="submit" value="+ 픽 생성하기 " class="submit" id="submit" name="submit" 
                        onclick="location.href='<c:url value="/friends/map.pic"/>'">
                     </font>
                  </font> 
                  <font style="vertical-align: inherit;">
                     <font style="vertical-align: inherit;"> 
                        <input type="submit" value="베스트 픽" class="submit" id="reset" name="reset"
                        onclick="location.href='#best'">
                     </font>
                  </font>
               </div>
            </div>
            <div class="submit-form" id="serchlist">
               <form id="form-submit" action="" method="get">
                  <div class="row">
                     <div class="col-md-10 first-item">
                        <fieldset>
                           <input name="name" type="text" class="form-control" id="name"
                              placeholder="키워드로 검색하세요" required="">
                        </fieldset>
                     </div>
                     <div class="col-md-2">
                        <fieldset>
                           <button type="submit" id="form-submit" class="btn">검색</button>
                        </fieldset>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>
</section>

<section class="pricing-tables">
<%--    <a href="<c:url value='/friends/map.pic'/>" class="btn btn-info" style="float: right; margin-right: 20px; margin-top: 20px;">작성하러가기</a> --%>
   <div class="container">
      <div class="grid">
         <c:forEach var="recode" items="${recode}" varStatus="loop">
            <!-- 하루 사이 생성된 경우 new 표시 -->
            <c:if test="${recode.PRB_POST_DATE  >= (todayString-1)}" var="pa">
               <div class="col-xs-3 element-item img_wrap2 new ">
                  <img src="<c:url value='${recode.PRP_IMAGE_PATH }' />" alt="안나와" />
                  <div class="innerText">
                     <p class="tt" style="margin-top: 30%">
                        <span>${recode.PRB_TITLE}</span>
                     </p>
                  </div>
                  <div class="hi">
                     <a href="<c:url value='/friends/view.pic?prb_index=${recode.PRB_INDEX }&prb_id=${recode.PRB_ID }'/>">보러가기</a>
                  </div>
               </div>
            </c:if>
            <!-- new 표시 안함 -->
            <c:if test="${not pa}">
               <div class="col-xs-3 element-item img_wrap2 new2">
                  <img src="<c:url value='${recode.PRP_IMAGE_PATH }' />" alt="안나와" />
                  <div class="innerText">
                     <p class="tt" style="margin-top: 30%">
                        <span>${recode.PRB_TITLE }</span>
                     </p>

                  </div>
                  <div class="hi">
                     <a href="<c:url value='/friends/view.pic?prb_index=${recode.PRB_INDEX }&prb_id=${recode.PRB_ID }'/>">보러가기</a>
                  </div>
               </div>
            </c:if>
         </c:forEach>
      </div>
   </div>
</section>
<section class="featured-places" id="best">
   <div class="container">
      <div class="row">
         <div class="col-md-12">
            <div class="section-heading">
               <span>베스트 픽 로드</span>
               <h2>인기 있는 픽 로드를 만나보세요!</h2>
            </div>
         </div>
      </div>
      <div class="row">
      <div class="col-md-12">
       <c:forEach  var="bestroad" items="${bestroad }" varStatus="loop">
      

         <div class="col-md-4 " style="float: left">
            <div class="featured-item">
            
               <div class="thumb">
                  
                  <img src="${bestroad.PRP_IMAGE_PATH }" />
                  <div class="date-content">
                     <h6>조회수</h6>
                     <span>${bestroad.PRB_VIEW }</span>
                  </div>
               </div>
               <div class="down-content">
                  <div class="row">
                     
                     <div class=" col-md-12">
                        <div class="text-button" >
                           <a href="<c:url value='/friends/view.pic?prb_index=${bestroad.PRB_INDEX }&prb_id=${bestroad.PRB_ID }'/>"><span style="font-size: 20px;font-weight: bold">보러가기</span></a>
                        </div>
                     </div>
                  </div>
                  </div>
               
               </div>
            
            </div>
         
               </c:forEach >
               </div>
               </div>
     </div>
</section>

<script>
$(document).ready(function(){
    $(document).on("mouseover",".img_wrap2",function(event){
       //$('.img_wrap img').css("height",$('.img_wrap').css('width'));
       //$('.img_wrap2 img').css("height",$('.img_wrap2').css('width'));
       
       $('.innerText').css('height',$('.img_wrap2 img').css('height'));
       $('.innerText').css('width',$('.img_wrap2 img').css('width'));
      var img2 =$('.img_wrap2 img').css('height').replace('px','');
        $('.Text_title').css('margin-top',img2/2+"px");
       $(this).find('.innerText').css("display","block");
    });
    
    $(document).on("mouseout",".img_wrap2",function(event){
       $(this).find('.innerText').css("display","none");
    });
    $(window).resize(function(){
      $('.img_wrap img').css("height",$('.img_wrap').css('wi dth'));//
      $('.img_wrap2 img').css("height",$('.img_wrap2').css('width'));//
      $('.innerText').css('height',$('.img_wrap2 img').css('height'));
      $('.innerText').css('width',$('.img_wrap2 img').css('width'));
   });
}); // end of ready()
</script>



<script>window.jQuery || document.write('<script src="<c:url value='js/vendor/modernizr-2.8.3-respond-1.4.2.min.js'/>"><\/script>')</script>
<script src="<c:url value='js/datepicker.js'/>"></script>
<script src="<c:url value='js/plugins.js'/>"></script>
<script src="<c:url value='js/Main.js'/>"></script>