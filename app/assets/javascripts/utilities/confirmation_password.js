document.addEventListener('turbolinks:load', function() {
  const form = document.querySelector('.new_user')
  if (form) {form.user_password_confirmation.addEventListener('input', confPassword)}
})

function confPassword(event) {
  let password = $('#user_password').val()
  let passwordConf = $('#user_password_confirmation').val()

  if (passwordConf) {
    if (password == passwordConf) {
      document.querySelector('.octicon-check-circle').classList.remove('hide')
      document.querySelector('.octicon-circle-slash').classList.add('hide')
    } else {
      document.querySelector('.octicon-check-circle').classList.add('hide')
      document.querySelector('.octicon-circle-slash').classList.remove('hide')
    }
  }

  if (!passwordConf){
    document.querySelector('.octicon-circle-slash').classList.add('hide')
    document.querySelector('.octicon-check-circle').classList.add('hide')
  }
}
