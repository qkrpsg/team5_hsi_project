
$(function(){
	var outerHeight = 900;
	var innerWidth = window.innerWidth;
	
	$('.pic_gif').css("height", outerHeight+"px");
	
	$('.pic_gif span img').css("width", "100%");
	if(window.innerWidth >= 1500){
		$('.pic_gif span img').css("height", window.innerHeight+"px");
	}else if(window.innerWidth <= 1000){
		$('.pic_gif span img').css("src", "");
	}
	
	$('.gif_innerText').css("left", window.innerWidth/2-250+"px");
	
	$(window).resize(function(){
		$('.gif_innerText').css("left", window.innerWidth/2-250+"px");
		$('.main_image img').css("height", $('.main_image').css("width"));
		$('.innerText').css("height", parseInt($('.main_image').css("height"))-10+"px");
		$('.innerText').css("width", parseInt($('.main_image').css("width"))-10+"px");
		$('.line_box').css("top", "150px");
		if(window.innerWidth >= 1500){ //1500보다 사이즈 클 경우(피씨)
			$('.pic_gif span img').css("height", window.innerHeight+"px");
			$('.pic_gif span img').css("display", "inline");
			$('.main_image_wrap').css("height", parseInt($('.main_image').css("height"))*2.1+"px");
			//섹션1
			$('.l_keyword_all_wrap').css("padding-top", "120px");
			$('#sec_1').css("margin-top", "50px");
			$('.l_keyword_right_wrap').css("margin-top", "0px");
			$('.l_keyword_right_wrap img').css("margin", "0px");
			//섹션2
			$('.l_keyword_left_wrap img').css("margin", "0px");
			$('.l_keyword_left_wrap img').css("float", "right");
			$('.l_keyword_right_wrap div').css("margin-top", "30px !important");
			$('.l_keyword_right_wrap .l__keyword_left_down_text').css("margin-bottom", "0px");
			$('.l__keyword_left_up_text').css("margin-top", "150px");
		}else if(window.innerWidth <= 1000){ //1000보다 사이즈 작을 경우(모바일)
			$('.pic_gif span img').css("display", "none");
			$('.main_image_wrap').css("height", parseInt($('.main_image').css("height"))*6+12+"px");
			$('.line_box').css("top", "160px");
			//섹션1
			$('.l_keyword_all_wrap').css("padding-top", "0px");
			 $('#sec_1').css("margin-top", "0px");
			 $('.l_keyword_right_wrap').css("margin-top", "50px");
			 $('.l_keyword_right_wrap img').css("margin", "0px auto");
			 $('.l_keyword_right_wrap img').css("margin-top", "50px");
		///////섹션2
			 $('.l_keyword_left_wrap img').css("margin", "0px auto");
			 $('.l_keyword_left_wrap img').css("float", "none");
			 $('.l_keyword_right_wrap div').css("margin-top", "50px");
			 $('.l_keyword_right_wrap .l__keyword_left_down_text').css("margin-bottom", "100px");
		}else{ //1000~1500 사이(태블릿)
			$('.pic_gif span img').css("height", "");
			$('.pic_gif span img').css("display", "inline");
			$('.main_image_wrap').css("height", parseInt($('.main_image').css("height"))*2.1+3+"px");
			$('.line_box').css("top", "155px");
			//섹션1
			$('.l_keyword_all_wrap').css("padding-top", "120px");
			$('#sec_1').css("margin-top", "50px");
			$('.l_keyword_right_wrap').css("margin-top", "0px");
			$('.l_keyword_right_wrap img').css("margin", "0px");
			//섹션2
			$('.l_keyword_left_wrap img').css("margin", "0px");
			$('.l_keyword_left_wrap img').css("float", "right");
			$('.l_keyword_right_wrap div').css("margin-top", "30px !important");
			$('.l_keyword_right_wrap .l__keyword_left_down_text').css("margin-bottom", "0px");
			$('.l__keyword_left_up_text').css("margin-top", "150px");
		}
		$('.line_box').css("height", $('.main_image_wrap').css("height"));
	});
	
	 $(function(){

         $('.top_').animate({left:"500px"},500,function(){
            $('.right_').animate({top:"500px"},500,function(){
               $('.bottom_').animate({left:"-500px"},500,function(){
                  $('.left_').animate({top:"-500px"},500);
                });
            });
         });

      });
//	 베스트픽 이미지 조정
	 $('.main_image img').css("height", $('.main_image').css("width"));
	 $('.innerText').css("height", parseInt($('.main_image').css("height"))-10+"px");
	 $('.innerText').css("width", parseInt($('.main_image').css("width"))-10+"px");
	 
//	 페이지 로딩시 초기 위치잡기
	 if(innerWidth > 1000){
		$('.anim_box').css("top", (window.innerHeight/2-250)+"px")
		.css("left", (innerWidth/2-250)+"px");
		 $('.main_image_wrap').css("height", parseInt($('.main_image').css("height"))*2.1+"px");
	 }else{
		 $('.anim_box').css("top", (window.innerHeight/2-175)+"px")
			.css("left", (innerWidth/2-175)+"px");
		 $('.anim_box').css("width", "350px")
			.css("height", "350px");
		 $('.main_image_wrap').css("height", parseInt($('.main_image').css("height"))*6+12+"px");
		 $('.line_box').css("top", "160px");
		 ///////섹션1
		 $('.l_keyword_all_wrap').css("padding-top", "0px");
		 $('#sec_1').css("margin-top", "0px");
		 $('.l_keyword_right_wrap').css("margin-top", "50px");
		 $('.l_keyword_right_wrap img').css("margin", "0px auto");
		 $('.l_keyword_right_wrap img').css("margin-top", "50px");
		 ///////섹션2
		 $('.l_keyword_left_wrap img').css("margin", "0px auto");
		 $('.l_keyword_left_wrap img').css("float", "none");
		 $('.l_keyword_right_wrap div').css("margin-top", "50px");
		 $('.l_keyword_right_wrap .l__keyword_left_down_text').css("margin-bottom", "100px");
	 }
	 $('.line_box').css("height", $('.main_image_wrap').css("height"));
	
//	 베스트픽 이미지 마우스이벤트
	 $('.main_image').mouseenter(function(){
		 $(this).find('div').css("display", "inline");
	 });
	 $('.innerText').mouseleave(function(){
		 $('.innerText').css("display", "none");
	 });
	 
	 
	$('.checked > a').click(function(){
   	 if($('.checked_menu').css("width") == "250px"){
   		$('.checked_menu').stop().animate({width:"0px"},500);
   	}else{
   		$('.checked_menu').stop().animate({width:"250px"},500);
   	}
   });
   
	$('.checked_menu a').click(function(){
		var taget = $(this).attr('data-target');
		console.log(taget);
		var top_top = $("#"+taget).offset().top;
		console.log(top_top);
		
		
		if(taget == 'sec_0'){
			console.log("sec_0");
			$('html, body').stop().animate({scrollTop: (top_top -130)}, 1000); //, "easeInOutExpo"
		}else if(taget == 'sec_1'){
			console.log("sec_1");
			$('html, body').stop().animate({scrollTop: (top_top -50)}, 1000);
		}else if(taget == 'sec_2'){
			console.log("sec_2");
			$('html, body').stop().animate({scrollTop: (top_top -50)}, 1000);
		}else if(taget == 'sec_3'){
			$('html, body').stop().animate({scrollTop: (top_top -50)}, 1000);
		}else{
			$('html, body').stop().animate({scrollTop: (0)}, 1000);
		}
		
	});
	       
   });