<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<div class="row" style="margin-top:3%">
		<section style="margin:8%">
			<p style="font-size: 3.0em; font-weight: bold">이것 때문에 만들었다.</p>
			<p style="font-size: 2.3em">원하는 장소에서 멋진 사진을 찍기 위해 사진명소를 공유한다.</p>

		</section>

		<div class="img-holder" data-image="<c:url value='/resources/images/e1.jpg'/>" data-width="1600"
			data-height="900" data-extra-height="50"></div>
		<section style="margin:8%">
			<p style="font-size: 3.0em; font-weight: bold">이것 때문에 만들었다.</p>
			<p style="font-size: 2.3em">원하는 장소에서 멋진 사진을 찍기 위해 사진명소를 공유한다.</p>

		</section>
		<div id="test">
		</div>
		
		<script
			src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="<c:url value='/js/jquery.imageScroll.min.js'/> "></script>

		<script>
        $('.img-holder').imageScroll({container : $('#test')});
    </script>




