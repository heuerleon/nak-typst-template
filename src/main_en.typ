// Imports
#import "components/header.typ": header_en
#import "components/cover.typ": cover_en
#import "components/outline.typ": *
#import "components/code.typ": *
#import "components/tables.typ": *
#import "components/acronym.typ": acr
#import "const.typ" as globals

// Document config
#set text(size: globals.font_size)
#set page(
	header: header_en,
	margin: (y: globals.margin_y, x: globals.margin_x)
)
#set par(spacing: globals.paragraph_spacing)
#show heading.where(level: 1): set block(above: globals.heading_margin_top, below: globals.heading_margin_bottom)
#show heading.where(level: 2): set block(above: globals.heading_margin_top, below: globals.heading_margin_bottom)
#show link: it => [
	#underline(text(blue, it)) // styling for urls
]

// Cover
#cover_en(
  "1",
	"12345",
	"A wonderful and descriptive but not too long topic name, but at least it stretches over two lines",
	"Angewandte Informatik, A22b",
)

// Table of Contents
#set page(numbering: "I")
#counter(page).update(1)
#toc("Table of Contents")

// List of Figures
#list_of("List of Figures", image)

// List of Tables
#list_of("List of Tables", table)

// List of Listings
#list_of("List of Listings", raw)

// List of Acronyms
#acronyms("List of Acronyms", (
  "NAK": ("Nordakademie"),
  "TL": ("Transferleistung", "Transferleistungen")
))

// Main Section
<end-of-roman-numbering>
#set page(numbering: "1")
#counter(page).update(1)
#set heading(numbering: "1.1")
#set par(justify: true)


// --- Include content here ---
= Showing off this template
== Citing
#lorem(50) @nocera_software_2023

#lorem(30) @nocera_software_2023 @moskala_android_2017

== Code blocks

=== Inline code
Adding `rbx` to `rcx` gives
the desired result.

What is ```rust fn main()``` in Rust
would be ```c int main()``` in C.

=== Code block
This is an example for a simple code block:
```rust
fn main() {
    println!("Hello World!");
}
```

#pagebreak()

= Figures

== Images

The following will show how images look like in the document. This uses the default figure and image functions of Typst. Nothing special, you can configure stuff like height and caption.

#figure(
  image("res/example_image.jpg", height: 9cm),
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

= Using some common document features

+ You can start a simple enumeration by using `+` in Typst
+ This will be one more line
+ #lorem(20)

Here is some more dummy text to fill the page Here is some more dummy text to fill the page Here is some more dummy text to fill the page as you can see in @code-snippet. This is a reference to the appendix code listing.

Normal list.
- Text
- Math
- Layout
- ...

Here is a text explaining some important stuff but there is something that needs a footnote, for example the word abcd#footnote([abcd stands for "absolutely brilliant cool design", see #link("https://nordakademie.de")]). If we want to add a link inside the text, we #link("https://nordakademie.de")[can do so].


// Bibliography
#set page(numbering: "I")
#context {
	let old_page_number = counter(page).at(<end-of-roman-numbering>).first()
	counter(page).update(old_page_number + 1)
}
#set heading(numbering: none)
#bibliography("res/literature.bib")
#pagebreak()

// Appendix
#set heading(numbering: "A.1 ")
#counter(heading).update(0)

= Appendix

== Code snippet
#figure(
	code_listing("../res/rust_example.rs", "rust"),
  	caption: [Dummy Rust code to show the code blocks]
) <code-snippet>

== Text
#lorem(50)
