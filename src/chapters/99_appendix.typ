#import "../components/code.typ": codeblock
#import "../components/ai_table.typ": ai_documentation

== Code snippet
  #figure(
    codeblock("../res/rust_example.rs", "rust"),
    caption: [Dummy Rust code to show the code blocks]
  ) <code-snippet>

  == Text
  #lorem(50)

#ai_documentation()