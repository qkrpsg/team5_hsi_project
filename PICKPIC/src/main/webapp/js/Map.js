$(function(){
	$('.category li').click(function(){
		$('#coffeeMenu img').attr("src","/pickpic/resources/images/map/f_f.png");
		$('#storeMenu img').attr("src","/pickpic/resources/images/map/k_f.png");
		$('#carparkMenu img').attr("src","/pickpic/resources/images/map/h_f.png");
		$('#Menu img').attr("src","/pickpic/resources/images/map/c_f.png"); 
		$(this).find('img').attr("src",$(this).find('img').attr('src').replace('f.png','b.png'));
	});
});	



