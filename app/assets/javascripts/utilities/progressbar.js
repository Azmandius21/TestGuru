document.addEventListener('turbolinks:load', function() {
  if (document.querySelector('.progress-bar')) {
    const progressBar =  document.querySelector('.progress-bar')
    let progressInPersent = progressBar.textContent
    growProgressBar(progressBar, progressBar)

    console.log(progressInPersent);
  }
})

function growProgressBar(persent, progressBar) {
  progressBar.style.width = persent
}
