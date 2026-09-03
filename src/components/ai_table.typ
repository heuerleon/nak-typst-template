#import "../ai_documentation.typ": ai_documentation_entries
#import "translations.typ": english_heading_texts, german_heading_texts
#import "transfer_paper.typ": document_language

#let nordakademie_blue = rgb(8, 31, 92)

#let blue_header_cell(content) = table.cell(
  align: left,
  fill: nordakademie_blue,
  inset: 6pt,
  {
    set par(justify: false)
    text(weight: "bold", fill: white, size: 0.85em, content)
  },
)

#let empty_cell() = table.cell(
  align: left,
  inset: 6pt,
  block(height: 1.4cm, width: 100%)[],
)

// Validate that an entry has all required fields with non-empty
// values. Throws a compile error pinpointing the offending entry
// and the missing/empty field, so missing data is caught early
// instead of silently producing empty table cells.
#let required_fields = ("query", "date", "reason", "quality", "software")

#let validate_entry(entry, index) = {
  let present = entry.keys()
  for field in required_fields {
    if not present.contains(field) {
      panic(
        "ai_documentation: entry #" + str(index + 1) + " is missing required field `" + field + "`. " +
        "Every entry must have: " + required_fields.join(", ") + ".",
      )
    }
    let value = entry.at(field)
    if value == none or (type(value) == str and value.trim() == "") {
      panic(
        "ai_documentation: entry #" + str(index + 1) + " has an empty `" + field + "` field. " +
        "Every entry must have: " + required_fields.join(", ") + ".",
      )
    }
  }
}

// Format an entry's `date` field (YYYY-MM-DD) as DD.MM.YYYY.
// Throws if the date is present but malformed.
#let format_date(entry) = {
  let parts = entry.date.split("-")
  if parts.len() != 3 or parts.at(0).len() != 4 or parts.at(1).len() != 2 or parts.at(2).len() != 2 {
    panic(
      "ai_documentation: `date` must be in YYYY-MM-DD format, got `" + str(entry.date) + "`.",
    )
  }
  " (" + parts.at(1) + "." + parts.at(2) + "." + parts.at(0) + ")"
}

#let filled_row(entry) = {
  let query_with_date = entry.query + format_date(entry)
  (
    table.cell(align: left, inset: 6pt, {
      set par(justify: false)
      query_with_date
    }),
    table.cell(align: left, inset: 6pt, {
      set par(justify: false)
      entry.reason
    }),
    table.cell(align: left, inset: 6pt, {
      set par(justify: false)
      entry.quality
    }),
    table.cell(align: left, inset: 6pt, {
      set par(justify: false)
      entry.software
    }),
  )
}

#let ai_documentation() = {
  for (i, entry) in ai_documentation_entries.enumerate() {
    validate_entry(entry, i)
  }

  let heading_texts = if document_language == "de" {
    german_heading_texts
  } else {
    english_heading_texts
  }

  [
    == #heading_texts.ai_section_title

    #grid(
      columns: (1fr, auto),
      align: (top, top),
      column-gutter: 1em,
      stack(
        spacing: 0.4em,
        text(weight: "bold", size: 18pt, fill: nordakademie_blue)[],
        text(weight: "bold", size: 12pt, fill: black)[
          #heading_texts.ai_section_subtitle
        ],
      ),
    )

    #table(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: (left, left, left, left),
      stroke: (x, y) => if y == 0 {
        (bottom: 0.7pt + nordakademie_blue)
      } else {
        (rest: 0.5pt + gray)
      },
      blue_header_cell[#heading_texts.ai_col_query],
      blue_header_cell[#heading_texts.ai_col_reason],
      blue_header_cell[#heading_texts.ai_col_quality],
      blue_header_cell[#heading_texts.ai_col_software],
      ..ai_documentation_entries.map(filled_row).flatten(),
      // Two spare empty rows at the bottom; bump this number for more.
      ..range(2).map(_ => (empty_cell(), empty_cell(), empty_cell(), empty_cell())).flatten(),
    )

    #v(0.4cm)

    #set text(size: 0.85em)
    #heading_texts.ai_footnote

    #heading_texts.ai_attribution
  ]
}
