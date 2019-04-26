$(function() {

	var l_masonry_wrap = document.getElementsByClassName("l_masonry_wrap");
	var grid = document.getElementsByClassName("grid");
	var grid_item = document.getElementsByClassName("grid-item");
	var nowPage = $(location).attr('pathname').slice($(location).attr('pathname').indexOf('admin/')+6, -4);
	var innerWidth = window.innerWidth;
	l_masonry_wrap.innerHTML = '';
	
	
	var isHome = false;
	switch(nowPage){
		case "": 
		case "pic/user/loginProcess":
		case "pic/user/logout":
			isHome = true;
			break;
		default :
			isHome = false;
	}
	
	
	var fn_addFunction = function() {
		$(".pic_gif").addClass('pic_gifadd');
		$(".header_top").addClass('scroll');
		$(".nav_wrap_top_position").addClass('scroll');
		$(".menu_wrap a").addClass('scroll_color');
		$(".ul_submenu li a").addClass('scroll_color2');
		$("#top_logo").attr("src","/pickpic/resources/images/pickpic_logo_rgb.png")
		
	};
	var fn_removeFunction = function() {
		$(".pic_gif").removeClass('pic_gifadd');
		$(".header_top").removeClass('scroll');
		$(".nav_wrap_top_position").removeClass('scroll');
		$(".menu_wrap a").removeClass('scroll_color');
		$(".ul_submenu li a").removeClass('scroll_color2');
		$("#top_logo").attr("src","/pickpic/resources/images/pickpic_logo_white.png")
	};
	
	if(!isHome){//홈이 아닐 때
		$("#top_logo").attr("src","/pickpic/resources/images/pickpic_logo_rgb.png");
	}
	
	if(innerWidth <= 1000){
		$("#top_logo").attr("src","/pickpic/resources/images/pickpic_logo_rgb.png");
	}
	
	if($(this).scrollTop() > "0"){
		fn_addFunction();
	}
	
	$('#mobile-nav').css("width", innerWidth+"px");
	/*
	 * for(var i=0;i<17;i++){ grid_item[i].innerHTML = '<img
	 * src="img/'+i+1+'.jpg" >'; }
	 */

	/*
	 * grid[0].innerHTML = '<div class="grid-item" ><img src="img/1.jpg" ></div><div
	 * class="grid-item" ><img src="img/2.jpg" ></div>' +'<div
	 * class="grid-item" ><img src="img/3.jpg" ></div><div class="grid-item" ><img
	 * src="img/4.jpg" ></div>' +'<div class="grid-item" ><img
	 * src="img/5.jpg" ></div>' +'<div class="grid-item" ><img
	 * src="img/6.jpg" ></div>' +'<div class="grid-item" ><img
	 * src="img/7.jpg" ></div>' +'<div class="grid-item" ><img
	 * src="img/8.jpg" ></div>' +'<div class="grid-item" ><img
	 * src="img/10.jpg" ></div>' +'<div class="grid-item" ><img
	 * src="img/11.jpg" ></div>' +'<div class="grid-item" ><img
	 * src="img/12.jpg" ></div>' +'<div class="grid-item" ><img
	 * src="img/13.jpg" ></div>' +'<div class="grid-item" ><img
	 * src="img/14.jpg" ></div>' +'<div class="grid-item" ><img
	 * src="img/15.jpg" ></div>' +'<div class="grid-item" ><img
	 * src="img/16.jpg"></div>' +'<div class="grid-item" ><img
	 * src="img/17.jpg"></div>';
	 */

	/*
	 * <div class="grid">
	 * 
	 * 
	 * <div class="grid-item" ><img src="img/2.jpg" ></div> <div
	 * class="grid-item" ><img src="img/3.jpg" ></div> <div class="grid-item" ><img
	 * src="img/4.jpg" ></div> <div class="grid-item" ><img src="img/5.jpg" ></div>
	 * <div class="grid-item" ><img src="img/6.jpg" ></div> <div
	 * class="grid-item" ><img src="img/7.jpg" ></div> <div class="grid-item" ><img
	 * src="img/8.jpg" ></div> <div class="grid-item" ><img src="img/10.jpg" ></div>
	 * <div class="grid-item" ><img src="img/11.jpg" ></div> <div
	 * class="grid-item" ><img src="img/12.jpg" ></div> <div class="grid-item" ><img
	 * src="img/13.jpg" ></div> <div class="grid-item" ><img src="img/14.jpg" ></div>
	 * <div class="grid-item" ><img src="img/15.jpg" ></div> <div
	 * class="grid-item" ><img src="img/16.jpg"></div> <div class="grid-item" ><img
	 * src="img/17.jpg"></div> </div>
	 */

	/*
	 * for(var i=0;i<99999;i++){ console.log(i); }
	 */

	$(".menu_wrap ul li").mouseenter(function() {
		$('.menu_all_wrap_position').css({
			height : "250px"
		});
		$(".nav_wrap_top_position").stop().animate().slideDown();
	});
	$(".nav_wrap_top_position").mouseleave(function() {

		$(this).stop().animate().slideUp(function() {
			$('.menu_all_wrap_position').css({
				height : "50px"
			});
		});

	});


	$(window).scroll(function() {
		if ($(this).scrollTop() > "0") {
			fn_addFunction();
		} else if($(this).scrollTop() == "0"&& $('.button-container-1').css("display") == "none" && isHome){
			fn_removeFunction();
		}
	});
	
	$('.header_top').mouseenter(function() {
		if($(window).scrollTop() == "0" && isHome && window.innerWidth > 1000 && $('.button-container-1').css("display") == "none")
			fn_addFunction();
	});
	
	$('.header_top').mouseleave(function() {
		if($(window).scrollTop() == "0" && isHome && window.innerWidth > 1000 && $('.button-container-1').css("display") == "none")
			fn_removeFunction();
	});
	
	$(window).resize(function(){
		innerWidth = window.innerWidth;
		$('#mobile-nav').css("width", innerWidth+"px");
		if(isHome){
			if(innerWidth <= 1000 || $(window).scrollTop() > "0"){
				$("#top_logo").attr("src","/pickpic/resources/images/pickpic_logo_rgb.png");
			}else{
				$("#top_logo").attr("src","/pickpic/resources/images/pickpic_logo_white.png");
			}
		}else{
			if(innerWidth <= 1000){
				$("#top_logo").attr("src","/pickpic/resources/images/pickpic_logo_rgb.png");
			}
		}
	});

	$('.button-container-1').click(function(e) {
		if ($('#mobile-nav').css("left") == "0px") {

			$('#mobile-nav').stop().animate({
				left : "-"+innerWidth+"px"
			}, 500, function() {
				$('.menu_all_wrap_position').css({
					height : "50px"
				});
			});
		} else {
			$('.menu_all_wrap_position').css({
				height : "940px"
			});
			$('#mobile-nav').stop().animate({
				left : "0px"
			}, 500);
		}
	});

	$(".l_menu_li").mouseenter(function() {
		$(this).find('.m_sub').stop().animate().slideDown();
		$(".l_menu_li").not(this).find(".m_sub").stop().animate().slideUp();

	});
	$(".menu").mouseleave(function() {
		// $(this).find('.m_sub').stop().animate().slideUp();

	});

});