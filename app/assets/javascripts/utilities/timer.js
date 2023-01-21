document.addEventListener('turbolinks:load', function() {
  const beginTime = new Date().getTime()
  console.log(beginTime)
  let interval = setInterval(countDownTime, 1000, beginTime)
  clearInterval(interval)
})

function countDownTime(time) {
  let timeNow = new Date().getTime()
  difTime = timeNow - time
  // document.querySelector('#second').innerHtml = Math.floor(difTime/1000)
  // document.querySelector('.minutes').innerHtml = Math.floor(difTime/(1000*60))
  // document.querySelector('.hours').innerHTML = Math.floor(difTime/(1000*60*60))
  console.log(difTime)
}
