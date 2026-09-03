#import "../const.typ": nordakademie_blue

#let linebreak_n(n) = {
	let i = 0;
	while i < n {
		linebreak()
		i = i + 1;
	}
}

#let blue_cell(content) = table.cell(
	fill: nordakademie_blue,
	text(weight: "bold", fill: white, content),
)

// Cover Component
#let cover(language, nr, matnr, topic, degree) = {
	let texts
	if language == "en" {
		texts = (
			header: "Theory/Practice Transfer Paper",
			matnr: "Matriculation number:",
			topic: "Accepted topic:",
			programme: "Bachelor's programme, centuria:"
		)
	} else if language == "de" {
		texts = (
			header: "Transferleistung Theorie/Praxis",
			matnr: "Matrikelnummer:",
			topic: "Freigegebenes Thema:",
			programme: "Studiengang, Zenturie:"
		)
	} else {
		return "Language must be English (\"en\") or German (\"de\")"
	}
	set text(font: "Liberation Sans", fallback: true)

	text(weight: "bold", fill: nordakademie_blue, size: 15pt)[#texts.header #nr]
	linebreak_n(2)
	table(
		columns: (1fr, 2fr),
		blue_cell[#texts.matnr #linebreak_n(2)], matnr,
		blue_cell[#texts.topic #linebreak_n(5)], topic,
		blue_cell[#texts.programme], degree
	)

	set text(font: "libertinus serif")
	pagebreak()
}
