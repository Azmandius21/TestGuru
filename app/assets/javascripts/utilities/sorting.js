document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-title')

  control.addEventListener('click', sortRowsByTitle)
})

function sortRowsByTitle() {
  const table = document.querySelector('table')
  const rows = document.querySelectorAll('tr')

  let sortedRows = []

  for (let i = 1; i < rows.length; i++ ) {
    sortedRows.push(rows[i])
  }

  console.log(sortedRows)
}
