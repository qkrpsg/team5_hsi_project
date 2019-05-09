$(function(){
	var outerHeight = window.outerHeight;
	//창틀 사이즈
	var windowHeight = outerHeight - window.innerHeight;
	var headerHeight = parseInt($('header').css('height'));
	var footerHeight = parseInt($('footer').css('height'));
	
	//초기 화면 로딩시(새로고침)
	//화면높이 창크기에 맞추기
	$('.l_login_all_wrap').css('height', outerHeight-headerHeight-footerHeight-windowHeight+'px');
});