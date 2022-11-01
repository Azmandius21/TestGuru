document.addEventListener('turbolinks:load', function() {
  let controls = document.querySelectorAll('.form-inline-link')

  if (controls.length) {
    for (let i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHandler)
    }
  }
})

function formInlineLinkHandler(event) {
  event.preventDefault()
  let testId = this.dataset.testId

  formInlineHandler(testId)
}

function formInlineHandler(testId) {
  let $link = $('.form-inline-link[data-test-id="' + testId + '"]')
  let $testTitle = $('.test-title[data-test-id="' + testId + '"]')
  let $formInline = $('.form-inline[data-test-id="' + testId + '"]')

  $formInline.toggleClass("hide")
  $testTitle.toggleClass("hide")

  if ($formInline.hasClass("hide")) {
    $link.text("Edit")
  } else {
    $link.text("Cancel")
  }
}
