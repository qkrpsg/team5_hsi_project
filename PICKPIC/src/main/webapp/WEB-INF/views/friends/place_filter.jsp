<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<link href="<c:url value='/css/Filter2.css'/>" rel="stylesheet">
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

<script
	src="<c:url value='js/vendor/modernizr-2.8.3-respond-1.4.2.min.js'/>"></script>

<section class="banner" id="top">
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="banner-caption">
					<div class="line-dec"></div>
					<h2>픽 플레이스</h2>
					<span>키워드로 원하는 플레이스를 검색하고 픽보관함에 담아보세요. </span>
					<div class="blue-button">
						<a class="scrollTo" data-scrollTo="popular" href="#best">+ 베스트
							픽</a>
					</div>
				</div>
				<div class="submit-form" id="serchlist">
					<form id="form-submit" action="" method="get">
						<div class="row">
							<div class="col-md-3 first-item">
								<fieldset>
									<input name="name" type="text" class="form-control" id="name"
										placeholder="픽 플레이스명" required="">
								</fieldset>
							</div>
							<div class="col-md-3 second-item">
								<fieldset>
									<input name="location" type="text" class="form-control"
										id="location" placeholder="키워드를 입력하세요." required="">
								</fieldset>
							</div>
							<div class="col-md-3 third-item">
								<fieldset>
									<select required name='category' onchange='this.form.()'>
										<option value="">세부분류</option>
										<option value="Kor">오전</option>
										<option value="Usa">낮</option>
										<option value="Jan">오후</option>
										<option value="Chi">종일</option>
									</select>
								</fieldset>
							</div>
							<div class="col-md-3">
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

<section class="pricing-tables" style="padding:0;" >
	<div class="container con">
	    <div class="row" >
	      <div class="button-group filters-button-group" >
	        <ul>
	            <button class="btn btn-info" is-checked" data-filter="*"><span class="nav_color"></span><a >All</a></button>
	            <button class="btn btn-info" data-filter=".vintage"><span class="nav_color"></span><a >VI</a></button>
	            <button class="btn btn-info" data-filter=".lomo"><span class="nav_color"></span><a >LO</a></button>
	            <button class="btn btn-info" data-filter=".clarity"><span class="nav_color"></span><a >CL</a></button>
	            <button class="btn btn-info" data-filter=".sinCity"><span class="nav_color"></span><a >SI</a></button>
	            <button class="btn btn-info" data-filter=".pimhole"><span class="nav_color"></span><a >PI</a></button>
	            <button class="btn btn-info" data-filter=".nostalgia"><span class="nav_color"></span><a >NO</a></button>  
	            <button class="btn btn-info" data-filter=".herMajesty"><span class="nav_color"></span><a >HE</a></button>  
	            <button class="btn btn-info" data-filter=".crossProcess"><span class="nav_color"></span><a >CR</a></button>  
	        </ul>
	      </div>
    	</div>
    </div>
	</section>

<section class="pricing-tables">
	<a href="<c:url value='/friends/place.pic'/>" class="btn btn-info"style="float: right; margin-right: 20px; margin-top: 20px;">작성하러가기</a>
	<div class="container">
		<div class="grid">
			<c:forEach var="list" items="${list }" varStatus="loop">
				<div class="col-xs-3 element-item img_wrap2 ${list.F_NAME }">
					<img src="<c:url value='${list.PPB_IMAGE_PATH }' />" alt="안나와" />
					<div class="innerText">
						<p class="Text_title">
							<span>${list.PPB_TITLE}</span>
						</p>
						<p class="">
							<span>${list.PPB_CONTENT}</span>
						</p>
					</div>
					<div class="hi">
						<a href="<c:url value='/pay/pay.pic?f_name=${list.F_NAME }'/>">구매하기</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>

<section class="featured-places" id="best">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<span>베스트 픽 플레이스</span>
					<h2>인기 있는 플레이스를 만나보세요!</h2>
				</div>
			</div>
		</div>

		<div class="row">

			<div class="col-md-4 col-sm-6 col-xs-12">
				<div class="featured-item">
					<div class="thumb">
						<img
							src="<c:url value='/resources/images/test/featured_item_1.jpg'/>"
							alt="">
						<div class="date-content">
							<h6>C1</h6>
							<span>픽 20</span>
						</div>
					</div>
					<div class="down-content">
						<div class="row">
							<div class="col-md-6 first-button">
								<div class="text-button">
									<a href="#">픽보관함 담기</a>
								</div>
							</div>
							<div class="col-md-6">
								<div class="text-button">
									<a href="#serchlist">검색하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-sm-6 col-xs-12">
				<div class="featured-item">
					<div class="thumb">
						<img
							src="<c:url value='/resources/images/test/featured_item_1.jpg'/>"
							alt="">
						<div class="date-content">
							<h6>C1</h6>
							<span>픽 20</span>
						</div>
					</div>
					<div class="down-content">
						<div class="row">
							<div class="col-md-6 first-button">
								<div class="text-button">
									<a href="#">픽보관함 담기</a>
								</div>
							</div>
							<div class="col-md-6">
								<div class="text-button">
									<a href="#serchlist">검색하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-sm-6 col-xs-12">
				<div class="featured-item">
					<div class="thumb">
						<img
							src="<c:url value='/resources/images/test/featured_item_1.jpg'/>"
							alt="">
						<div class="date-content">
							<h6>C1</h6>
							<span>픽 20</span>
						</div>
					</div>
					<div class="down-content">
						<div class="row">
							<div class="col-md-6 first-button">
								<div class="text-button">
									<a href="#">픽보관함 담기</a>
								</div>
							</div>
							<div class="col-md-6">
								<div class="text-button">
									<a href="#serchlist">검색하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
</section>

<script>

</script>


<script>window.jQuery || document.write('<script src="<c:url value='js/vendor/modernizr-2.8.3-respond-1.4.2.min.js'/>"><\/script>')</script>
<script src="<c:url value='js/datepicker.js'/>"></script>
<script src="<c:url value='js/plugins.js'/>"></script>
<script src="<c:url value='js/Main.js'/>"></script>







