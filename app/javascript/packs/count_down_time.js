var moment = require('moment');
moment().format();


 const eventTimeLogic = () => {
  const PlacesWhereYouWantToInjectTimeRemainingArray = Array.from(document.getElementsByClassName('ended-time-js'))
   PlacesWhereYouWantToInjectTimeRemainingArray .forEach((element) => {
   const endTimeUnParsed = String(element.dataset.end_time)
   const endTimeParsed = moment(endTimeUnParsed)
  const TimeBeforeItEndsString = endTimeParsed.from(moment())
   element.innerHTML =  `${TimeBeforeItEndsString} <i class="fas fa-hourglass-start" style="padding-right: 1px;"></i>`
});

const PlacesWhereYouWantToInjectTimeEndedArray = Array.from(document.getElementsByClassName('ended-time'))
  PlacesWhereYouWantToInjectTimeEndedArray  .forEach((element) => {
   const endTimeUnParsed = String(element.dataset.ended_time)
   const endTimeParsed = moment(endTimeUnParsed)
  const TimeSinceEndString = endTimeParsed.from(moment())
   element.innerHTML = ` <i class="fas fa-hourglass-end"></i> ${TimeSinceEndString}`
   });
}




export { eventTimeLogic }
