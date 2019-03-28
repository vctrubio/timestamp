// function geolocationSuccess(position) {

//     var latitude = position.coords.latitude;
//     var longitude = position.coords.longitude;
  
//     $.ajax({
//       url: "events",
//       method: "‘GET’",
//       data: {
//       longitude: longitude,
//       latitude: latitude
//       },
//       dataType: "script"
//     });
//     console.log("test")
//   }
  
// const newEvent = document.getElementById('new-event-form')

// newEvent.addEventListener("submit", (event) => {
//   event.preventDefault();
//   navigator.geolocation.getCurrentPosition(geolocationSuccess);
// });