$(document).ready(function(){
	$('.img_wrap img').css("height",$('.img_wrap').css('width'));
	$('.img_wrap2 img').css("height",$('.img_wrap2').css('width'));
	
	$('.innerText').css('height',$('.img_wrap2 img').css('height'));
	$('.innerText').css('width',$('.img_wrap2 img').css('width'));
	
	var img2 =$('.img_wrap2 img').css('height').replace('px','');
	$('.Text_title').css('margin-top',img2/2+"px");
	
	/*	var img = document.getElementsByClassName('img_wrap')[0].clientWidth/3 +20;
		$('.Text_title').css("margin-top", img+"px");
		img = document.getElementsByClassName('img_wrap')[0].clientWidth/5;
		$('.Text_title').css("margin-top", img+"px");
	*/
	$(window).resize(function(){
		$('.img_wrap img').css("height",$('.img_wrap').css('width'));//
		$('.img_wrap2 img').css("height",$('.img_wrap2').css('width'));//
		$('.innerText').css('height',$('.img_wrap2 img').css('height'));
		$('.innerText').css('width',$('.img_wrap2 img').css('width'));
		
		
		var img2 =$('.img_wrap2 img').css('height').replace('px','');
		
		//console.log($('.Text_title').css('margin-top'));
		
		$('.Text_title').css('margin-top',img2/2+"px");
		
		
	});
	
	
	
		$('.img_wrap2').mouseenter(function(){
			//var img_wrap = document.getElementsByClassName('img_wrap')[$(this).index()-1];
			$(this).find('.innerText').css('display','block');	
		});
		
		$('.innerText').mouseleave(function(){
			
			$(this).css('display','none');	
		});
	
	
		
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
