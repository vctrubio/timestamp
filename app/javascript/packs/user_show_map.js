import mapboxgl from 'mapbox-gl';
const initMapbox2 = () => {
  const mapElement2 = document.getElementById('map2');

  if (mapElement2) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement2.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map2',
        style: 'mapbox://styles/komcath/cjti3v6am07fr1fo12f1oer72',
        zoom: 4
    });

    map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true
    }))

    const userMarkers = {lat: 0, lon: 0}
    document.addEventListener('click', (event) => {
      if (event.target.className == "user-show-event-title") {
        userMarkers.lat = parseFloat(event.target.dataset.latitude)
        userMarkers.lon = parseFloat(event.target.dataset.longitude)
        if (userMarkers) {
          new mapboxgl.Marker()
          .setLngLat([ userMarkers.lon, userMarkers.lat ])
          .addTo(map);
        };
        map.flyTo({center: [userMarkers.lon, userMarkers.lat], zoom: 15});

      } else {console.log(event.target.parentElement)}
});

  }


};

export { initMapbox2 };

