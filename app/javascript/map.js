let marker;

const initMap = () => {
  const tokyoStation = { lat:35.6814104752183, lng:139.76721062882686};
  map = new google.maps.Map(document.getElementById('map'),{
      zoom: 8,
      center: tokyoStation,
    }
  );
  codeAddress(map);
}

const codeAddress = (map) => {
  const search_btn = document.getElementById('search-btn');
  search_btn.addEventListener('click',() => {
    const inputAddress = document.getElementById('search-window').value;

    geocoder = new google.maps.Geocoder()

    geocoder.geocode( { 'address': inputAddress }, function(results, status){
      if (status == 'OK') {
        map.setCenter(results[0].geometry.location);
        marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });

        const service = new google.maps.places.PlacesService(map);
        const request = {
          placeId: results[0].place_id
        }

        service.getDetails(request, (place, status) => {
          if (status === google.maps.places.PlacesServiceStatus.OK) {
            console.log(place)
            const spotName = document.getElementById('spot-name');
            const spotAddress = document.getElementById('spot-address');
            const spotPhoneNumber = document.getElementById('spot-phonenumber');
            const spotUrl = document.getElementById('spot-url');

            spotName.innerHTML = place.name
            let addressStr = place.formatted_address
            spotAddress.innerHTML = addressStr.substr(addressStr.indexOf(' ') + 1)
            spotPhoneNumber.innerHTML = place.formatted_phone_number
            spotUrl.innerHTML = place.website
            // document.getElementById('hidden_address').setAttribute('value',place.formatted_address.replace('日本、',''))
          }
          registrationSpot(place);
        });
      } else {
        alert('該当するスポットはありませんでした');
      }
    })
  })
}

const registrationSpot = (place) => {
  const registrationBtn = document.getElementById('registration');
  registrationBtn.addEventListener('click', () => {
    // 郵便番号を除いた記述に書き換える
    let addressStr = place.formatted_address
    document.getElementById('place-address').setAttribute('value',addressStr.substr(addressStr.indexOf(' ') + 1));
    // 郵便番号を除いた記述に書き換える
    document.getElementById('place-name').setAttribute('value',place.name)
    document.getElementById('place-number').setAttribute('value',place.formatted_phone_number)
    document.getElementById('place-site').setAttribute('value',place.website)
  });
}

window.addEventListener('load', initMap);