import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { autocomplete } from '../plugins/userAutocomplete';
import { initMapbox } from '../plugins/init_mapbox';
import { initMapbox2 } from './user_show_map';
<<<<<<< HEAD
import { popUp } from './event_popup';
import {countDownTimer} from './count_down_time';
=======

>>>>>>> cde3fb6e0994b6dbfa13a631daa1324f54b78901

initMapbox();
initMapbox2();
autocomplete();
<<<<<<< HEAD
setTimeout(() => popUp(), 1000);
setInterval(countDownTimer(), 1000);
=======
>>>>>>> cde3fb6e0994b6dbfa13a631daa1324f54b78901

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
