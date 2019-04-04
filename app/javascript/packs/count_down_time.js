var moment = require('moment');
moment().format();

const countDownTimer = () => {

const  object = Array.from(document.getElementsByClassName('ended-time-js'))
 object.forEach((element) => {
   const endTime = String(element.dataset.end_time)
   const endDate = moment(endTime)
   const expirationString = endDate.from(moment())
   element.innerHTML = ` ${expirationString} <i class="fas fa-stopwatch"></i> `

});

 const object2 = Array.from(document.getElementsByClassName('ended-time'))
   object2.forEach((element) => {
     const endTime = String(element.dataset.ended_time)
     const endDate = moment(endTime)
     const expirationString = endDate.from(moment())
      element.innerHTML =  expirationString

  });

}



export { countDownTimer };
// to be done later
