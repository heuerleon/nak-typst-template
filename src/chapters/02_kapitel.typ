#import "../dependencies.typ": *

= Abbildungen

== Bilder

Im Folgenden wird gezeigt, wie Bilder im Dokument aussehen. Dies verwendet die Standardfunktionen figure und image von Typst. Nichts Besonderes, man kann Dinge wie Höhe und Beschriftung konfigurieren.

#figure(
	image("../res/example_image.jpg", height: 9cm),
	caption: "Interessantes Bild aus Korea, da ich Korea liebe und Bilder zeigen möchte",
) <korea-image>

Wie @korea-image zeigt, ist Korea ein wunderschönes Land. Bitte lerne Koreanisch und gehe dorthin, um dort zu leben und zu studieren. #lorem(50)

#lorem(150)

== Tabellen

#figure(
	table(
		columns: 4,
		table.header(
			[*Kriterium*], [*Gewichtung*], [*Lösung 1*], [*Lösung 2*],
		),
		[Funktionale Eignung], [9.4%], [5], [3],
		[Leistungseffizienz], [16.9%], [5], [3],
		[Kompatibilität], [6.0%], [5], [4],
		[Benutzbarkeit], [5.8%], [4], [5],
		[Zuverlässigkeit], [18.9%], [5], [4],
		[Sicherheit], [23.3%], [4], [5],
		[Wartbarkeit], [14.0%], [3], [5],
		[Übertragbarkeit], [5.7%], [4], [5],
		table.cell(colspan: 2)[*Gesamtpunktzahl*], [*4.372*], [*4.225*],
	),
	caption: [Ein allgemeineres Tabellenbeispiel]
) <table-generic>

@table-generic zeigt ein Beispiel für die Standard-Tabelle in Typst, mit einer Zelle, die sich über zwei Spalten erstreckt.

=== Tabellenstil 1

Hier folgt ein Beispiel für eine gestaltete Tabelle unter Verwendung der `table_style_1` Komponente.

#figure(
	table_style_1(
		table(
			columns: 2,
			table.header(
				[Kriterium], [Gewichtung],
			),
			[Funktionale Eignung], [9.4%],
			[Leistungseffizienz], text(green)[16.9%],
			[Kompatibilität], text(yellow)[6%],
			[Benutzbarkeit], text(yellow)[5.8%],
			[Zuverlässigkeit], text(green)[18.9%],
			[Sicherheit], text(green)[23.3%],
			[Wartbarkeit], [14%],
			[Übertragbarkeit], text(yellow)[5.7%],
			[Gesamt], [1],
		),
	),
	caption: [Gewichtungen der einzelnen Kriterien, die sich aus der AHP-Methode ergeben],
) <table-1>

Die Tabelle kann wie hier als @table-1 referenziert werden. #lorem(100)

=== Tabellenstil 2

Hier folgt ein weiteres Beispiel einer gestalteten Tabelle unter Verwendung der `table_style_2` Komponente.

#figure(
	table_style_2(
		table(
			columns: 2,
			table.header(
				[Frage], [Antworttyp]
			),
			[Wie einfach ist es, Aufgaben zu filtern, zu suchen und zu kategorisieren?], [Skala von 1 (schlechteste) bis 5 (beste) Bewertung],
			[Wie gut unterstützt das Tool die Echtzeit-Zusammenarbeit? Zum Beispiel: Können mehrere Personen gleichzeitig lesen, bearbeiten oder Aufgaben verschieben, werden die Daten in Echtzeit aktualisiert?], [Skala von 1 (schlechteste) bis 5 (beste) Bewertung],
			[Ist das Tool ausreichend anpassbar, um es leicht an die Bedürfnisse Ihres Teams anzupassen?], [Skala von 1 (schlechteste) bis 5 (beste) Bewertung],
			[Was sind die größten Vorteile bei der Arbeit mit dem Tool?], [Freitext],
			[Was sind die größten Probleme bei der Arbeit mit dem Tool?], [Freitext],
			[Welche Funktion vermissen Sie?], [Freitext],
		),
	),
	caption: [Fragen, die von den Projektleitenden anderer Teams beantwortet werden sollen, die mit den jeweiligen Tools gearbeitet haben],
) <table-2>

Die Tabelle kann wie hier als @table-2 referenziert werden. #lorem(60)

=== Tabellenstil 3

Dies ist ein weiteres Beispiel einer gestalteten Tabelle unter Verwendung der `table_style_3` Komponente.

#figure(
	table_style_3(
		table(
			columns: 6,
			table.header(
				[Kriterium], [Gewichtung], [Miro], [GH Projects], [Jira], [Planner]
			),
			[Formatierungsflexibilität], [17.6%], [0.116], [0.524], [0.308], [0.052],
			[Integration mit anderen Tools], [11.5%], [0.084], [0.267], [0.587], [0.062],
			[Organisation], [23.2%], [0.053], [0.427], [0.414], [0.106],
			[Echtzeit-Zusammenarbeit], [29%], [0.057], [0.550], [0.288], [0.104],
			[Anpassbarkeit und Flexibilität], [18.7%], [0.299], [0.138], [0.511], [0.051],
			table_style_3_bottom_cell([Gesamt]), table_style_3_bottom_cell([1]), table_style_3_bottom_cell([0.115]), table_style_3_bottom_cell([0.407]), table_style_3_bottom_cell([0.397]), table_style_3_bottom_cell([0.081]),
		),
	),
	caption: [Endgewichtung der Alternativen, berechnet mit der AHP-Methode]
) <table-3>

Die Tabelle kann wie hier als @table-3 referenziert werden. #lorem(50)

#pagebreak()