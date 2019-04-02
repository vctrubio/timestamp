const popUp = () => {
  let markerz = document.getElementsByClassName('mapboxgl-marker')[0]
  markerz.addEventListener('click', (event) => {
  let popUps = document.getElementsByClassName('mapboxgl-popup-content')[0].lastChild
  let popUpId = popUps.dataset.id
  let eventPopUps = document.getElementById(`${popUpId}`)
  console.log(eventPopUps.innerHTML)
  popUps.innerHTML = eventPopUps.innerHTML
  });


}



export { popUp };
