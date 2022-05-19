let marker = [];
let infoWindow = [];
let geocoder;
let map;
const searchSpots = gon.spots;

const searchMap = () => {
  // geocoderを初期化
  geocoder = new google.maps.Geocoder()

  // mapの初期化
  let tokyoStation = { lat: 35.6814104752183, lng: 139.76721062882686};
  map = new google.maps.Map(document.getElementById('map'), {
    center: tokyoStation,
    zoom: 8
    });

  for (let i = 0; i < searchSpots.length; i++) {
      // 緯度経度のデータ作成
    geocoder.geocode({ 'address': searchSpots[i].address }, function(results, status){
      if (status == 'OK') {
        console.log(searchSpots[i].name)
        map.setCenter(results[0].geometry.location);
        marker[i] = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location,
          label: `${i + 1}` //マーカーに数字を振る
        });

      };
      // マップに吹き出しを入れ込む
      infoWindow[i] = new google.maps.InfoWindow({
        content: `<p>${searchSpots[i].name}</p>`
      });

      markerEvent(i);
    });
  }

  function markerEvent(i) {
    marker[i].addListener('click', () => {
      infoWindow[i].open(map, marker[i]);
    })
  }
}


window.addEventListener('load', searchMap);