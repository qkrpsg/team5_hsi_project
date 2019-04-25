<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<link href="<c:url value='/css/Main.css'/>" rel="stylesheet">
<link href="<c:url value='/css/Sec_1_m.css'/>" rel="stylesheet">
<link href="<c:url value='/css/Sec_1.css'/>" rel="stylesheet">
<script src="<c:url value='/js_api/jquery.imageScroll.min.js'/>"></script>
<script src="<c:url value='/js/Main.js'/>"></script>
<script src="<c:url value='/js/isotope-docs.min.js'/>"></script>

<span id="body"></span>
<div class="checked">
	<a><img
		src="<c:url value='/resources/images/bookMark_icon_.png' />"
		class="checked_img"></a>
	<div class="checked_menu">
		<ul>
			<li><a data-target="body"># HOME 바로가기</a></li>
			<li><a data-target="sec_0"># HOME0 바로가기</a></li>
			<li><a data-target="sec_1"># HOME1 바로가기</a></li>
			<li><a data-target="sec_2"># HOME2 바로가기</a></li>
			<li><a data-target="sec_3"># HOME3 바로가기</a></li>
		</ul>
	</div>
</div>

<div class="pic_gif">
	<div class="bg"></div>

	<span class="gif_cell"> <img
		src="/pickpic/resources/images/Main_Video.gif"
		style="width: 100%; height: 800px;">
		<div class="gif_layout"></div>
		<div class="anim_box">
			<div class="top_"></div>
			<div class="right_"></div>
			<div class="bottom_"></div>
			<div class="left_"></div>
		</div><!-- fdsfsddd -->
		<div class="gif_innerText">
			내일이 아닌 '지금'<br />어딘가가 아닌 '이곳'<br />행복이 가득한 '일상'
		</div>
	</span>
</div>

<section id="sec_0" class="sec_wrap">

	<div>
		<h2 class="best_pick">#BEST PICK</h2>
	</div>
	
	<div class="line_box">
		<div class="edge"></div>
		<div class="edge"></div>
	</div>

	<div class="main_image_wrap">
		<div class="main_image col-md-4 col-xs-12">
			<img src="<c:url value='/resources/images/main_image1.jpg'/>" />
			<div class="innerText">
            	<p class="gallery-board-caption-title" ><span style="font-size: 20px; width:100%;">TITLE</span></p>
                <p class="gallery-board-caption-description" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
            </div>
		</div>
    	<div class="main_image col-md-4 col-xs-12">
			<img src="<c:url value='/resources/images/main_image2.jpg'/>" />
			<div class="innerText">
            	<p class="gallery-board-caption-title" ><span >TITLE</span></p>
                <p class="gallery-board-caption-description" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
            </div>
		</div>
		<div class="main_image col-md-4 col-xs-12">
			<img src="<c:url value='/resources/images/main_image3.jpg'/>" />
			<div class="innerText">
            	<p class="gallery-board-caption-title" ><span >TITLE</span></p>
                <p class="gallery-board-caption-description" ><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
            </div>
		</div>
		
		<div class="main_image col-md-4 col-xs-12">
			<img src="<c:url value='/resources/images/main_image4.jpg'/>" />
			<div class="innerText">
            	<p class="gallery-board-caption-title" ><span >TITLE</span></p>
                <p class="gallery-board-caption-description" ><span >aliqua212d1.</span> </p>
            </div>
		</div>
		 
		<div class="main_image col-md-4 col-xs-12">
			<img src="<c:url value='/resources/images/main_image5.jpg'/>" />
			<div class="innerText">
            	<p class="gallery-board-caption-title" ><span >TITLE</span></p>
                <p class="gallery-board-caption-description" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
            </div>
		</div>
		
		<div class="main_image col-md-4 col-xs-12">
			<img src="<c:url value='/resources/images/main_image6.jpg'/>" />
			<div class="innerText">
            	<p class="gallery-board-caption-title" ><span >TITLE</span></p>
                <p class="gallery-board-caption-description" ><span >Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span></p>
            </div>
		</div>
      </div>
      <div class="icon_wrap">
      	<img class="more_icon" alt="more" src="<c:url value='/resources/images/more_icon.png' />"/>
      	<p>more</p>
      </div>
</section>

<div>
	<h2 class="about_pickpic">#ABOUT PICKPIC</h2>
</div>
	
