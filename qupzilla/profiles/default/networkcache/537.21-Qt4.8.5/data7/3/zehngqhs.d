   �      6http://habrahabr.ru/javascripts/1380211759/hubs/all.js %|M8��  %{��0         
     O K           �      Server   nginx   Content-Type   'application/x-javascript; charset=utf-8   Last-Modified   Fri, 12 Jul 2013 14:07:26 GMT   Expires   Wed, 25 Dec 2013 16:09:19 GMT   Cache-Control   )max-age=7776000, public, proxy-revalidate   Content-Encoding   gzip $(document).ready(function(){
	
	/** 
   * Нравится/не нравится хаб
   */
  $('#addHubMember').click(function(){
  	var link = $(this);
  			link.addClass('loading');
    var id = $(this).attr('data-id');
    $.post('/json/hubs/subscribe/', {'hub_id':id}, function(json){
      if(json.messages =='ok'){
        $('#removeHubMember').removeClass('hidden');
        $('#addHubMember').addClass('hidden'); 
        $('#members_count').text(json.members_count_str);       
      }else{
        show_system_error(json);
      }
      link.removeClass('loading');
    },'json');
    return false;
  });
  $('#removeHubMember').click(function(){
    var id = $(this).attr('data-id');
    var link = $(this);
  			link.addClass('loading');
  
      $.post('/json/hubs/unsubscribe/', {'hub_id':id}, function(json){
        if(json.messages =='ok'){
          $('#removeHubMember').addClass('hidden');
          $('#addHubMember').removeClass('hidden');        
          $('#members_count').text(json.members_count_str);
        }else{
          show_system_error(json);
        }
      	link.removeClass('loading');
      },'json');

    return false;
  });
  
})