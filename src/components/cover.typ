// Cover Component
#import "../const.typ" as const

#let linebreak_n(n) = {
	let i = 0;
	while i < n {
		linebreak()
		i = i + 1;
	}
}

#let blue_cell(content) = table.cell(
	fill: const.dark_blue,
	text(weight: "bold", fill: white, content),
)

#let cover(nr, matnr, topic, degree) = {
	set text(font: "PT Sans")

	text(weight: "bold", fill: const.dark_blue, size: 15pt)[Theory/Practice Transfer Paper #nr]
	linebreak_n(2)
	table(
		columns: (1fr, 2fr),
		blue_cell([Matriculation number:#linebreak_n(2)]), matnr,
		blue_cell([Accepted topic:#linebreak_n(5)]), topic,
		blue_cell([Bachelor's programme, centuria:]), degree
	)

	set text(font: "libertinus serif")
	pagebreak()
}
