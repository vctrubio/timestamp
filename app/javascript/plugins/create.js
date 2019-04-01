const lat = document.getElementById('lat')
const lon = document.getElementById('lon')
const submitButton = document.getElementById('make-event')
const eventForm = document.getElementById('new_event')

const geolocationSuccess = (pos) => {
  const latitude = pos.coords.latitude;
  console.log(`got the lat, its ${lat}`)
  const longitude = pos.coords.longitude;
  lat.setAttribute("value", `${latitude}`);
  console.log(`changed the lat, its ${lat}`)
  lon.setAttribute("value", `${longitude}`);
  eventForm.submit();
};


submitButton.addEventListener("click", (event) => {
  navigator.geolocation.getCurrentPosition(geolocationSuccess);
});
