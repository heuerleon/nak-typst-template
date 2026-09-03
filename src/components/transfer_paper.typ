#import "header.typ": header
#import "translations.typ": english_heading_texts, german_heading_texts
#import "../pages/outline.typ": toc, list_of
#import "../pages/cover.typ": cover
#import "../dependencies.typ": zebraw, zebraw-themes, make-glossary, print-glossary, register-glossary
#import "../abbreviations.typ": abbreviation_list

#let transfer_paper(
  language: "en",
  font_size: 12pt,
  margin_y: 3cm,
  margin_x: 2cm,
  par_spacing: 1.75em,
  list_spacing: 1em,
  list_indent: 1.5em,
  bibliography_path: "../res/literature.bib",
  citation_style: "ieee",
  headings: (
    margin_top: 30pt,
    margin_bottom: 25pt,
    font_size: 21pt,
  ),
  number,
  matnr,
  topic,
  course,
  appendix_content: none,
  body,
) = {
  // initialize extensions
  show: make-glossary // Glossary
  show: zebraw.with(..zebraw-themes.zebra) // Code listings

  // Document config
  set text(
    size: font_size,
    lang: language
  )
  set page(
    header: header(language),
    margin: (y: margin_y, x: margin_x),
  )
  set par(spacing: par_spacing)
  show heading.where(level: 1): set block(above: headings.margin_top, below: headings.margin_bottom)
  show heading.where(level: 1): set text(size: headings.font_size, weight: 600)
  show heading.where(level: 2): set block(above: headings.margin_top, below: headings.margin_bottom)
  set list(spacing: list_spacing, indent: list_indent)
  set enum(spacing: list_spacing, indent: list_indent)

  let heading_texts = if language == "en" {
    english_heading_texts
  } else if language == "de" {
    german_heading_texts
  }

  // Cover
  cover(
    language,
    number,
    matnr,
    topic,
    course,
  )

  // Start page numbering from here
  set page(numbering: "I")
  counter(page).update(1)

  // Table of Contents
  toc(heading_texts.contents)

  // List of Figures
  list_of(heading_texts.figures, image)

  // List of Tables
  list_of(heading_texts.tables, table)

  // List of Listings
  list_of(heading_texts.listings, raw)

  // List of Acronyms
  register-glossary(abbreviation_list)
  heading(heading_texts.abbreviations)
  print-glossary(
    abbreviation_list,
    disable-back-references: true,
  )
  [#[] <end-of-roman-numbering>]

  // Main Section
  set page(numbering: "1")
  counter(page).update(1)
  set heading(numbering: "1.1")
  set par(justify: true)
  {
    show heading.where(level: 1): it => {
      pagebreak(weak: true)
      it
    }
    body
  }

  // References
  set page(numbering: "I")
  context {
    let old_page_number = counter(page).at(<end-of-roman-numbering>).first()
    counter(page).update(old_page_number + 1)
  }
  set heading(numbering: none)
  {
    show link: it => text(blue, it)
    set par(spacing: 1em)
    set text(size: 11pt)
    bibliography(
      bibliography_path,
      title: heading_texts.references,
      style: citation_style,
    )
    pagebreak(weak: true)
  }

  // Appendix
  if (appendix_content != none) {
    set heading(numbering: "A.1 ")
    counter(heading).update(0)
    heading(heading_texts.appendix)
    appendix_content
  }
}