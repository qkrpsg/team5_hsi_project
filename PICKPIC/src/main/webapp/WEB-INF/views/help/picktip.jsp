<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
*{   margin:0;
   padding:0;
   border:0;
   box-sizing: border-box;
}
img{display: block;}
a{
   text-decoration: none;
   
}
#sagin {
	width: 100%;
}

.sagin {
	float: center;
	width: 60%;
	text-align: center;
}

.sagin2 {
	width: 60%;
}

.c1 {
	float: left;
	width: 60%;
	text-align: left;
	padding: 8%;
}

.culturesa {
	width: 100%;
}

.box {
	height: 350px;
	width: 450px;
	background-color: yellow;
	margin: 30px;
	padding: 30px;
}

.box2 {
	width: 100%;
	background-color: gray;
	height: 950px;
	text-align: left;
	padding: 50px;
}
.shadow1 {
  color: #fff;
  font-family: Arvo;
  font-weight: bold;
  text-shadow:
    -3px -3px 0 #222,
    3px -3px 0 #222,
    -3px 3px 0 #222,
    3px 3px 0 #222,
    4px 4px 0 #fff,
    5px 5px 0 #fff,
    6px 6px 0 #fff,
    7px 7px 0 #fff;
  line-height: 0.8em;
  letter-spacing: 0.1em;
  transform: scaleY(0.7);
  -webkit-transform: scaleY(0.7);
  -moz-transform: scaleY(0.7);
  margin-top:7%;
  margin-bottom:7%;
  text-align: center;
  font-size:60px;
}
.mySlides{
margin-top:5%;
width:100%;
}



.header_top{
   background: white !important;
   opacity:1;
   background:white;
   border-bottom:1px #ccc solid;
}
.menu_wrap a{
   color:#5a5a5a !important;
   font-weight: normal !important;
   font-size:1.1em !important;
}
.ul_submenu li a{
   color:#5a5a5a !important;
   font-weight: normal !important;
   font-size:.9em !important;
}

.login_wrap ul li a{
   color:#00AEEA !important;   
}
.login_wrap ul li a span{
   background:#00AEEA !important;
}
.nav_wrap_top_position{
   opacity:1;
   background:white;
   border-bottom:1px #ccc solid;
}
/* 메인 페이지 이외에 페이지에서 넣어야 하는 속성 */
</style>


