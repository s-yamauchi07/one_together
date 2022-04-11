let map;

function initMap() {
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('spot-map'), {
    center: {
      lat: gon.spot.latitude,
      lng: gon.spot.longitude
    },
    zoom: 10,
  });

  marker = new google.maps.Marker({
    // コントローラーで定義した変数から緯度経度を呼び出し、マーカーを立てる
    position: {
      lat: gon.spot.latitude,
      lng: gon.spot.longitude
    },
    map: map
  });
}

window.addEventListener('load', initMap)