#import "../dependencies.typ": *

= Figures

== Images

The following will show how images look like in the document. This uses the default figure and image functions of Typst. Nothing special, you can configure stuff like height and caption.

#figure(
  image("../res/example_image.jpg", height: 9cm),
  caption: "Interesting image of Korea because I love Korea and I want to showcase images",
) <korea-image>

As @korea-image shows, Korea is a beautiful country. Please study Korean and go there to live and study. #lorem(50)

#lorem(150)

== Tables

#figure(
	table(
		columns: 4,
		table.header(
			[*Criterion*], [*Weight*], [*Solution 1*], [*Solution 2*],
		),
		[Functional Suitability], [9.4%], [5], [3],
		[Performance Efficiency], [16.9%], [5], [3],
		[Compatibility], [6.0%], [5], [4],
		[Usability], [5.8%], [4], [5],
		[Reliability], [18.9%], [5], [4],
		[Security], [23.3%], [4], [5],
		[Maintainability], [14.0%], [3], [5],
		[Portability], [5.7%], [4], [5],
		table.cell(colspan: 2)[*Total score*], [*4.372*], [*4.225*],
	),
	caption: [A more general table example]
) <table-generic>

@table-generic shows an example of the default typst table, with a colspan 2 cell that stretches over 2 cells.

=== Table style 1

Here will be an example for a styled table, using the table_style_1 component.

#figure(
	table_style_1(
		table(
			columns: 2,
			table.header(
				[Criterion], [Weight],
			),
			[Functional Suitability], [9.4%],
			[Performance Efficiency], text(green)[16.9%],
			[Compatibility], text(yellow)[6%],
			[Usability], text(yellow)[5.8%],
			[Reliability], text(green)[18.9%],
			[Security], text(green)[23.3%],
			[Maintainability], [14%],
			[Portability], text(yellow)[5.7%],
			[Total], [1],
		),
	),
	caption: [Weights for each criteria resulting from the AHP method],
) <table-1>

The table can be referenced as @table-1 like this. #lorem(100)

=== Table style 2

Here will be an example of another styled table, using the table_style_2 component.

#figure(
	table_style_2(
		table(
			columns: 2,
			table.header(
				[Question], [Answer type]
			),
			[How easy is it to filter, search and categorize tasks?], [Scale from 1 (worst) to 5 (best)],
			[How well does the tool support real-time collaboration? For example: Can many people read, edit or move tasks at the same time, does the data update real-time], [Scale from 1 (worst) to 5 (best)],
			[Is the tool customizable enough to easily adapt it to your team's needs?], [Scale from 1 (worst) to 5 (best)],
			[What are the biggest advantages of working with the tool?], [Free text],
			[What are the biggest pain points of working with the tool?], [Free text],
			[Which feature are you missing?], [Free text],
		),
	),
	caption: [Questions to be answered by other team's project leads who have worked with the respective tools],
) <table-2>

The table can be referenced as @table-2 like this. #lorem(60)

=== Table style 3

This is one more example of another styled table, using the table_style_3 component.

#figure(
	table_style_3(
		table(
			columns: 6,
			table.header(
				[Criterion], 					[Weight], [Miro], [GH Projects], [Jira], [Planner]
			),
			[Formatting versatility],			[17.6%], [0.116], [0.524], [0.308], [0.052],
			[Integration with other tools],		[11.5%], [0.084], [0.267], [0.587], [0.062],
			[Organization],						[23.2%], [0.053], [0.427], [0.414], [0.106],
			[Real-time collaboration],			[29%],   [0.057], [0.550], [0.288], [0.104],
			[Customization and Flexibility],	[18.7%], [0.299], [0.138], [0.511], [0.051],
			table_style_3_bottom_cell([Total]), table_style_3_bottom_cell([1]), table_style_3_bottom_cell([0.115]), table_style_3_bottom_cell([0.407]), table_style_3_bottom_cell([0.397]), table_style_3_bottom_cell([0.081]),
		),
	),
	caption: [Final weights of the alternatives calculated through AHP]
) <table-3>

The table can be referenced as @table-3 like this. #lorem(50)


#pagebreak()