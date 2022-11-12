document.addEventListener('turbolinks:load', function() {
  if (document.querySelector('.progress-bar')) {
    const progressBar =  document.querySelector('.progress-bar')
    let progressInPercent = progressBar.dataset.progress
    growProgressBar(progressInPercent, progressBar)
  }
})

function growProgressBar(percent, element) {
  element.style.width = percent
  element.innerHTML = percent 
}
