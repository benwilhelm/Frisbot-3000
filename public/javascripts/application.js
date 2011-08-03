// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults





jQuery(document).ready(function(){
    
  $('#new_comment').bind("ajax:success",function(data,status,xhr){
    $('#comment_comment_text').val('') ;
    $('.latest-comment').effect('highlight',{color:"#DFA"},1500)
                        .bindCommentActions() ;
  }) ;
  
  $('.edit_comment').bind("ajax:success",function(){
    alert("success!") ;
    $.modal.close() ;
  }) ;
  
  $('.comment').bindCommentActions() ;

  var timePickerOpts = {
    dateFormat : "yy-mm-dd" ,
    ampm : true ,
    stepMinute : 15
  }
  $('#game_game_time').datetimepicker(timePickerOpts) ;
  $('#game_polling_cutoff').datetimepicker(timePickerOpts) ;
  
}) ;

$.fn.bindCommentActions = function() {
  $(this).find('.delete').closest("form").bind("ajax:success",function(data,status,xhr){
    $(this).closest('.comment').fadeOut(300) ;
    $('.comment').bindCommentActions() ;
  }) ;
  
}