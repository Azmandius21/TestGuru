document.addEventListener('turbolinks:load', function() {
  const control = document.querySelector('.sort-by-title')

  if (control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle() {
  let table = document.querySelector('table')
  const rows = document.querySelectorAll('tr')

  let sortedRows = []

  for (let i = 1; i < rows.length; i++ ) {
    sortedRows.push(rows[i])
  }

  console.log(sortedRows)

  sortedRows.sort(compareRows)

  console.log(sortedRows)

  const sortedTable = document.createElement('table')

  sortedTable.classList.add('table','table-striped')
  sortedTable.appendChild(rows[0])

  for (let i = 0; i < sortedRows.length; i++ ) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRows(row1,row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 > testTitle2) { return 1}
  if (testTitle1 < testTitle2) { return -1}
  return 0
}
