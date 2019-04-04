import mapboxgl from 'mapbox-gl';

const initMapbox2 = () => {
  const mapElement2 = document.getElementById('map2');

  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
  };

  if (mapElement2) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement2.dataset.mapboxApiKey;

  const map = new mapboxgl.Map({
    container: 'map2',
    style: 'mapbox://styles/komcath/cjti3v6am07fr1fo12f1oer72',
    center: [-99.12766, 19.42847],
    zoom: 4
  });

  const markers = JSON.parse(mapElement2.dataset.markers);
    markers.forEach((marker) => {
      const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '25px';
      element.style.height = '25px';
      new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
  fitMapToMarkers(map, markers);

  const UserEventsArray = Array.from(document.getElementsByClassName('user-show-event-title'))
  UserEventsArray.forEach((element) => {


    element.addEventListener('click', (event) => {
  // do something on click of an element
  const latitude = event.target.dataset.latitude
  const longitude = event.target.dataset.longitude
    map.flyTo({
    center: [longitude,latitude],
    zoom: 15
    });
  });
   });




  };



}


export { initMapbox2 };
