// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults





jQuery(document).ready(function(){
  
  $('#yourResponse input[type=submit]').click(function(){
    $('#summary .loading-indicator').show() ;
  }) ;
    
  $('#new_comment').bind("ajax:success",function(data,status,xhr){
  }) ;
  
  $('.comment').bindCommentActions() ;

  var timePickerOpts = {
    dateFormat : "yy-mm-dd" ,
    ampm : true ,
    stepMinute : 15
  }
  $('#game_game_time').datetimepicker(timePickerOpts) ;
  $('#game_polling_cutoff').datetimepicker(timePickerOpts) ;
  
  $(".feedback .notice").hide().delay(300).fadeIn(300).delay(1500).fadeOut(1000) ;
  
}) ;

$.fn.bindCommentActions = function() {
  $(this).find('.delete').closest("form").bind("ajax:success",function(data,status,xhr){
    $(this).closest('.comment').fadeOut(300) ;
    $('.comment').bindCommentActions() ;
  }) ;
  
}

$.fn.bindIndicator = function(elmnt) {
  if (elmnt) {
    var $ind = $(elmnt).find('.loading-indicator') ;
  } else {
    var $ind = $(this).find('.loading-indicator') ;
  }
  console.log($ind) ;

  $(this).click(function(){
    $ind.show() ;
  })
}