let marker;
const resultMap = document.getElementById('result_map')

const initMap = () => {
  const tokyoStation = { lat:35.6814104752183, lng:139.76721062882686};
  map = new google.maps.Map(resultMap),{
      zoom: 8,
      center: tokyoStation,
    }
  codeAddress(map);
}



window.addEventListener('load', initMap);