# LaTeX Independent Study Template
LaTeX files for Independent Study at The College of Wooster

## Info
This project aims to provide you with a template for typesetting your IS using LaTeX. Students should read the exampleis_manual.pdf document before writing as the manual explains how to use this template and all the custom options available in the woosterthesis class.

## Dependencies
The woosterthesis class loads several packages by default and several others through class options; it is assumed you have these installed on your system. These include the following:
alltt | amsfonts | amsmath | amssymb | amsthm | babel | biblatex 
------|----------|---------|---------|--------|-------|-------
biblatex-chicago | caption | csquotes | eso-pic | eucal | eufrak | fancyhdr 
float | floatfl| fontenc | fontspec | geometry | graphicx | hyperref
ifpdf | ifthen | ifxetex | inputenc | lettrine | listings | lmodern 
makeidx | maple2e | microtype | pdftex | polyglossia | pxfonts | setspace 
subfig | textpos | TikZ | verbatim | wrapfig | xcolor | xltxtra
xunicode

Installing these dependencies can be done by doing a full install of LaTeX through your package manager of choice, or by utilizing a cloud service such as Overleaf. The woosterthesis class also assumes you are using pdfTeX (support for postscript based TeX has been dropped as of 2006/17/11).

## Usage
The template has been tested with Overleaf, as well as TeXLive installs on OS X and Windows 11. Some students have reported receiving processing time warnings from Overleaf and a request to move to a paid subscription, for that reason I recommend using a locally installed TeX instance instead of a cloud-based one.

Located in this repo are two separate projects: `Complete` generates the manual itself containing several examples. `Minimal` is a scaled-down version of this template that contains the same structure.
