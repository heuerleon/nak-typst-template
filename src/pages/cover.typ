#import "../const.typ" as const

#set text(font: "PT Sans")
#let linebreakn(n) = {
	let i = 0;
	while i < n {
		[#linebreak()]
		i = i + 1;
	}
}
#text(weight: "bold", fill: const.dark_blue, size: 15pt)[Theory/Practice Transfer Paper 1]\
#linebreak()

#let navy_cell(content) = table.cell(fill: const.dark_blue, text(weight: "bold", fill: white, content))
#let cover_table(matnr, topic, degree) = table(
	columns: (1fr, 2fr),
	navy_cell([Matriculation number:#linebreakn(2)]), matnr,
	navy_cell([Accepted topic:#linebreakn(5)]), topic,
	navy_cell([Bachelor's programme, centuria:]), degree
)

#cover_table(
	box[12489],
	box[Comparing Fargate and EC2 for running ECS containers in AWS],
	box[Angewandte Informatik, A22b],
)

#set text(font: "libertinus serif")
#pagebreak()