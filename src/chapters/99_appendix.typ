#import "../components/code.typ": codeblock
#import "../components/ai_table.typ": ai_documentation

== Code snippet
#figure(
  codeblock("../res/rust_example.rs", "rust"),
  caption: [Dummy Rust code to show the code blocks],
) <code-snippet>

== Text
#lorem(50)

#ai_documentation(
  entries: (
    (
      date: "2026-06-08",
      query: "This is an example prompt that will have the date above appended to it automatically. The date field is required and must be in YYYY-MM-DD format.",
      reason: "Demonstration of the AI documentation table formatting and validation.",
      quality: "Excellent; Didn't need any follow-up prompts or corrections.",
      software: "Claude Opus 4.8",
    ),
  ),
)
