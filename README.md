# LaTeX Independent Study Template
LaTeX files for Independent Study at The College of Wooster

## Info
This project aims to provide you with a template for typesetting your IS using LaTeX. LaTeX is very similar to HTML in the sense that it is a markup language. Instead of worrying about the formatting of elements, the `woosterthesis` class takes care of several elements so that students only need to identify the structure of their IS. Students should read `exampleis_manual.pdf` document before writing, as the manual explains how to use all the custom options available, with particular attention to the Introduction.

## Dependencies
The `woosterthesis` class loads several packages by default and several others through class options; it is assumed you have these installed on your system. These include the following:
alltt | amsfonts | amsmath | amssymb | amsthm | babel | biblatex
:------:|:----------:|:---------:|:---------:|:--------:|:-------:|:-------:
biblatex-chicago | caption | csquotes | eso-pic | eucal | eufrak | fancyhdr
float | floatfl| fontenc | fontspec | geometry | graphicx | hyperref
ifpdf | ifthen | ifxetex | inputenc | lettrine | listings | lmodern
makeidx | maple2e | microtype | pdftex | polyglossia | pxfonts | setspace
subfig | textpos | TikZ | verbatim | wrapfig | xcolor | xltxtra
xunicode

The `woosterthesis` class also assumes you are using pdfTeX (support for postscript based TeX has been dropped as of 2006/17/11).

## Usage
The template has been tested with Overleaf, as well as TeXLive installs on OS X and Windows 11. Some students have reported receiving processing time warnings from Overleaf and a request to move to a paid subscription, for that reason I recommend using a locally installed TeX instance instead of a cloud-based one.
