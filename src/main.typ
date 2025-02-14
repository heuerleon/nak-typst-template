// Imports
#import "components/cover.typ": cover
#import "components/outline.typ": toc, list_of, acronyms
#import "@preview/acrotastic:0.1.1" as acro
#import acro: acr

// Document config
#set text(size: 12pt)
#set page(header: image("res/header.png"))
#set page(margin: (y: 3cm, x: 2cm))

// Cover
#cover(
  "1",
	"12345",
	"A wonderful and descriptive but not too long topic name, but at least it stretches over two lines",
	"Angewandte Informatik, A22b",
)

// Table of Contents
#set page(numbering: "I")
#counter(page).update(1)
#toc()

// List of Figures
#list_of("List of Figures", image)

// List of Tables
#list_of("List of Tables", table)

// List of Acronyms
#acronyms((
  "NAK": ("Nordakademie"),
  "TL": ("Transferleistung", "Transferleistungen")
))

// Main Section
<end-of-roman-numbering>
#set page(numbering: "1")
#counter(page).update(1)
#set heading(numbering: "1.1")


// --- Include content here ---
#include "pages/chapter1.typ"


// Bibliography
#set page(numbering: "I")
#context {
	let old_page_number = counter(page).at(<end-of-roman-numbering>).first()
	counter(page).update(old_page_number)
}
#set heading(numbering: "A ")
#counter(heading).update(0)

// Appendix
= Appendix
