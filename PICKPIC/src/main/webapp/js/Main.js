
$(function(){
	
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