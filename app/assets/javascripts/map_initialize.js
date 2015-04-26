var MyGoogleMap = (function(elementId){

  var map = null;
  var marker = null;

  var initialize = function() {
    var position ={ lat: 26, lng:123 };
    
    var mapOptions = {
      center: new google.maps.LatLng(25.046228, 121.517400),
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById(elementId),
        mapOptions);

    // Bind Event
    $(".rent_case").hover(function(event){
      showCaseOnMap($(event.target).closest(".rent_case"));
    });


    // Mark first position
    var rent_case = $('.rent_case:first');
    if(rent_case){
      showCaseOnMap(rent_case);
    }
  };

  var showCaseOnMap = function(jqItem){
    var lng = jqItem.data("lng");
    var lat = jqItem.data("lat");

    if(!marker){
      marker = new google.maps.Marker({
        position:{
          lat: lat,
          lng: lng
        },
        map: map
      });

      marker.setVisible(true);  
    }else{
      marker.setPosition({lng: lng, lat, lat}); 
    }

    map.setCenter({lat:lat, lng: lng});    
  };

  $(document).on("page:change", function(){
    initialize();
  });

}('map_canvas'));