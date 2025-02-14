// Document config
#set text(size: 12pt)

// Cover
#include "pages/cover.typ"


// Table of Contents
#set page(numbering: "I")
#counter(page).update(1)
#outline()
#pagebreak()

// List of Figures
#outline(
  title: [List of Figures],
  target: figure.where(kind: image),
)
<end-of-roman-numbering>
#pagebreak()


// Main Section
#set page(numbering: "1")
#counter(page).update(1)
This is just a test transfer paper
#lorem(100)


// Bibliography
#set page(numbering: "I")
#context {
	let old_page_number = counter(page).at(<end-of-roman-numbering>).first()
	counter(page).update(old_page_number + 1)
}

// Appendix
= Appendix
