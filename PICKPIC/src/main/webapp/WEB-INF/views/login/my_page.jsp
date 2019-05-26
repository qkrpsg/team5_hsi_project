<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<link href="<c:url value='/css/test/style3.css'/>" rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/css/test/themify-icons.css'/>">

<link rel="stylesheet"
	href="<c:url value='/css/test/material-design-iconic-font.min.css'/>">
<%-- <link href="<c:url value='/css/test/ionicons.css'/>" rel="stylesheet">  --%>
<script src="<c:url value='/js/test/tether.min.js'/>"></script>

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
<link rel="stylesheet" href="<c:url value='/css/test/style2.css'/>">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900"
	rel="stylesheet">



<section class="intro-section" style="background-color: #F08080">
	<div class="container">
		<div class="row">
			<div class="col-md-1 col-lg-2"></div>
			<div class="col-md-10 col-lg-8">
				<div class="intro">
					<div class="profile-img">
						<img class="pr_img"
							src="<c:url value='/resources/images/team/memberPark.jpg'/>"
							alt="">
					</div>
					<h3 style="margin-top: 10px">
						<b id="test">슬기다운다슬기</b>
					</h3>
					<!-- <h4 class="font-yellow">프로필수정</h4> -->
					<ul class="follow2" id="mypage_sub">
						<li >
							<h6>
								<font style="vertical-align: inherit; color: #4883ff">5</font>
							</h6><a href="javascript:void(0);" onclick="sub_spread('place')" id="place" style="color:#2c343b;"><font style="vertical-align: inherit;" >픽플레이스</font></a>
						</li>
						<li>
							<h6>
								<font style="vertical-align: inherit; color: #4883ff">3</font>
							</h6> <a href="javascript:void(0);" onclick="sub_spread('load')" id="load" style="color:#2c343b;"><font style="vertical-align: inherit;" >픽로드</font></a>
						</li>
						<li>
							<h6>
								<font style="vertical-align: inherit; color: #4883ff">5</font>
							</h6> <a href="javascript:void(0);" onclick="sub_spread('mystorage')" id="mystorage" style="color:#2c343b;"><font style="vertical-align: inherit;" >보관함</font></a>
						</li>
						<li>
							<h6>
								<font style="vertical-align: inherit; color: #4883ff">5</font>
							</h6> <a href="javascript:void(0);" onclick="sub_spread('myfilter')" id="myfilter" style="color:#2c343b;"><font style="vertical-align: inherit;" >보유 필터</font></a>
						</li>
					</ul>

				</div>
				<!-- intro -->
			</div>
			<!-- col-sm-8 -->
		</div>
		<!-- row -->
	</div>
	<!-- container -->
</section>


<section class="pricing-tables sub_items">
	<div class="container">
  <div class="grid" style="position: relative; height: 885px;">
  		
	  	<div class="col-xs-3 element-item img_wrap2 clarity" onclick="clickBtn(this)" >
			<img src="/pickpic/resources/update/Square (11)-edited.jpg" alt="안나와" style="height: 285px;">
			<div class="innerText" style="height: 285px; width: 275px; display: block;">
	           	<p class="Text_title" style="margin-top: 142.5px;"><span>한소인 건물입니다</span></p>
	            <p class=""><span>건물이 멋지네요</span></p>
	            <input type="hidden" value="">
	       </div>
		</div>
		
	  <div class="col-xs-3 element-item img_wrap2 clarity" onclick="clickBtn(this)" >
			<img src="/pickpic/resources/update/Square (11)-edited.jpg" alt="안나와" style="height: 285px;">
			<div class="innerText" style="height: 285px; width: 275px; display: block;">
	           	<p class="Text_title" style="margin-top: 142.5px;"><span>한소인 건물입니다</span></p>
	            <p class=""><span>건물이 멋지네요</span></p>
	            <input type="hidden" value="">
	       </div>
		</div>
	 
	
	
	
  </div>	
	</div>
</section>



<script type="text/javascript">

function fn_spread(id){
    var getID = document.getElementById(id);
    getID.style.display=(getID.style.display=='none') ? 'block' : 'none';
}

function sub_spread(id){
	console.log(id);
	
	if(id=='myfilter'){
		$.ajax({
			url:'<c:url value="/user/myPage.do"/>',
			dataType : 'json',
			type : "get",
			data : {
				"id" : id
			},
			success : function(data) {
				console.log('성공');
				console.log('data : ' + data);
				
				//현재 출력된 이미지 다 삭제
				
				$.each(data, function(index, element) {
					$('#test').html(element['f_name']);
// 					$('#sub_items')
				})
			},
			error : function(data) {
				console.log('실패');
				console.log('data : ' + data);
			}
		});
		
	}//myfilter
	else if(id == 'place'){
		$.ajax({
			url:'<c:url value="/user/myPage.do"/>',
			dataType : 'json',
			type : "get",
			data : {
				"id" : id
			},
			success : function(data) {
				console.log('성공');
				console.log('data : ' + data);
				
				//현재 출력된 이미지 다 삭제
				
				$.each(data, function(index, element) {
					
				})
			},
			error : function(data) {
				console.log('실패');
				console.log('data : ' + data);
			}
		});
		
	}//place
	
	
}

</script>
