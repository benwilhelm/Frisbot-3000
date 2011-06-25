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

$(document).ready(function(){
  
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