<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>


<link href="<c:url value='/css/Filter.css'/>" rel="stylesheet">
<script src="<c:url value='/js/Filter.js'/>"></script>
<script src="<c:url value='/js/isotope-docs.min.js'/>"></script>


<link rel="stylesheet" href="<c:url value='/css/fontAwesome.css'/>">
<link rel="stylesheet" href="<c:url value='/css/hero-slider.css' /> ">
<link rel="stylesheet" href="<c:url value='/css/owl-carousel.css'/>">
<link rel="stylesheet" href="<c:url value='/css/datepicker.css' /> ">

<!-- 첫상단 고정 필터용 -->
<link href="<c:url value='/css/cssco.css'/>" rel=" stylesheet ">

<link href="<c:url value='/css/FilterList.css'/>" rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/css/templatemo-style2.css'/>">

<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">
<%-- 
<script
	src="<c:url value='js/vendor/modernizr-2.8.3-respond-1.4.2.min.js'/>"></script> --%>

<style>
.text1{
font-size: 25px;
margin-left: 5%;

}

</style>


<section class="banner" id="top">
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="banner-caption">
					<div class="line-dec"></div>
					<h2>필터</h2>
					<span>키워드로 원하는 필터를 검색하고 픽보관함에 담아보세요. </span>
					<div class="blue-button">
						<a class="scrollTo" data-scrollTo="popular" href="#best">+ 베스트
							필터</a>
					</div>
				</div>
				<div class="submit-form" id="serchlist">
					<form id="form-submit" action="" method="get">
						<div class="row">
							<div class="col-md-10 second-item">
								<fieldset>
									<input name="location" type="text" class="form-control"
										id="location" placeholder="키워드를 입력하세요." required="">
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

<section class="pricing-tables" style="padding: 0;">
	<div class="container con">
		<div class="row">
			<div class="button-group filters-button-group">
				<ul>
					<button class="btn btn-info" is-checked" data-filter="*">
						<span class="nav_color"></span><a>All</a>
					</button>
					<button class="btn btn-info" data-filter=".vintage">
						<span class="nav_color"></span><a>VI</a>
					</button>
					<button class="btn btn-info" data-filter=".lomo">
						<span class="nav_color"></span><a>LO</a>
					</button>
					<button class="btn btn-info" data-filter=".clarity">
						<span class="nav_color"></span><a>CL</a>
					</button>
					<button class="btn btn-info" data-filter=".sincity">
						<span class="nav_color"></span><a>SI</a>
					</button>
					<button class="btn btn-info" data-filter=".pinhole">
						<span class="nav_color"></span><a>PI</a>
					</button>
					<button class="btn btn-info" data-filter=".nostalgia">
						<span class="nav_color"></span><a>NO</a>
					</button>
					<button class="btn btn-info" data-filter=".hermajesty">
						<span class="nav_color"></span><a>HE</a>
					</button>
					<button class="btn btn-info" data-filter=".crossprocess">
						<span class="nav_color"></span><a>CR</a>
					</button>
				</ul>
			</div>
		</div>
	</div>
</section>

<section class="pricing-tables">
	<div class="container">
		<div class="grid">

			<c:forEach var="list" items="${list }" varStatus="loop">
				<c:if test="${list.F_SALE_YN eq 'Y' }">
					<div class="col-xs-3 element-item img_wrap2 ${list.F_NAME }">
						<img src="${list.F_IMAGE_PATH }" alt="안나와" />
						<div class="innerText">
							<p class="text1" style="margin-top: 30%">
								<span>${list.F_NAME}</span>
							</p>
							<p class="text1">
								<span>가격 : ${list.F_CHANGE}</span>
							</p>

						</div>
						<!-- &f_change= ${list.F_CHANGE } -->
						<div class="hi">
							<a id="${list.F_NAME }" href="<c:url value='/pay/pay.pic?f_name=${list.F_NAME }'/>">구매하기</a>
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
					<span>베스트 필터</span>
					<h2>인기 있는 필터를 만나보세요!</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<c:forEach var="best" items="${best }" varStatus="loop">


					<div class="col-md-4 " style="float: left">
						<div class="featured-item">

							<div class="thumb">

								<img src="${best.F_IMAGE_PATH }" />
								<div class="date-content">
									<h6>${best.F_NAME }</h6>
									<span>판매수: ${best.TOTALFILTER }</span>
								</div>
							</div>
							<div class="down-content">
								<div class="row">
									<div class="col-md-12" style="text-align: center;">
										<a href="<c:url value='/pay/pay.pic?f_name=${best.F_NAME }'/>"><span
											style="font-size: 20px; margin-top: 3%">구매하기</span></a>
									</div>
								</div>
							</div>

						</div>

					</div>

				</c:forEach>
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
		$('.img_wrap img').css("height",$('.img_wrap').css('width'));//
		$('.img_wrap2 img').css("height",$('.img_wrap2').css('width'));//
		$('.innerText').css('height',$('.img_wrap2 img').css('height'));
		$('.innerText').css('width',$('.img_wrap2 img').css('width'));
	});
}); // end of ready()
</script>
<script src="<c:url value='js/Main.js'/>"></script> --%>
