# 🎓 NAK Typst Template
This is a template for Nordakademie transfer papers written in the markup-like typesetting system [Typst](https://github.com/typst/typst). Typst is an alternative to LaTeX with a range of advantages such as faster compile times, a comprehensive scripting system similar to languages like JavaScript and user-friendly error messages.

The template is designed for English transfer papers, but can be modified to write in German. The format closely resembles the other official Nordakademie templates.

## Setup

1. Install the Typst compiler on your local machine as described in the [Typst GitHub repo](https://github.com/typst/typst?tab=readme-ov-file#installation)
2. Clone this template repo: `git clone git@github.com:leonheuer/nak-typst-template.git`
3. `cd nak-typst-template`
4. Watch source file: `typst watch src/main.typ` -> Changes in the file will be automatically recompiled
5. Open the `src/main.pdf` file to see the result PDF, which will be overwritten on change

### Alternative: Create your own repo

This is a GitHub template, which means you can create your Repo based on this repository without forking it. After creating your repo, clone it and proceed with the steps as described.

## Writing your Transfer Paper

The core of this template is the `main.typ` file. Here you can:
- Fill the data for the cover template
- Add new abbreviations
- Add formatting and page setup
- Most importantly, add your content

Reusable code should be extracted into components inside the `components` directory. Define your components as functions that you call in the main file. This template comes with a few basic components:
- Acronym: a modified version of the [Acrostiche](https://typst.app/universe/package/acrostiche/) extension. Mainly changes the output format to a more beautifully styled table.
- Code: for importing code from a file and formatting it as a block with syntax highlighting
- Cover: designed to resemble the original cover template for Nordakademie transfer papers
- Outline: functions for printing outlines such as List of Tables, Table of Contents etc. that apply some basic formatting
- Tables: some styled table functions that I developed while writing my own transfer papers

Add any images, code source files or other kinds of resources that you want to include in your transfer paper, in the `res` directory.

The bibliography file also lies in the `res` directory and uses the [BibTeX](https://www.bibtex.com/g/bibtex-format/) format. You might know it when coming from LaTeX, and you can use your current setup (e.g. export via Zotero) or copy your existing bibliography when switching from LaTeX.

**Everything else can be done by using Typst built-in features. Additional formatting or tutorials can be found in the [Typst Docs](https://typst.app/docs/).**

## Contributing

If you have suggestions or issues, please open an **Issue** on GitHub. If you want to contribute, please fork this repo and create a **Pull Request**.
