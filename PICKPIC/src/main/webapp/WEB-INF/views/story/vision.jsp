<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<style>
*{   margin:0;
   padding:0;
   border:0;
   box-sizing: border-box;
}
img{display: block;}
a{
   text-decoration: none;
   
}




.header_top{
   background: white !important;
   opacity:1;
   background:white;
   border-bottom:1px #ccc solid;
}
.menu_wrap a{
   color:#5a5a5a !important;
   font-weight: normal !important;
   font-size:1.1em !important;
}
.ul_submenu li a{
   color:#5a5a5a !important;
   font-weight: normal !important;
   font-size:.9em !important;
}

.login_wrap ul li a{
   color:#7DA7D9 !important;   
}
.login_wrap ul li a span{
   background:#00AEEA !important;
}
.nav_wrap_top_position{
   opacity:1;
   background:white;
   border-bottom:1px #ccc solid;
}
/* 메인 페이지 이외에 페이지에서 넣어야 하는 속성 */


</style>

<div class="row" style="margin-top:3%">
		<div class="col-md-offset-1 col-md-10"
			style="text-align: center; text-shadow: #999999 5px 5px 5px; font-size: 4.0em;margin-top: 3%">
			"Pick and Picnic" <br />멋진 사진을 위한 새로운 연결, 피크픽!
		</div>
		<div class="img-holder" data-image="<c:url value='/resources/images/e1.jpg'/>" data-width="1600"
			data-height="900" data-extra-height="50"></div>
		<section style="margin:8%">
			<p style="font-size: 3.0em; font-weight: bold">이것 때문에 만들었다.</p>
			<p style="font-size: 2.3em">원하는 장소에서 멋진 사진을 찍기 위해 사진명소를 공유한다.</p>

		</section>

		<div class="img-holder" data-image="<c:url value='/resources/images/e2.jpg'/>" data-cover-ratio="0.75"
			data-width="1680" data-height="1050"></div>

      		<section style="margin:8%">

			<p style="font-size: 3.0em; font-weight: bold;">우리는 이런 것을 한다?</p>
			<p style="font-size: 2.3em">
				첫 번째 , 자신의 위치에서 제일 가까운 명소를 추천한다. <br />더 이상 명소를 찾아 헤매지 말라!!! <br />두
				번째, 해당 장소와 시간에 제일 많이 사용한 필터를 추천한다.</br/>필터 찾느라 타이밍을 놓치지 말라!!! <br />세 번째,
				사진명소를 모아 여행 루트를 계획하고 추천한다.<br />여행에서 남는 건 사진뿐! 멋진 여행지를 골라 가자!!

			</p>


		</section>

		<div class="img-holder" data-image="<c:url value='/resources/images/e3.jpg'/>"></div>

		<section style="margin:8%">
			<p style="font-size: 3.0em; font-weight: bold">앞으로 이렇게 할 것이다!</p>
			<p style="font-size: 2.3em">
				피크픽은 멋진 사진을 위해 더 편리한 환경을 제공하는 것을 꿈꿉니다. <br />어제보다 더 나은 곳으로 만글기 위해
				노력합니다.
			</p>


		</section>

		<script
			src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="<c:url value='/js/jquery.imageScroll.min.js'/> "></script>

		<script>
        $('.img-holder').imageScroll({
//            image: null,
//            imageAttribute: 'image',
//            container: $('body'),
//            windowObject: $(window),
//            speed:.2,
//            coverRatio:.75,
//            coverRatio:1,
//            holderClass: 'imageHolder',
//            imgClass: 'img-holder-img',
//            holderMinHeight: 200,
//            holderMaxHeight: null,
//            extraHeight: 50,
//            mediaWidth: 1600,
//            mediaHeight: 900,
//            parallax: true,
//            touch: false
        });
    </script>




