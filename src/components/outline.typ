// Outline Component
#import "@preview/acrotastic:0.1.1" as acro

#let toc() = {
  show outline.entry.where(
    level: 1
  ): it => {
    v(0.5cm, weak: true)
    show repeat: none
    strong(it)
  }
  outline(indent: auto)
  pagebreak()
}

#let list_of(title, kind) = {
  {
    show heading: none
    heading[#title]
  }
  outline(
    title: title,
    target: figure.where(kind: kind),
  )
  pagebreak()
}

#let acronyms(acronyms) = {
  acro.init-acronyms(acronyms)
  {
    show heading: none
    heading[List of Acronyms]
  }
  acro.print-index(title: "List of Acronyms")
  pagebreak()
}
