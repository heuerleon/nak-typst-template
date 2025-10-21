// Header component
#let header_en = {
  grid(
    columns: (1fr, 1fr),
    align: top,
    stroke: (bottom: .5pt + black),
    inset: (bottom: 5pt),
    image("../res/header_en.png", width: 70%),
    grid.cell(
      align: right,
      image("../res/nordakademie_logo.png", width: 70%)
    )
  )
}

#let header_de = {
  grid(
    columns: (1fr, 1fr),
    align: top,
    stroke: (bottom: .5pt + black),
    inset: (bottom: 5pt),
    image("../res/header_de.png", width: 70%),
    grid.cell(
      align: right,
      image("../res/nordakademie_logo.png", width: 70%)
    )
  )
}