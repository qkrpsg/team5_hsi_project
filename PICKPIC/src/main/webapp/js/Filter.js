$(document).ready(function(){
//      $('.img_wrap2').mouseenter(function(){
//         //var img_wrap = document.getElementsByClassName('img_wrap')[$(this).index()-1];
//         $(this).find('.innerText').css('display','block');   
//      });
//      
//      $('.innerText').mouseleave(function(){
//         $(this).css('display','none');   
//      });
      
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
      
        $('.img_wrap2').click(function(event){
           var innerTextW =   $('.innerText').css('width').replace('px','');
           var innerTextH =   $('.innerText').css('height').replace('px','');
             console.log(innerTextW);
             
           $(this).find('.hi').css("display","block");
           $('.hi').css("left",innerTextW/2 -50 +"px");
           $('.hi').css("top", innerTextH/2 -50 +"px");
          /*$(window).mousemove(function(event){
              
           });*/
        });
        
           $('.img_wrap2').mouseleave(function(){
              $('.hi').css("display","none");
         });
      
        /*$(window).mousemove(function(event){
           cursorX = event.pageX;
           cursorY = event.pageY;
           var coords3 = "cursorX - X: " + cursorX + ", Y cursorY: " + cursorY;
           document.getElementById("hi").innerHTML = coords3;
           $('.hi').css("left",cursorX);
           $('.hi').css("top",cursorY - 1400);
           //innerText
        });*/
   
});