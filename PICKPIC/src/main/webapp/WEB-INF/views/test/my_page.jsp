<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>

<link href="<c:url value='/css/test/style3.css'/>" rel="stylesheet">
<link rel="stylesheet"
	href="<c:url value='/css/test/themify-icons.css'/>">
<link rel="stylesheet"
	href="<c:url value='/css/test/simple-line-icons.css'/>">
<link rel="stylesheet"
	href="<c:url value='/css/test/material-design-iconic-font.min.css'/>">
<%-- <link href="<c:url value='/css/test/ionicons.css'/>" rel="stylesheet">  --%>
<script src="<c:url value='/js/test/tether.min.js'/>"></script>


<%-- <script src="<c:url value='/js/test/jquery-3.2.1.min.js'/>"></script>
<script src="<c:url value='/js/test/isotope.pkgd.min.js'/>"></script>
<script src="<c:url value='/js/test/jquery.waypoints.min.js'/>"></script>
<script src="<c:url value='/js/test/progressbar.min.js'/>"></script>
<script src="<c:url value='/js/test/scripts.js'/>"></script> --%>

<section class="intro-section">
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
						<b>슬기로운다슬기</b>
					</h3>
					<h4 class="font-yellow">프로필수정</h4>
					<ul class="follow2">
						<li onclick="mypage_sub(this)">
							<h6>
								<font style="vertical-align: inherit; color: #4883ff">5</font>
							</h6> <span><font style="vertical-align: inherit;" id="place">픽플레이스</font></span>
						</li>
						<li onclick="mypage_sub(this)">
							<h6>
								<font style="vertical-align: inherit; color: #4883ff">3</font>
							</h6> <span><font style="vertical-align: inherit;" id="load">픽로드</font></span>
						</li>
						<li onclick="mypage_sub(this)">
							<h6>
								<font style="vertical-align: inherit; color: #4883ff">5</font>
							</h6> <span><font style="vertical-align: inherit;" id="mystorage">보관함</font></span>
						</li>
						<li onclick="mypage_sub(this)">
							<h6>
								<font style="vertical-align: inherit; color: #4883ff">5</font>
							</h6> <span><font style="vertical-align: inherit;" id="myfilter">내필터</font></span>
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




<script type="text/javascript">

function fn_spread(id){
    var getID = document.getElementById(id);
    getID.style.display=(getID.style.display=='none') ? 'block' : 'none';
}

function mypage_sub(obj){
	var subName=obj;
    var getID = document.getElementById(subName);
    getID.style.display=(getID.style.display=='none') ? 'block' : 'none';
}
</script>
