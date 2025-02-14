// Cover
Theory/Practice Transfer Paper\
Nr. 4

#let navy_cell(content) = table.cell(fill: blue.darken(60%), text(white, content))
#let cover_table(matnr, topic, degree) = table(
	columns: 2,
	navy_cell([Matriculation number:]), matnr,
	navy_cell([Accepted topic:]), topic,
	navy_cell([Bachelor's programme, centuria:]), degree
)

#cover_table(
	box[12489],
	box[Comparing Fargate and EC2 for running ECS containers in AWS],
	box[Angewandte Informatik, A22b],
)

#pagebreak()


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
