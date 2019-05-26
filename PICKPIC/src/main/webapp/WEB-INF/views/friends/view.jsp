<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="<c:url value='/css/view.css'/>" rel="stylesheet" />

<script>
  /* $(function(){
	
	let innerHeight = window.innerHeight - 180;
	console.log(innerHeight);
	$('.wrap').css("height",innerHeight + "px");
	$(window).resize(function(){
		innerHeight = window.innerHeight - 180;
		$('.wrap').css("height",innerHeight + "px");		
		console.log(innerHeight);	
		
	});
	 
 }); */
</script>
<section class="wrap">
	
	
	<div class="row" >
		
		<div class="col-md-12 bunka">
			한소인 문화거리
		</div>
		
		<div class="col-md-offset-5 col-md-2">
			<hr style="border: solid 1px #696969">
		</div>
		
		<div class="col-md-12 wrap_two" >
		
			<div class="syasin" >
				<c:forEach  var="recode" items="${recode }" varStatus="loop">
					<div class="syasins">
						<div class="syasins_wrap">			
							<img src="${recode.PRP_IMAGE_PATH }" class="sa">
						</div>
						<div class="text_wrap">
							<p>${recode.PRP_ORDER }.${recode.PRP_TITLE }</p>
						</div>
					</div>
				</c:forEach>
			</div>
			
			
			
			<div class="right_text">
				<c:forEach  var="recode2" items="${recode2 }" varStatus="loop">
					<div>
						<p class="text1">제목</p>
						<p class="text2">${recode2.PRB_TITLE }</p>
						<hr style="border: solid 1px #DCDCDC;width:200px;margin:0 auto;margin-top:20px;" />
					</div>
					
					<div>
						<p class="text1 co">내용</p>
						<p class="text2">${recode2.PRB_CONTENT }</p>
					</div>
				</c:forEach>
				<div class="btns">
					<a href="<c:url value='/friends/notice.pic?noInsert=hi'/>"><button class="homebtn">이전</button></a>
					<button class="homebtn">☆즐겨찾기추가</button>
					<button class="homebtn">★지도</button>
				</div>
			</div>
			
		</div>
	
		
	</div>
<!-- row -->
</section>
