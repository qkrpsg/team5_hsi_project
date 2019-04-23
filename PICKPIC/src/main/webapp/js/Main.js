
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
		if(window.innerWidth >= 1500){
			$('.pic_gif span img').css("height", window.innerHeight+"px");
			$('.pic_gif span img').css("display", "inline");
		}else if(window.innerWidth <= 1000){
			$('.pic_gif span img').css("display", "none");
		}else{
			$('.pic_gif span img').css("height", "");
			$('.pic_gif span img').css("display", "inline");
		}
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

//	 네모난거 사라지는거 위치잡기
	 if(innerWidth > 1000){
		$('.anim_box').css("top", (window.innerHeight/2-250)+"px")
		.css("left", (innerWidth/2-250)+"px");
	 }else{
		 $('.anim_box').css("top", (window.innerHeight/2-175)+"px")
			.css("left", (innerWidth/2-175)+"px");
		 $('.anim_box').css("width", "350px")
			.css("height", "350px");
	 }
	
	 
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