// Imports
#import "components/header.typ": header_en
#import "components/cover.typ": cover_en
#import "components/outline.typ": toc, list_of, acronyms
#import "dependencies.typ": *

// Document config
#set text(size: globals.font_size)
#set page(
	header: header_en,
	margin: (y: globals.margin_y, x: globals.margin_x)
)
#set par(spacing: globals.paragraph_spacing)
#show heading.where(level: 1): set block(above: globals.heading_margin_top, below: globals.heading_margin_bottom)
#show heading.where(level: 2): set block(above: globals.heading_margin_top, below: globals.heading_margin_bottom)
#show link: it => [
	#underline(text(blue, it)) // styling for urls
]
#show: zebraw.with(..zebraw-themes.zebra) // For making code listings work

// Cover
#cover_en(
  "1",
	"12345",
	"A wonderful and descriptive but not too long topic name, but at least it stretches over two lines",
	"Angewandte Informatik, A22b",
)

// Table of Contents
#set page(numbering: "I")
#counter(page).update(1)
#toc("Table of Contents")

// List of Figures
#list_of("List of Figures", image)

// List of Tables
#list_of("List of Tables", table)

// List of Listings
#list_of("List of Listings", raw)

// List of Acronyms
#acronyms("List of Acronyms", (
  "NAK": ("Nordakademie"),
  "TL": ("Transferleistung", "Transferleistungen")
))

// Main Section
<end-of-roman-numbering>
#set page(numbering: "1")
#counter(page).update(1)
#set heading(numbering: "1.1")
#set par(justify: true)


// --- Include content here ---
#include "chapters/01_chapter.typ"
#include "chapters/02_chapter.typ"
#include "chapters/03_chapter.typ"


// Bibliography
#set page(numbering: "I")
#context {
	let old_page_number = counter(page).at(<end-of-roman-numbering>).first()
	counter(page).update(old_page_number + 1)
}
#set heading(numbering: none)
#bibliography("res/literature.bib")
#pagebreak()

// Appendix
#set heading(numbering: "A.1 ")
#counter(heading).update(0)

= Appendix

== Code snippet
#figure(
	codeblock("../res/rust_example.rs", "rust"),
	caption: [Dummy Rust code to show the code blocks]
) <code-snippet>

== Text
#lorem(50)
