// All pages' init function entry point

var pageInit = (function(){
  var alwaysInit = {};
  var onceInit = null;

  var getPageTag = function(){
    var d = $('#page_tag');
    if(d.length){
      return d.data('tag');
    }
    return null;
  };

  $(document).on("page:change", function(){
    var tag = getPageTag();
    if(tag && tag in alwaysInit){
      alwaysInit[tag]();
    }
    if(onceInit){
      onceInit();
      onceInit = null;
    }
  });

  return function(alwaysFunc, onceFunc){
    var tag = getPageTag();
    if(tag){
      alwaysInit[tag] = alwaysFunc;
    }
    onceInit = onceFunc;
  };

}());