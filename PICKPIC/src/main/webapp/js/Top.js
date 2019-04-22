$(function() {

	var l_masonry_wrap = document.getElementsByClassName("l_masonry_wrap");
	var grid = document.getElementsByClassName("grid");
	var grid_item = document.getElementsByClassName("grid-item");
	l_masonry_wrap.innerHTML = '';

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

	var fn_addFunction = function() {
		$(".pic_gif").addClass('pic_gifadd');
		$(".header_top").addClass('scroll');
		$(".nav_wrap_top_position").addClass('scroll');
		$(".menu_wrap a").addClass('scroll_color');
		$(".ul_submenu li a").addClass('scroll_color2');
		$(".login_wrap ul li a").addClass('scroll_login');
		$(".login_wrap ul li a span").addClass('scroll_span');
//		$("#top_logo").
	};
	var fn_removeFunction = function() {
		$(".pic_gif").removeClass('pic_gifadd');
		$(".header_top").removeClass('scroll');
		$(".nav_wrap_top_position").removeClass('scroll');
		$(".menu_wrap a").removeClass('scroll_color');
		$(".ul_submenu li a").removeClass('scroll_color2');
		$(".login_wrap ul li a").removeClass('scroll_login');
		$(".login_wrap ul li a span").removeClass('scroll_span');
	};

	$(window).scroll(function() {
		if ($(this).scrollTop() > "0") {
			fn_addFunction();
		} else {
			fn_removeFunction();
		}
	});
	
	$('.header_top').mouseenter(function() {
		fn_addFunction();
	});
	
	$('.header_top').mouseleave(function() {
		fn_removeFunction();
	});

	$('.button-container-1').click(function(e) {
		if ($('#mobile-nav').css("left") == "0px") {

			$('#mobile-nav').stop().animate({
				left : "-500px"
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