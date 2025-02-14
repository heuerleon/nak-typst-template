// Document config
#set text(size: 12pt)

// Cover
#import "pages/cover.typ": cover
#cover(
  [1],
	[12345],
	[A wonderful and descriptive but not too long topic name],
	[Angewandte Informatik, A22b],
)

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
#pagebreak()


// Main Section
<end-of-roman-numbering>
#set page(numbering: "1")
#counter(page).update(1)
This is just a test transfer paper
#lorem(100)


// Bibliography
#set page(numbering: "I")
#context {
	let old_page_number = counter(page).at(<end-of-roman-numbering>).first()
	counter(page).update(old_page_number)
}

// Appendix
= Appendix
