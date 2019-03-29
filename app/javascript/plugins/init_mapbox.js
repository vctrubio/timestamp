import mapboxgl from 'mapbox-gl';

  const initMapbox = () => {
    const mapElement = document.getElementById('map');

    if (mapElement) { // only build a map if there's a div#map to inject into
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/komcath/cjti3v6am07fr1fo12f1oer72',
        zoom: 4
      });

    const render = mapElement.dataset.render;
    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(new mapboxgl.Popup({ offset: 25 })
        .setHTML(`<div><h1>${marker.title}</h1></div>`))
        .addTo(map);

    });
    const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 13 });
    };
    fitMapToMarkers(map, markers);
    }



  }

export { initMapbox };
