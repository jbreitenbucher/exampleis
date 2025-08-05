# LaTeX Independent Study Template
LaTeX files for Independent Study at The College of Wooster

## Quick Start
1. Open `main.tex`
    * Comment the \documentclass declaration on line 25 and uncomment the declaration on line 34 and adjust the options to use what you need for your IS (see `exampleis_manual.pdf` for the available options)
    * Edit the information around the \title declaration on line 97
    * Edit the abstract on line 145
    * Edit the dedication on line 154
    * Edit the acknowledgements on line 164
    * If you do not have publications then comment out lines 202 through 205
    * Comment out line 235 if you do not have a Preface
2. Chapters are stored in the `chapters` folder
    * Edit the contents of the `chapters/introduction.tex` and other chapters to have your IS text
    * If you have more than three chapters just make a new file called chapter#.tex and put %!TEX root = ../main.tex (line 1) \chapter{your chapter title}\label{yourchapterlabel} (line 2) as the first and second line of the file
        - Uncomment lines 256 through 260 in `main.tex` as needed
    * The Introduction is labeled as Chapter 1 in the IS
3. Images are stored in the `figures` folder
    * The allowed file types are JPEG, PNG, TIFF, and PDF
    * Use the command \woopic{picturename}{scalingfactor} to include your picture
        - File names cannot have spaces in them and the scaling factor must be between 0 and 1
        - See Chapter 3 in the `exampleis_manual.pdf` for examples of including figures
4. Appendicies are stored in the `appendicies` folder
    * Comment out lines 271 through 275 of `main.tex` if you do not have any appendicies otherwise edit the appendix title after the / to be the title of your appendix document
5. Source code to be included in the IS is stored in the `source` folder
    * Source code can be included using \lstinputlisting[caption=caption text, label=labeltext]{source/filename}
    * See Chapter 2 of `exampleis_manual.pdf` and `appendicies/cpp.tex` or `appendicies/java.tex` files for examples of including code in an IS
6. References are in the `references.bib` file
    * Edit this file to have your references
7. Run pdfLaTeX (or XeLaTeX), MakeIndex (if doing an Index), Biber (to process references), pdfLaTeX (or XeLaTeX), pdfLaTeX (or XeLaTeX) to typeset your document and produce a formatted PDF version.
8. If it does not compile, then check the **Cosole output** to see what error is preventing the compilation, correct it, and try the sequence above again.

## Info
This project aims to provide you with a template for typesetting your IS using LaTeX. LaTeX is very similar to HTML in the sense that it is a markup language. Instead of worrying about the formatting of elements, the `woosterthesis` class takes care of several elements so that students only need to identify the structure of their IS. Students should read the `exampleis_manual.pdf` document before writing, as the manual explains how to use all the custom options available, with particular attention paid to the Introduction.

## Dependencies
The `woosterthesis` class loads several packages by default and several others through class options; it is assumed you have these installed on your system. These include the following:
&nbsp;           | &nbsp;   | &nbsp;   | &nbsp;    | &nbsp;   | &nbsp;      | &nbsp;  
---------------- | -------- | -------- | --------- | -------- | ----------- | --------
alltt            | amsfonts | amsmath  | amssymb   | amsthm   | babel       | biblatex
biblatex-chicago | caption  | csquotes | eso-pic   | eucal    | eufrak      | fancyhdr
float            | floatfl  | fontenc  | fontspec  | geometry | graphicx    | hyperref
ifpdf            | ifthen   | ifxetex  | inputenc  | lettrine | listings    | lmodern 
makeidx          | maple2e  | mathpazo | microtype | pdftex   | polyglossia | setspace
subfig           | textpos  | TikZ     | verbatim  | wrapfig  | xcolor      | xltxtra 
xunicode    

The `woosterthesis` class also assumes you are using pdfTeX or XeTeX (support for postscript based TeX has been dropped as of 2006/17/11).

## Usage
The template has been tested with Overleaf, as well as TeXLive installs on OS X and Windows 11. Some students have reported receiving processing time warnings from Overleaf and a request to move to a paid subscription, for that reason I recommend using a locally installed TeX instance instead of a cloud-based one.

The class does support the use of system fonts such as Times New Roman through the XeLaTeX engine. The definitions of fonts for XeLaTeX can be found in the `styles/packages.tex`. The defaults are for a Times New Roman consistent set but suggestions of other cross platform font options are listed in comments.
