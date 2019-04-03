import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { autocomplete } from '../plugins/userAutocomplete';
import { initMapbox } from '../plugins/init_mapbox';
import { initMapbox2 } from './user_show_map';
import { popUp } from './event_popup';
import {countDownTimer} from './count_down_time';

initMapbox();
initMapbox2();
autocomplete();
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
if (!!submitButton) {
submitButton.addEventListener("click", (event) => {
   event.preventDefault();
  navigator.geolocation.getCurrentPosition(geolocationSuccess);
});
};
