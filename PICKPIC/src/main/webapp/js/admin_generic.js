$(function(){
	var nowPage = $(location).attr('pathname').slice($(location).attr('pathname').indexOf('admin/')+6, -4);
	$('#'+nowPage).addClass('active');
});