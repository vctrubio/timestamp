import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';
import { popUp } from './event_popup';
initMapbox();
popUp();


// geolocation JS
const lat = document.getElementById('lat')
const lon = document.getElementById('lon')
const submitButton = document.getElementById('make-event')
const eventForm = document.getElementById('new_event')

const geolocationSuccess = (pos) => {
  const latitude = pos.coords.latitude;
  const longitude = pos.coords.longitude;
  lat.setAttribute("value", `${latitude}`);
  lon.setAttribute("value", `${longitude}`);
  console.log('Coordinates', latitude, longitude);
  eventForm.submit();
};

submitButton.addEventListener("click", (event) => {
   event.preventDefault();
  navigator.geolocation.getCurrentPosition(geolocationSuccess);
});
