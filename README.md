# 🎓 NAK Typst Template
This is a template for Nordakademie transfer papers written in the markup-based typesetting system [Typst](https://github.com/typst/typst). Typst is an alternative to LaTeX with a range of advantages such as faster compile times, a comprehensive scripting system similar to languages like JavaScript and user-friendly error messages.

The template is designed for English transfer papers, but can be modified for use with German. The format closely resembles the other official Nordakademie templates.

⭐️ _If you enjoy using this template, consider giving it a star on GitHub and share it with your classmates!_

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
- Include content pages from the `pages` directory

More complex components are extracted into modules in the `components` directory.

Add any images, code source files or other kinds of resources that you want to include in your transfer paper, in the `res` directory.

The bibliography file also lies in the `res` directory and uses the [BibTeX](https://www.bibtex.com/g/bibtex-format/) format. You might know it when coming from LaTeX, and you can use your current setup or copy your existing bibliography when switching from LaTeX.

**Everything else can be done by using Typst built-in features. Additional formatting or tutorials can be found in the [Typst Docs](https://typst.app/docs/).**

## Contributing

If you have suggestions or issues, please open an **Issue** on GitHub. If you want to contribute, please fork this repo and create a **Pull Request**.
