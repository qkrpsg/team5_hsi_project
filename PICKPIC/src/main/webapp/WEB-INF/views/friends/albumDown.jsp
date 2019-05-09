<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- css&js -->
<link href="<c:url value='/css/Pkp.css' />" rel="stylesheet">
<link href="<c:url value='/css/DownButton.css' />" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/css/animate.css'/>">


<!-- body -->

<div id="intro">
	<div class="landing-text animated bounceInDown">
		<h1>앨범다운</h1>
		<a class="btn btn-info btn-lg" role="button"
			href="<c:url value='/friends/albumEditor.pic'/>" >사진 옵션 선택하기</a>
		<h3>
			내 픽크픽 사진들을 한꺼번에 파일로 저장하세요. <br>또 다른 사진에 내가 가지고 있는 필터를 적용해보세요.
		</h3>
	</div>
</div>


