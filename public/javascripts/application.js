// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults




var smOpts = {
  minWidth : 400 ,
  minHeight : 350 ,
  close : true
}

$.fn.submitWithAjax = function(callback) {
  this.submit(function(){
    var actn = $(this).attr("action") ;
    $.post($(this).attr("action"), $(this).serialize(),callback) ;
    return false ;
  }) ;
}

jQuery(document).ready(function(){
  
  $('input[data-confirm]').click(function(e){
    var msg = $(this).attr('data-confirm') ;
    var goAhead = confirm(msg) ;
    if (!goAhead) {
      e.preventDefault() ;
    }
  }) ;
  
  
  var timePickerOpts = {
    dateFormat : "yy-mm-dd" ,
    ampm : true ,
    stepMinute : 15
  }
  $('#game_game_time').datetimepicker(timePickerOpts) ;
  $('#game_polling_cutoff').datetimepicker(timePickerOpts) ;


  $("a[href='/players/new']").click(function(e){
    e.preventDefault() ;
    var href = $(this).attr('href') ;
    $.get(href,function(data){
      $(data).modal(smOpts) ;
      $("form#simplemodal-data.new_player").submitWithAjax(function(){
        alert('callback') ;
      }) ;
    })
  })
  
}) ;