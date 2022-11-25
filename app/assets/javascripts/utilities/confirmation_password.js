document.addEventListener('turbolinks:load', function() {
  var form = document.querySelector('.new_user')
  if (form) {form.user_password_confirmation.addEventListener('input', confPassword)}
})

function confPassword(event) {
  var password = $('#user_password').val()
  var passwordConf = $('#user_password_confirmation').val()

  if (passwordConf) {
    if (password == passwordConf) {
      document.querySelector('.octicon-check-circle').classList.remove('hide')
      document.querySelector('.octicon-circle-slash').classList.add('hide')
    } else {
      document.querySelector('.octicon-check-circle').classList.add('hide')
      document.querySelector('.octicon-circle-slash').classList.remove('hide')
    }
  } else {
      document.querySelector('.octicon-circle-slash').classList.add('hide')
      document.querySelector('.octicon-check-circle').classList.add('hide')
  }
}