<div class="w3-content" style="">

		<img class="mySlides" src="<c:url value='/resources/images/gren3.jpg'/>" > <img
			class="mySlides" src="<c:url value='/resources/images/gren4.jpg'/>" > <img
			class="mySlides" src="<c:url value='/resources/images/gren1.jpg'/>">
	</div>
	<script>
		var myIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 2000); // Change image every 2 seconds
		}
	</script>
	
	<div class="row">
		<div class="col-md-offset-1 col-md-10" >
			<p class ="shadow1">P I C K P I C * C U L T U R E</p>

		</div>
	</div>

	<div class="row">
		<div class="col-md-offset-1 col-md-3">
		<br/>
		<br/>
			<img src="<c:url value='/resources/images/at.jpg'/> " id="sagin" >
		</div>
		<div class="col-md-7">
			<span style="font-size: 5.8em; font-weiht: bold"> 01</span>
			<hr style="border: solid 2px red">
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-8">
			<span style="font-size: 3.0em; font-weigt: bold">COLLEAGUE</span>
		</div>
		<div class="col-md-4">
			<br />
			<br />
		</div>
		<div class="col-md-8">
			<span style="font-size: 2.0em">동료들과 새로운 아이디어 구상하며<br /> 함께
				도전해보는 시간을 갖습니다.<br />
			<br /> 동료들과 단합을 위해 워크샵 비용과<br /> 매주 금요일 오전 근무!!
			</span>
		</div>
	</div>

	<div class="row">
		<div class="col-md-offset-1 col-md-9">
			<span style="font-size: 3.0em; font-weigt: bold"><br />동료와 함께
				즐기기<br />
			<br /></span>
		</div>
		<div class="col-md-offset-1 col-md-9">
			<span style="font-size: 2.0em">1) 사원이 성장 할 수 있도록 교재비 지원!<br>
				2) 주말학원 다니는 금액 전액 지원해 줌!<br /> 3) 능력과 성과에 따른 보너스 추가 지급!

			</span>
		</div>

	</div>

	<div class="row">
		<div class="col-md-offset-1 col-md-10">
			<span style="font-size: 5.8em; font-weiht: bold"><br />02</span>
		</div>
		<div class="col-md-offset-1 col-md-7">
			<br />
			<hr style="border: solid 2px red">
			<br />
			<span style="font-size: 3.0em; font-weigt: bold">GROWTH</span><br />
			<br /> <span style="font-size: 2.0em"><br />피크픽 자기개발 및 직무교육과<br />
				업무관련 자격증 취득 지원을 합니다.<br />
			<br /> 공평한 승진 기회! 다양한 혜택으로<br /> 우수성과자는 고속승진이 가능합니다! </span>
		</div>
		<div class="col-md-3">
			<br />
			<br />
			<img src="<c:url value='/resources/images/au.jpg'/>" id="sagin">	
		</div>
	</div>

	<div class="row" style="text-align: center">
		<div class="col-md-4 col-md-push-7">
			<span style="font-size: 2.5em"><br />피크픽과 성장하기<br />
			<br /></span> <span style="font-size: 2.0em">1) 사원이 성장 할 수 있도록 교재비
				지원!<br> 2) 주말학원 다니는 금액 전액 지원해 줌!<br /> 3) 능력과 성과에 따른 보너스 추가 지급!
				<br />
			<br />
			<br />
			<br />
			</span>
		</div>
	</div>

	<div class="row">

		<div class="col-md-offset-1 col-md-10">
			<div class="box" style="float: left;">
				<span style="font-size: 2.0em">GIFT 01</span> <br />
				<span style="font-size: 3.0em; font-weight: bold">조선호텔 7대미각<br />슈퍼패스(월2명)
				</span> <br />
				<span style="font-size: 1.7em"><br />
				<br />모든 레스토랑에서 사용 가능한<br />40만원 상당의 식사권~! 
			</div>
			<div class="box" style="float: left">
				<span style="font-size: 2.0em">GIFT 02</span> <br />
				<span style="font-size: 3.0em; font-weight: bold">신세계<br />슈퍼패스(월
					5명)
				</span> <br />
				<span style="font-size: 1.7em"><br />
				<br />신세계 상품권 1만원권!<br />신세계 주차이용권!</span>
			</div>
			<div class="box" style="float: left">
				<span style="font-size: 2.0em">GIFT 03</span> <br />
				<span style="font-size: 3.0em; font-weight: bold">스타벅스<br />슈퍼패스(월
					10명)
				</span> <br />
				<span style="font-size: 1.7em"><br />
				<br />아메리카노 1잔!<br />카페라떼 1잔!</span>
			</div>
		</div>
		<br /> <br />
		<div class="row">
			<div class="col-md-offset-1 col-md-10">
				<span style="font-size: 5.8em; font-weiht: bold"><br />03</span>
			</div>
			<div class="col-md-offset-1 col-md-7">
				<br />
				<hr style="border: solid 2px red">
				<br />
				<span style="font-size: 3.0em; font-weigt: bold">WELFARE</span><br />
				<br /> <span style="font-size: 2.0em"><br />1) 노래 들으면서 일하는
					자유로운 분위기!<br /> 2) 지하철역과 가까운 회사위치!<br /> 3) 다양한 휴계공간 및 오락시설!<br />
					4) 식비지원 및 무제한 간식! </span>
			</div>
			<div class="col-md-3 ">
				<br />
				<br />
				<img src="<c:url value='/resources/images/100.jpg'/>" id="sagin">
			</div>




		</div>
		<div class="row">
			<div class="col-md-offset-1 col-md-10">
				<br />
				<br />
				<br />
				<div class="box2" style="float: center">
					<br />
					<br />
					<span style="font-size: 3.0em; font-weigt: bold">피크픽이 제공하는
						복지제도</span> <br />
					<br />
					<span style="font-size: 2.0em">건강을 위해 의료지원 보험 ● 든든한 경제를 위해
						경조금 대출 ● 즐거운 생활을 위해 휴가, 편의시설 등을 제공</span> <br />
					<br />
					<span style="font-size: 2.0em; font-weight: bold">안식휴가</span> <br />
					<span style="font-size: 1.7em">사원의 리프레쉬를 위해 매 3년 근속 시마다 안식휴가
						1개월과 휴가비 200만원을 지원합니다.</span> <br />
					<br />
					<span style="font-size: 2.0em; font-weight: bold">편의시설</span> <br />
					<span style="font-size: 1.7em">사원들의 휴식 공간으로 사원만의 카페를 시내에
						운영하고 있으며 남/녀 수면실 및 엄마방(모유수유방)과 <br />사원들 간의 아이디어 회의나 독서, 게임 등을 할 수
						있는 사원 쉼터가 있습니다.
					</span> <br />
					<br />
					<span style="font-size: 2.0em; font-weight: bold">콘도 미니엄</span> <br />
					<span style="font-size: 1.7em">크루들은 회사와 제휴된 휴양지 시설을 이용할 수
						이쓰며, 다양한 할인 혜택을 받아 콘도를 이용할 수 있습니다.</span> <br />
					<br />
					<span style="font-size: 2.0em; font-weight: bold">의료비 지원</span> <br />
					<span style="font-size: 1.7em">질병이나 사고로 크루 본인이나 크루 직계가족의 통원
						치료비 / 입원비 등이 발생할 시에 최고 3,000만 원의 <br />의료비를 지원합니다.
					</span> <br />
					<br />
					<span style="font-size: 2.0em; font-weight: bold">단체상해보험</span> <br />
					<span style="font-size: 1.7em">전 사원을 대상으로 4대 보험 외에 단체상해보험에
						가입하여 각종 상해, 사고 , 질병에 대한 위험 부담을 <br />최소화 할 수 있도록 보장하고 있습니다.
					</span> <br />
					<br />
					<span style="font-size: 2.0em; font-weight: bold">경조금</span> <br />
					<span style="font-size: 1.7em">경조휴가를 부여하고 회사에서는 축하 또는 조의의
						마음을 표현하기 위하여 경조금과 경조화환, 장례지도사와 <br />장례도우미를 파견지원하고, 장의용품을 전달하고
						있습니다.
					</span>

				</div>


			</div>
		</div>
	</div>
       

