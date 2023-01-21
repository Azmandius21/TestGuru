document.addEventListener('turbolinks:load', function() {
  const beginTime = new Date().getTime()
  const limitTime = 5*1000
  console.log(beginTime)
  
  runInterval(beginTime, limitTime)
})

function runInterval(beginTime, limitTime) {
  myInterval = setInterval(countDownTime, 1000, (beginTime + limitTime))
 }
  
function stopTimer() {
  clearInterval(myInterval);
}

function countDownTime(time) {
  let timeNow = new Date().getTime()
  difTime = time - timeNow
  
  if (difTime >= 0) {
    document.querySelector('.seconds').innerHTML = Math.floor(difTime/1000)
    document.querySelector('.minutes').innerHTML = Math.floor(difTime/(1000*60))
    document.querySelector('.hours').innerHTML = Math.floor(difTime/(1000*60*60))    
  } else {
    stopTimer()
  }
  console.log(difTime)  
}


