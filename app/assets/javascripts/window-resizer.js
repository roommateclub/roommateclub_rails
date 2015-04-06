$(document).on("page:change", function(){
  $('.content-wrapper').css("min-height", $(document).height() - $('.navbar').outerHeight() - $('#footerwrap').outerHeight());
})