// Code component
#let code_listing(source, lang: none, caption) = {
  show raw: set align(left)
  figure(
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
    ),
    caption: caption,
    kind: "code",
    supplement: "Code Listing",
  )
}
