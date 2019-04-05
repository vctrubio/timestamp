var moment = require('moment');
moment().format();


 const eventTimeLogic = () => {
  let PlacesWhereYouWantToInjectTimeRemainingArray = Array.from(document.getElementsByClassName('ended-time-js'))
   PlacesWhereYouWantToInjectTimeRemainingArray .forEach((element) => {
    console.log(element)
   let endTimeUnParsed = String(element.dataset.end_time).replace('UTC','')
   console.log(endTimeUnParsed)
   let endTimeParsed = moment(endTimeUnParsed)
   console.log(endTimeParsed)
  let TimeBeforeItEndsString = endTimeParsed.from(moment())
   element.innerHTML =  `${TimeBeforeItEndsString} <i class="far fa-eye" style="color: green;"></i>`
});

const PlacesWhereYouWantToInjectTimeEndedArray = Array.from(document.getElementsByClassName('ended-time'))
  PlacesWhereYouWantToInjectTimeEndedArray  .forEach((element) => {
   let endTimeUnParsed = String(element.dataset.ended_time)
   let endTimeParsed = moment(endTimeUnParsed)
  let TimeSinceEndString = endTimeParsed.from(moment())
   element.innerHTML = `${TimeSinceEndString} <i class="far fa-eye-slash"></i>`
   });
}




export { eventTimeLogic }
