#let table_style_1(table_content) = {
  show table.cell.where(y: 0): strong
  set table(
    stroke: (x, y) => if y == 0 {
      (bottom: 0.7pt + black)
    },
    align: (x, y) => (
      if x > 0 { center }
      else { left }
    ),
  )
  table_content
}

#let table_style_2(table_content) = {
  set text(size: 0.8em)
  show table.cell.where(y: 0): strong
  set table(
    stroke: (x, y) => {
      if y == 0 {
        (bottom: 0.7pt + black)
      }
      if y > 1 {
        (top: 0.7pt + gray)
      }
      if x == 0 {
        (right: 0.7pt + black)
      }
    },
    align: left,
    inset: 8pt,
  )
  pad(x: 1em, y: 1em, table_content)
}

#let table_style_3(table_content) = {
  set text(size: 0.8em)
  show table.cell.where(y: 0): strong
  set table(
    stroke: (x, y) => {
      if y == 0 {
        (bottom: 0.7pt + black)
      }
      if y > 1 {
        (top: 0.7pt + gray)
      }
      if x < 2 {
        (right: 0.7pt + black)
      }
      if x > 2 {
        (left: 0.7pt + gray)
      }
    },
    align: (x, y) => (
      if x > 0 { center }
      else { left }
    ),
    inset: 8pt,
  )
  pad(x: 1em, y: 1em, table_content)
}

#let table_style_3_bottom_cell(content) = {
  table.cell(stroke: (top: 0.7pt + black), strong(content))
}