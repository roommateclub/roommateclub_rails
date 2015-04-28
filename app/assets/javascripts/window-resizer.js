$(document).on("page:change", function(){
  $('.content-wrapper').css("min-height", $(document).height() - $('.navbar').outerHeight() - $('#footerwrap').outerHeight());
  $(window).resize(function(){
      $(".content-wrapper").css("min-height", $(window).height() - $('.navbar').outerHeight() - $('.footer').outerHeight());
  })
})