document.addEventListener('turbolinks:load', function() {
  if (document.querySelector('.progress-bar')) {
    var progressBar =  document.querySelector('.progress-bar')
    var progressInPercent = progressBar.dataset.progress
    growProgressBar(progressInPercent, progressBar)
  }
})

function growProgressBar(percent, element) {
  element.style.width = percent
  element.innerHTML = percent
}
