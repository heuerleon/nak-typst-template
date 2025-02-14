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


#set page(numbering: "I")
#counter(page).update(1)
#outline()
#pagebreak()


#outline(
  title: [List of Figures],
  target: figure.where(kind: image),
)
#pagebreak()


#let old_page_number = context counter(page).get()
#let get_old_page_number(ignored) = ignored - ignored + old_page_number
#counter(page).update(1)
#set page(numbering: "1")
This is just a test transfer paper
#lorem(100)


#set page(numbering: "I")
#counter(page).update(get_old_page_number)
= Appendix
