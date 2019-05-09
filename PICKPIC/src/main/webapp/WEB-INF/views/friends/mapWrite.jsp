<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<link href="<c:url value='/css/mapWrite.css'/>" rel="stylesheet">
<script src="<c:url value='/js/mapWrite.js'/>"></script>
<script src="<c:url value='/js/isotope-docs.min.js'/>"></script>

<script>
$(function(){
	$('.main_title').click(function(){
		$(this).val("");
		
		
	});
});
</script>
<%-- 
<button class="a">버튼 눌러주세요</button>
 <div style="margin-left:50px;">
	<c:forEach var="data" items="${data}" varStatus="loop">
		 <div>${data.title }</div>
		 <div>${data.addr }</div>
		 <div>${loop.index }</div>
		 <br /><br /><br />
	</c:forEach>
</div> --%>
	<!-- 나만의 사진여행 값 1   사진 값 2 주소 3 전화번호 4 지역제목 5 -->
	<section class="all_wrap">
		<div class="writePage">
			<h1>나만의 사진여행기</h1>
			<div class="main_title_wrap">
				<input type="text" name="main_title" value="사진여행기 제목을 입력하세요" class="main_title"/>
				<input type="submit" class="btn btn-info" value="저장">
			</div>
			<div class="contents">
				<img src="<c:url value='/resources/images/crew4.jpg'/>" />
				<p>서울 <span>사진여행 일정</span></p>
				<input type="text" name="loopindex" value="결과값" >
			</div>
			
		</div>
	</section>
	
	