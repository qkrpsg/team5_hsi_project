<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->
<link href="<c:url value='/css/Pkp.css' />" rel="stylesheet">

<!-- CSS Bootstrap & Custom -->
<link rel="stylesheet" href="<c:url value='/css/templatemo-misc.css'/>">
<link rel="stylesheet" href="<c:url value='/css/animate.css'/>">
<link rel="stylesheet" href="<c:url value='/css/templatemo-main.css'/>">



<div style="height: 80px"></div>
<!-- /#home -->
<div class="flexslider">
	<ul class="slides">
		<li class="flex-active-slide"
			style="float: left; margin-right: -100%; position: relative; opacity: 1; display: block; z-index: 2;">

			<img src="<c:url value='/resources/images/banner01.jpg'/>" alt=""
			draggable="false">

			<div class="flex-caption animated bounceInDown">
				<h2>앨범다운</h2>
				<%-- <button class="btn btn-primary btn-lg" style="margin-bottom: 40px"
					id="btn_option"
					onclick="location.href='<c:url value="/friends/albumDown_option.pic"/>' ">사진
					옵션 선택하기</button> --%>
				<button class="btn btn-info btn-lg" style="margin-bottom: 40px"
					data-toggle="modal" data-target="#myModal">사진 옵션 선택하기</button>
				<p>
					내 픽크픽 사진들을 한꺼번에 파일로 저장하세요.<br>또 다른 사진에 내가 가지고 있는 필터를 적용해보세요.
				</p>
			</div>
</div>
</div>
</li>
</ul>
</div>
<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Modal Header</h4>
							</div>
							<div class="modal-body">
								<p>Some text in the modal.</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

<%-- <div id="services" class="section-cotent">
		<div class="container">
			<div class="title-section text-center">
				<h2>Our Services</h2>
				<span></span>
			</div>
			<!-- /.title-section -->
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="service-item">
						<div class="service-header">
							<i class="fa fa-umbrella"></i>
							<h3>Clean Design</h3>
						</div>
						<div class="service-description">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Molestiae, sapiente, saepe, velit,
							repellendus doloribus blanditiis repudiandae nobis optio quasi
							nulla aliquam nisi voluptatibus.</div>
					</div>
					<!-- /.service-item -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item">
						<div class="service-header">
							<i class="fa fa-desktop"></i>
							<h3>Fully Responsive</h3>
						</div>
						<div class="service-description">
							<a rel="nofollow" href="/" target="_parent">Compass</a> is free
							responsive website template from templatemo. You can download and
							use this template for your websites. Please tell your friends
							about our website. Thank you for visiting us.
						</div>
					</div>
					<!-- /.service-item -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item">
						<div class="service-header">
							<i class="fa fa-cogs"></i>
							<h3>Easy Editing</h3>
						</div>
						<div class="service-description">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Molestiae, sapiente, saepe, velit,
							repellendus doloribus blanditiis repudiandae nobis optio quasi
							nulla aliquam nisi voluptatibus.</div>
					</div>
					<!-- /.service-item -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="service-item">
						<div class="service-header">
							<i class="fa fa-heart"></i>
							<h3>Fast Support</h3>
						</div>
						<div class="service-description">Lorem ipsum dolor sit amet,
							consectetur adipisicing elit. Molestiae, sapiente, saepe, velit,
							repellendus doloribus blanditiis repudiandae nobis optio quasi
							nulla aliquam nisi voluptatibus.</div>
					</div>
					<!-- /.service-item -->
				</div>
				<!-- /.col-md-3 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#services -->

	<div id="portfolio" class="section-content">
		<div class="container">
			<div class="title-section text-center">
				<h2>Our Portfolio</h2>
				<span></span>
			</div>
			<!-- /.title-section -->
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="<c:url value='/resources/images/portfolio/item1.jpg'/>"
							alt="Portfolio Item 1">
						<div class="overlay">
							<div class="inner">
								<h4>
									<a data-rel="lightbox"
										href="<c:url value='/resources/images/portfolio/item1.jpg'/>">Nulla
										non enim</a>
								</h4>
								<span>Design</span>
							</div>
						</div>
						<!-- /.overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="<c:url value='/resources/images/portfolio/item2.jpg'/>"
							alt="Portfolio Item 2">
						<div class="overlay">
							<div class="inner">
								<h4>
									<a data-rel="lightbox" href="images/portfolio/item2.jpg">Duis
										nec urna</a>
								</h4>
								<span>Creative</span>
							</div>
						</div>
						<!-- /.overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="<c:url value='/resources/images/portfolio/item3.jpg'/>"
							alt="Portfolio Item 3">
						<div class="overlay">
							<div class="inner">
								<h4>
									<a data-rel="lightbox" href="images/portfolio/item3.jpg">Etiam
										magna</a>
								</h4>
								<span>Design</span>
							</div>
						</div>
						<!-- /.overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="<c:url value='/resources/images/portfolio/item4.jpg'/>"
							alt="Portfolio Item 4">
						<div class="overlay">
							<div class="inner">
								<h4>
									<a data-rel="lightbox" href="images/portfolio/item4.jpg">Vivamus
										dignissim</a>
								</h4>
								<span>Creative</span>
							</div>
						</div>
						<!-- /.overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.col-md-3 -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="<c:url value='/resources/images/portfolio/item5.jpg'/>"
							alt="Portfolio Item 5">
						<div class="overlay">
							<div class="inner">
								<h4>
									<a data-rel="lightbox"
										href="<c:url value='/resources/images/portfolio/item5.jpg'/>">Fusce
										semper</a>
								</h4>
								<span>HTML CSS</span>
							</div>
						</div>
						<!-- /.overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="<c:url value='/resources/images/portfolio/item6.jpg'/>"
							alt="Portfolio Item 6">
						<div class="overlay">
							<div class="inner">
								<h4>
									<a data-rel="lightbox"
										href="<c:url value='/resources/images/portfolio/item6.jpg'/>">Nunc
										ultrices</a>
								</h4>
								<span>Mobile</span>
							</div>
						</div>
						<!-- /.overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="<c:url value='/resources/images/portfolio/item7.jpg'/>"
							alt="Portfolio Item 7">
						<div class="overlay">
							<div class="inner">
								<h4>
									<a data-rel="lightbox"
										href="<c:url value='/resources/images/portfolio/item7.jpg'/>">Fusce
										vehicula</a>
								</h4>
								<span>HTML CSS</span>
							</div>
						</div>
						<!-- /.overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.col-md-3 -->
				<div class="col-md-3 col-sm-6">
					<div class="portfolio-thumb">
						<img src="<c:url value='/resources/images/portfolio/item8.jpg'/>"
							alt="Portfolio Item 8">
						<div class="overlay">
							<div class="inner">
								<h4>
									<a data-rel="lightbox"
										href="<c:url value='/resources/images/portfolio/item8.jpg'/>">Vivamus
										elementum</a>
								</h4>
								<span>Mobile</span>
							</div>
						</div>
						<!-- /.overlay -->
					</div>
					<!-- /.portfolio-thumb -->
				</div>
				<!-- /.col-md-3 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /#portfolio --> --%>

<script>
	function showPopup() {
		window.open("/pickpic/friends/editor_popup.pic", "피크픽 포토에디터");
	}
</script>
