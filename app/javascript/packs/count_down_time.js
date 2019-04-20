var moment = require('moment');
moment().format();


const eventTimeLogic = () => {
 let PlacesWhereYouWantToInjectTimeRemainingArray = Array.from(document.getElementsByClassName('ended-time-js'))
 PlacesWhereYouWantToInjectTimeRemainingArray .forEach((element) => {
   let endTimeUnParsed = String(element.dataset.end_time).replace('UTC','')
   let endTimeParsed = moment.utc(endTimeUnParsed, "YYYY-MM-DD HH:mm:ss")
   let TimeBeforeItEndsString = endTimeParsed.from(moment())
   element.innerHTML =  `${TimeBeforeItEndsString} <i class="far fa-eye" style="color: green;"></i>`
 });

 const PlacesWhereYouWantToInjectTimeEndedArray = Array.from(document.getElementsByClassName('ended-time'))
 PlacesWhereYouWantToInjectTimeEndedArray  .forEach((element) => {
   let endTimeUnParsed = String(element.dataset.ended_time).replace('UTC','')
   let endTimeParsed = moment(endTimeUnParsed,"YYYY-MM-DD HH:mm:ss")
   let TimeSinceEndString = endTimeParsed.from(moment(),true)
   element.innerHTML = `${TimeSinceEndString} ago <i class="far fa-eye-slash"></i>`
 });
}




export { eventTimeLogic }
