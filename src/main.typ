// Imports
#import "components/cover.typ": *
#import "components/outline.typ": *
#import "components/code.typ": *
#import "components/tables.typ": *
#import "const.typ" as globals

#import "@preview/acrostiche:0.5.1": *

// Document config
#set text(size: globals.font_size)
#set page(
	header: image("res/header.png"),
	margin: (y: 3cm, x: 2cm)
)
#set par(spacing: 1.5em)
#show link: it => [
	#underline(text(blue, it))
]

// Cover
#cover(
  "1",
	"12345",
	"A wonderful and descriptive but not too long topic name, but at least it stretches over two lines",
	"Angewandte Informatik, A22b",
)

// Table of Contents
#set page(numbering: "I")
#counter(page).update(1)
#toc()

// List of Figures
#list_of("List of Figures", image)

// List of Tables
#list_of("List of Tables", table)

// List of Listings
#list_of("List of Listings", raw)

// List of Acronyms
#acronyms((
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

Here will be an example for a specifically styled table, using the simple_table component.

#figure(
	simple_table(
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

The table can be referenced as @table-1 like this. #lorem(50)

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
) <table-2>

@table-2 shows a more general example of a table, even with a colspan 2 cell that stretches over 2 cells.


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

Here is a text explaining some important stuff but there is something that needs a footnote, for example the word abcd#footnote([abcd stands for "absolutely brilliant cool design", see #link("https://otto.de")]). If we want to add a link inside the text, we #link("https://otto.de")[can do so].


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
