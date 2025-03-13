// Code component
#let code_listing(source, lang) = {
  show raw: set align(left)
  set par(justify: false)
  show ".": "." + sym.zws
  show ";": ";" + sym.zws
  block(
    fill: gray.lighten(85%),
    radius: 10pt,
    pad(
      10pt,
      block(
        raw(read(source), lang: lang),
        width: 100%,
      ),
    ),
  )
}