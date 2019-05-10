<%@page import="org.springframework.web.multipart.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- albumEditor.jsp -->

<!-- css&js -->
<link href="<c:url value='/css/Navbar.css' />" rel="stylesheet">
<link href="<c:url value='/css/Modal.css'/>" rel="stylesheet">
<link href="<c:url value='/css/Preview.css'/>" rel="stylesheet">

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
    <div class="navbar-header">
      <a class="navbar-brand" data-toggle="modal" id="option_btn">+ 가져오기</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">홈</a></li>
      <li class="dropdown">
      <a class="dropdown-toggle" data-toggle="dropdown" href="#">필터 보관함<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a id="myfilter_btn" href="#">내 필터</a></li>
          <li><a id="purchase_btn" href="#">구매하기</a></li>
        </ul>
      </li>
      <li><a href="#">원래대로</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> 12/30</a></li>
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 저장하기</a></li>
    </ul>
  </div>
</nav>
<!-- 상단 바 끝-->  