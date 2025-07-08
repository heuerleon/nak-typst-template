// Outline Components
#import "acronym.typ": print-index, init-acronyms

// Table of Contents
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

// List of x
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

// List of Acronyms
#let acronyms(acronyms) = {
  init-acronyms(acronyms)
  print-index(title: "List of Acronyms", outlined: true, delimiter: none)
  pagebreak()
}