<section id="sec_1" class="sec_wrap l_keyword_all_wrap">
	<div class="l_keyword_margin_wrap">
		<div class="l_keyword_left_wrap col-md-7">
			<div class="l__keyword_left_up_text">
				<p>
					<span>키워드</span>로 누구나 쉽게 <br />필터적용이 가능합니다.
				</p>
			</div>
			<div class="l__keyword_left_down_text">
				<p>
					구도를 몰라도 사진사가 없어도 괜찮습니다.<br />
					키워드로 원하는 필터를 고르고<br />
					사진에 적용만 하면 됩니다.
				</p>
			</div>
		</div>

		<div class="l_keyword_right_wrap col-md-5 col-sm-12">
			<img src="<c:url value='/resources/images/keyword_video.gif' />">
		</div>

	</div>
	<!-- l_keyword_margin_wrap -->



</section>



<section id="sec_2" class="sec_wrap l_keyword_all_wrap2">
	<div class="l_keyword_margin_wrap">
		<div class="l_keyword_left_wrap col-md-5 col-sm-12">
			<img src="<c:url value='/resources/images/cellphone_image.gif' />">
			<!--<img src="images/Honeycam 2019-03-26 13-02-57.gif" >-->
		</div>
		<div class="l_keyword_right_wrap col-md-7">
			<div class="l__keyword_left_up_text">
				<p>
					<span>모바일</span>에서도 간편하게
				</p>
			</div>
			<div class="l__keyword_left_down_text">
				<p>
					사진을 찍은 후 바로바로 필터를 적용해보세요<br />
					장소와 날씨에 따라 필터를 추천해줍니다.
				</p>
			</div>
		</div>
	</div>


</section>

<section id="sec_3" class="sec_wrap">
	
	<div class="l_masonry_margin_wrap">
		<div class="l_masonry_text_wrap col-md-4">
			<div>
				<p>
					<span>다양한</span>종류의 필터들
				</p>
			</div>
			<div>
				<p>장소, 상황에 맞게 필터를 적용해 보세요!</p>
			</div>
		</div>


		<div class="l_masonry_wrap col-md-8 col-sm-12">
			<div class="grid">
				<div class="grid-item">
					<img src="<c:url value='/resources/images/1.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/2.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/3.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/4.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/5.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/6.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/7.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/8.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/9.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/10.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/11.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/12.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/13.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/14.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/15.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/16.jpg' />">
				</div>
				<div class="grid-item">
					<img src="<c:url value='/resources/images/17.jpg' />">
				</div>
			</div>
		</div>
	</div>

</section>
<section id="sec_4" class="sec_wrap">

	<div class="sec_4_title col-md-12">
		<p class="col-md-offset-1">PICKPIC's Spaciality</p>
	</div>
	<div class="sec_4_content col-md-offset-1 col-md-5">
		<p>어디서 찍어야 잘나올까?</p>
		<p>더이상 어느 장소에서 찍어야 할지 고민하지 마세요.<br/>인생사진을 위한 사진 명소!<br/>피크픽에서 모두 알려드립니다.</p>
	</div>
	<div class="sec_4_content col-md-offset-1 col-md-5">
		<p>무슨 필터를 적용해야 하지?</p>
		<p>사진은 잘 찍었는데... 2% 부족한 느낌?<br/>이제는 피크픽만 믿으세요.<br/>장소, 시간에 알맞게 필터를 추천해드립니다.</p>
	</div>
	<div class="sec_4_content col-md-offset-1 col-md-5">
		<p>다른 사람들은 어떻게 찍었을까?</p>
		<p>사진을 찍을 때 무슨 포즈를 취해야할지,<br/>어떤 표정을 지어야할지 고민이었다구요?<br/>지금 바로 피크픽에서 다른 사람들의 사진을 확인하세요!</p>
	</div>
	<div class="sec_4_content col-md-offset-1 col-md-5">
		<p>나만의 필터를 만들어서 저장하고싶어!</p>
		<p>필터를 적용하는건 좋은데... 매번 귀찮으셨죠?<br/>나만의 필터를 만들어서 저장하세요.<br/>터치 한번으로 자주 사용하던 필터를 즉시 적용시킬 수 있습니다.</p>
	</div>
	<div class="sec_4_mobile_img">
		<img alt="섹션4이미지" src="<c:url value='/resources/images/main_section_image.jpg'/>"/>
	</div>
	
	<div class="img-holder" data-image="<c:url value='/resources/images/main_section_image.jpg'/>">
	</div>
</section>
<section id="sec_5">
	<div class="col-md-12">
		<p>지금 바로 시작하세요</p>
	</div>
	<div>
		<img alt="플레이스토어" src="<c:url value='/resources/images/playstrore_icon.png'/>"/>
	</div>
	<div>
		<button>어플리케이션 다운로드</button>
	</div>
</section>
<script type="text/javascript">
	$('.grid').isotope({
		itemSelector : '.grid-item',
		masonry : {}

	});
</script>
<script>
$('.img-holder').imageScroll({
	container: $('#sec_4')
}).$('.imageHolder').css("z-index","1");
</script>