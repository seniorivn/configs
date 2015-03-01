   �      @http://habrahabr.ru/javascripts/1380211759/_parts/float_block.js %|M8��  %{��`         
     O K           �      Server   nginx   Content-Type   'application/x-javascript; charset=utf-8   Last-Modified   Mon, 22 Jul 2013 09:34:20 GMT   Expires   Wed, 25 Dec 2013 16:09:19 GMT   Cache-Control   )max-age=7776000, public, proxy-revalidate   Content-Encoding   gzip /**
 * В этом файле описан функционал, который реализует плавающий баннер в правой части сайта :)
 */
 
$(document).ready(function(){

	if( $('.similar_questions').size() ) {
		show_float_block('.similar_questions')
	}else if( $('.daily_best_posts').size() ) {
		show_float_block('.daily_best_posts')
	}

})

function show_float_block(selector){
    $.browser.isMobileDevice = (/android|webos|iphone|ipad|ipod|blackberry/i.test(navigator.userAgent.toLowerCase()));
	
	if( $.browser.isMobileDevice || $(window).width() < 1024 || $(window).height() < 500 || screen.width < 1024) {  return; }
	
	var float_block = $(selector)
	
	if(! float_block.size()) return ;
	
	var float_block_width = float_block.width()
	
	//console.log(float_block_width)
	
	var sidebar = $('.sidebar_right')
	if(! sidebar.size()) return ;
	
	var show_float_block = false
	
	$(window).bind('scroll resize', function () { 
		
		if(show_float_block == false){
			var last_sidebar_item_bottom = sidebar.offset().top + sidebar.outerHeight()
		}else{
			var last_sidebar_item_bottom = sidebar.offset().top + sidebar.outerHeight() + float_block.outerHeight() + 20 // 20 - margin-bottom %) 
		}
		
		//console.log('last_sidebar_item_bottom', last_sidebar_item_bottom, 'float_block.outerHeight()', float_block.outerHeight() )
				
		if( $(window).width() < 1024 || $(window).height() < 500 || screen.width < 1024) {  return; }
		
		
		if( (float_block.outerHeight() + this.pageYOffset) > $('#footer').offset().top - 150  ){
			if(show_float_block == true){
			  float_block.removeClass('float_block').css('width', 'auto')
			  //console.log('width auto')
			}
			show_float_block = false
		}else{
  		if( this.pageYOffset > last_sidebar_item_bottom) {
  			if(show_float_block == false){
  				float_block.addClass('float_block').css('width', float_block_width+'px')
  				//console.log('width '+float_block_width)
  				float_block.animate({ opacity: 0 }, 0, function() {
  					float_block.animate({ opacity: 1 }, 500)
  
  				})
  				
  			}
  			show_float_block = true
  		}else{
  			if(show_float_block == true){
  			 	float_block.removeClass('float_block').css('width', 'auto')
  			 	//console.log('width auto')
  			}
  			show_float_block = false
  		}
		}
	})
}