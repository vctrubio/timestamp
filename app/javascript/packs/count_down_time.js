var moment = require('moment');
moment().format();

const countDownTimer = () => {

const  object = Array.from(document.getElementsByClassName('ended-time-js'))
 object.forEach((element) => {
   const endTime = element.dataset.end_time
   const endDate = moment(String(endTime))
   console.log(endDate)
});


}



export { countDownTimer };
// to be done later
