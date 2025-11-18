// Imports
#import "components/header.typ": header_de
#import "components/cover.typ": cover_de
#import "components/outline.typ": toc, list_of, acronyms
#import "dependencies.typ": *

// Document config
#set text(
  lang: "de"
)
#set text(size: globals.font_size)
#set page(
	header: header_de,
	margin: (y: globals.margin_y, x: globals.margin_x)
)
#set par(spacing: globals.paragraph_spacing)
#show heading.where(level: 1): set block(above: globals.heading_margin_top, below: globals.heading_margin_bottom)
#show heading.where(level: 2): set block(above: globals.heading_margin_top, below: globals.heading_margin_bottom)
#show link: it => [
	#underline(text(blue, it)) // styling for urls
]
#show: zebraw.with(..zebraw-themes.zebra) // Styling for advanced code blocks

// Cover
#cover_de(
  "1",
	"12345",
	"Ein wundervoller und deskriptiver, aber nicht zu langer Titel, aber immerhin füllt er zwei Zeilen",
	"Angewandte Informatik, A22b",
)

// Table of Contents
#set page(numbering: "I")
#counter(page).update(1)
#toc("Inhaltsverzeichnis")

// List of Figures
#list_of("Abbildungsverzeichnis", image)

// List of Tables
#list_of("Tabellenverzeichnis", table)

// List of Listings
#list_of("Quellcodeverzeichnis", raw)

// List of Acronyms
#acronyms("Abkürzungsverzeichnis", (
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
#include "chapters/01_kapitel.typ"
#include "chapters/02_kapitel.typ"
#include "chapters/03_kapitel.typ"


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

= Anhang

== Code snippet
#figure(
	codeblock("../res/rust_example.rs", "rust"),
	caption: [Dummy Rust code to show the code blocks]
) <code-snippet>

== Text
#lorem(50)
