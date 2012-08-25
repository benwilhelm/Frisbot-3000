jQuery(document).ready(function(){
  
  $('.expandable-handle').click(function(e){
    e.preventDefault() ;
    $(this).parent().find('.expandable-content').slideToggle() ;
  }) ;
  
  $('#yourResponse input[type=submit]').click(function(){
    $('#summary .loading-indicator').show() ;
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

  $(this).click(function(){
    $ind.show() ;
  })
}

function flashNotice(ntc) {
  if ($('.feedback .notice').length == 0) {
    $('.feedback').append("<p class='notice'></p>") ;
  }
  $(".feedback .notice").html(ntc).fadeIn(300).delay(1500).fadeOut(1000) ;
}

function flashAlert(alrt) {
  if ($('.feedback .alert').length == 0) {
    $('.feedback').append("<p class='alert'></p>") ;
  }
  $(".feedback .alert").html(alrt).fadeIn(300) ;
}