var GoogleMapUtil = (function(){
  var mapContainer = null;
  var map = null;
  var marker = null;

  var initialize = function(container) {

    var mapOptions = {
      center: new google.maps.LatLng(25.046228, 121.517400),
      zoom: 16,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    if(map && mapContainer){
      // Use one map only. Move old map to new node.
      container.append(mapContainer);
    }else{
      // initialize a new map
      mapContainer = $('<div>');
      mapContainer.css('width', '100%');
      mapContainer.css('height', '100%');
      container.append(mapContainer);
      map = new google.maps.Map(mapContainer.get(0), mapOptions);  
    }
  };

  var setMapCenterAt = function(data){
    if(verifiyArguments(data, ['lng', 'lat'])){
      map.setCenter({lat:data['lat'], lng: data['lng']});

    }else{
      console.log("Some mandatory data don't exist.");
    }
    
  };

  var setSingleMarkAt = function(data){
    if(verifiyArguments(data, ['lng', 'lat'])){
      if(!marker){
        marker = new google.maps.Marker({
          position:{
            lat: data['lat'],
            lng: data['lng']
          },
          map: map
        });
        marker.setVisible(true); 
      }else{
        marker.setPosition({lng: data['lng'], lat: data['lat']}); 
      }

      setMapCenterAt(data); 
  
    }else{
      console.log("Some mandatory data don't exist.");
    }

  };

  return {
    initialize:initialize,
    setMapCenterAt:setMapCenterAt,
    setSingleMarkAt:setSingleMarkAt
  };

}());

var GoogleMapUtilAssist = {
  init: function(jqObj){
    GoogleMapUtil.initialize(jqObj);
  },

  showLocOnMap: function(jqObj){
    var attrMapping = {
      lng: 'lng',
      lat: 'lat' 
    };
    DataTrigger(GoogleMapUtil, 'setSingleMarkAt', jqObj, attrMapping);
  }
};
