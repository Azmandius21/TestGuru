document.addEventListener('turbolinks:load', function() {
  let progressBar =  document.querySelector('.progress-bar')
  const testPassageId  = this.dataset.testPassageId

  console.log(testPassageId);
})
