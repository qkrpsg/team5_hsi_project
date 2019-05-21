<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link href="<c:url value='/css/user_end.css'/>" rel="stylesheet"/>
<script>
$(function(){
	$('.write_btn').css("top",$('.wrap').height()+50);
});

/* 
$(function(){
	$('.main_title').click(function(){
		$(this).val("");
	});
	var innerHeight = window.innerHeight - 180;
	console.log(innerHeight);
	$('.writePage').css("height",innerHeight + "px");
	$(window).resize(function(){
		innerHeight = window.innerHeight - 180;
		$('.writePage').css("height",innerHeight + "px");		
		console.log(innerHeight);	
		
	});
	
}); */
</script>
<body>
	
	<section class="all_wrap">
		<hr class='one_hr'/>
		<div class="wrap">
			<div>
				<h3>PICKPIC에 등록되어 있는 사진들(총 ${fn:length(recode) }개)</h3>
			</div>
			<div class="box_wrap">
				<select class="btn btn-info">
					<option >서울</option>
					<option>인천</option>
					<option>대전</option>
					<option>대구</option>
					<option>광주</option>
					<option>부산</option>
					<option>울산</option>
					<option>세종특별자치시</option>
					<option>경기도</option>
					<option>강원도</option>
					<option>충청북도</option>
					<option>충청남도</option>
					<option>경상북도</option>
					<option>경상남도</option>
					<option>전라북도</option>
					<option>전라남도</option>
					<option>제주도</option>
				</select>
				<button class="btn btn-info">조회순</button>
				<button class="btn btn-info">제목순</button>
				<button class="btn btn-info">인기순</button>
			</div><!-- 셀렉트 태그 -->
			<div class="user_end_all_wrap">
				
			
					<!-- forEach 넣을 곳 -->
					<c:forEach var="recode" items="${recode }" varStatus="loop">
				
						<div class="user_end_wrap">
							<%-- <input type="hidden" name="prb_index" value="${recode.PRB_INDEX }">
							<input type="hidden" name="prb_post_date" value="${recode.PRB_POST_DATE }"> --%>
							<div>
								<div class="contents_wrap">
									<div class="img_wrap"><a href="<c:url value='/friends/view.pic?prb_index=${recode.PRB_INDEX }&prb_id=${recode.PRB_ID }'/>"><img src="${recode.PRP_IMAGE_PATH }" /></a></div>
									<div class="contents_text">
										<div>
											<p>
												<span style="font-size:.9em;color:#269abc;font-family: NANUMSQUAREROUNDB;">조회수 : ${recode.PRB_VIEW }</span>
												&nbsp;&nbsp;
												<span style="font-size:.9em;color:#666;font-family: NANUMSQUAREROUNDB;">추천수 : ${recode.PRB_RECOMMEND }<a href="<c:url value='/f/f.pic?prb_index=${recode.PRB_INDEX }'/>"><i class="fa fa-fw fa-thumbs-o-up" style="float: right;cursor: pointer;color:black;font-size:1.2em;"></i></a></span>
											</p>
										</div>
										<p class="user_title">${recode.PRB_TITLE }</p>
										
										<hr />
										<div class="user_contents">
											<p>${recode.PRB_CONTENT }</p>
										</div>
										
									</div>
								</div>
							</div>
						</div><!-- 게시판 뿌려주는 곳 -->
					</c:forEach>
				
				
			</div>
			<a href="<c:url value='/friends/place.pic' />" class="btn btn-info write_btn">작성하러가기</a>
		</div>
		
	</section>
	
	<%-- 
	<div class="row" >
		<div class="col-md-offset-4 col-md-5" ><!--  style="margin-top: 4%" -->
			<p class="text1">PICKPIC에 등록되어 있는 사진들(총 ****개)</p>
		</div>
		 <div class="col-md-12 new_lee">
			<hr  /><!-- 여기가 선 부분 -->
		</div>
		<div class="col-md-12 " ><!-- style="margin-top: 2%; margin-bottom: 2%;" -->
			<div class="col-md-offset-4 col-md-4" ><!-- style="z-index: 3;padding-left: 5%; " -->
				<div class="dropdown">
					<button class="dropdown-button">전체보기</button>
					<div class="dropdown-content">
						<a href="#">서울</a> 
						<a href="#">경기도</a> 
						<a href="#">부산</a> 
						<a href="#">제주도</a>
					</div>
				</div>
				<button class="search">조회</button>
				<button class="search">조회순</button>
				<button class="search">제목순</button>

			</div>
		</div>
		<div class="col-md-12" style="margin-top: 2%">
			<div class="col-md-offset-3 col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>
					<a href="<c:url value='/friends/search.pic'/>">제목~~~~~</a>
				</p>


				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>
			.
			<div class="col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>제목~~~~~</p>
				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>
			<div class="col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>제목~~~~~</p>
				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>







		</div>
		<div class="col-md-12" style="margin-top: 3%">
			<div class="col-md-offset-3 col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>제목~~~~~</p>
				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>
			.
			<div class="col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>제목~~~~~</p>
				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>
			<div class="col-md-2">
				<img src="<c:url value='/resources/images/1.jpg' />" class="sa">
				<p>제목~~~~~</p>
				<hr style="border: solid 1px #708090" />
				<p>내용~~~~~~~~~</p>

			</div>

		</div> 
	</div> --%>
</body>
