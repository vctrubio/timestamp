const popUp = () => {
  document.addEventListener('click', (event) => {
   if (typeof document.getElementsByClassName('mapboxgl-popup-content')[0] !== 'undefined') {
    let popUps = document.getElementsByClassName('mapboxgl-popup-content')[0].lastChild
    let popUpId = popUps.dataset.id
    let eventPopUps = document.getElementById(`${popUpId}`)
    popUps.innerHTML = eventPopUps.innerHTML
    }
  });
}

// export { popUp };

popUp();
