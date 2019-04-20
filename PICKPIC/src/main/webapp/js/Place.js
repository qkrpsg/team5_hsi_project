/*명소 찾기   */

$(function(){
var $grid = $('.grid').isotope({
	itemSelector: '.element-item',
	layoutMode: 'fitRows'
  });
  // filter functions
  var filterFns = {
	// show if number is greater than 50
	numberGreaterThan50: function() {
	  var number = $(this).find('.number').text();
	  return parseInt( number, 10 ) > 50;
	},
	// show if name ends with -ium
	ium: function() {
	  var name = $(this).find('.name').text();
	  return name.match( /ium$/ );
	}
  };
  // bind filter button click
  $('.filters-button-group').on( 'click', 'button', function() {
	var filterValue = $( this ).attr('data-filter');
	// use filterFn if matches value
	filterValue = filterFns[ filterValue ] || filterValue;
	$grid.isotope({ filter: filterValue });
  });
  // change is-checked class on buttons
  $('.button-group').each( function( i, buttonGroup ) {
	var $buttonGroup = $( buttonGroup );
	$buttonGroup.on( 'click', 'button', function() {
	  $buttonGroup.find('.is-checked').removeClass('is-checked');
	  $( this ).addClass('is-checked');
	});
  });
  
});
  
  /* 스크롤  add 클래스*/
  $(function(){
	  $(".button").click(function(){
		  $('#pp').addClass('in-down');
		  
	  });
	  $(".element-item").mouseenter(function(){
		  $(this).find(".dis").css({display:"block"});
	  });
	  $(".dis").mouseleave(function(){
		  $(this).css({display:"none"});
	  });
	  
	  
  });
  $(document).ready(function(){
	  
	  $(window).scroll(function(){
		
		  if($(this).scrollTop() > "200"){
			  $(".pp").addClass('in-down');
		  }
		  
	  });
	  
  });




  /*button-group ul li 호버시*/
$(function(){

  $('.button-group ul button').hover(function(){
	 $(this).find('.nav_color').css('visibility','visible');
	 $(this).find('.nav_color').stop().animate({width:'100%'},500);
  },function(){
	
	$(this).find('.nav_color').stop().animate({width:'0'},500,function(){
		$(this).find('.nav_color').css('visibility','hidden');
	});
  });
  $('.button-group ul button').click(function(){
	  $('.button-group ul button a').css({color:'#666'});
	  $(this).find('a').css({color:'black'});


  });

});