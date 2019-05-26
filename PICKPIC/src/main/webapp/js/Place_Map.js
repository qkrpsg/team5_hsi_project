$(function(){
	let innerHeight = window.innerHeight;
	$('.map_wrap').css('height',innerHeight-180);
	//$('.map_wrap').css('width',innerWidth)
	//$('.map_wrap').css('height',innerHeight-100);
	$(window).resize(function() {
		console.log('다시');
		let innerWidth = window.innerWidth;
		let innerHeight = window.innerHeight;
		$('.map_wrap').css('height',innerHeight-180);
		
	});
	
	
	
});	/////



