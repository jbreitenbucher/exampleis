 %%
%% This is file `woosterthesis.cls',
%% a modification of the book class
%% by Dr. Jon Breitenbucher. It is
%% intended to serve as a template for
%% seniors doing IS at The College of
%% Wooster.
%% 
%% This file was created on 2004/03/20.
%% --------------------------------------------------------------
%% 
%% It may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.2
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%    http://www.latex-project.org/lppl.txt
%% and version 1.2 or later is part of all distributions of LaTeX
%% version 1999/12/01 or later.
%% 
%% The list of all files belonging to the LaTeX base distribution is
%% given in the file `manifest.txt'. See also `legal.txt' for additional
%% information.
%% 
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{woosterthesis}
              [2006/11/03 v4.2.1
 Wooster IS LaTeX document class by Dr. Jon Breitenbucher]% - JB
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagetrue
\newif\if@openright
\newif\if@mainmatter \@mainmattertrue
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{10pt}{\renewcommand\@ptsize{0}}
\DeclareOption{11pt}{\renewcommand\@ptsize{1}}
\DeclareOption{12pt}{\renewcommand\@ptsize{2}}
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% the abstractonly option to allow one to print just the abstract - JB
\newif\if@bstractonly
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@abstract\t@st\@bstractonlytrue\else\@bstractonlyfalse\fi
\DeclareOption{abstractonly}{\@bstractonlytrue}
% the kaukecopyright option to insert an Kauke word mark on the copyright page - JB
\newif\if@kaukecopy
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@kaukecopyright\t@st\@kaukecopytrue\else\@kaukecopyfalse\fi
\DeclareOption{kaukecopyright}{\@kaukecopytrue}
% the woostercopyright option to insert an Wooster word mark on the copyright page - JB
\newif\if@woostercopy
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@woostercopyright\t@st\@woostercopytrue\else\@woostercopyfalse\fi
\DeclareOption{woostercopyright}{\@woostercopytrue}
% the wblack option to insert a black W in the background of the cover instead of Kauke - JB
\newif\if@wblack
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@wblack\t@st\@wblacktrue\else\@wblackfalse\fi
\DeclareOption{wblack}{\@wblacktrue}
%the palatino option typesets the thesis in Palatino, the College font.- JB
\newif\if@palatino
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@palatino\t@st\@palatinotrue\else\@palatinofalse\fi
\DeclareOption{palatino}{\@palatinotrue}
%the picins option loads the wrapfig package.- JB
\newif\if@picins
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@picins\t@st\@picinstrue\else\@picinsfalse\fi
\DeclareOption{picins}{\@picinstrue}
% option to produce a hyperlinked thesis for on-line viewing - JB
\newif\if@blacklinks
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@blacklinks\t@st\@blacklinkstrue\else\@blacklinksfalse\fi
\DeclareOption{blacklinks}{\@blacklinkstrue}
% option to use listings package for code listings - JB
\newif\if@code
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@code\t@st\@codetrue\else\@codefalse\fi
\DeclareOption{code}{\@codetrue}
% option to use maple2e package for including Maple worksheets - JB
\newif\if@maple
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@maple\t@st\@mapletrue\else\@maplefalse\fi
\DeclareOption{maple}{\@mapletrue}
% option to have an index - JB
\newif\if@index
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@index\t@st\@indextrue\else\@indexfalse\fi
\DeclareOption{index}{\@indextrue}
% option to use verbatim package - JB
\newif\if@verbatim
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@verbatim\t@st\@verbatimtrue\else\@verbatimfalse\fi
\DeclareOption{verbatim}{\@verbatimtrue}
% option to use lettrine package for dropped caps - JB
\newif\if@dropcaps
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@dropcaps\t@st\@dropcapstrue\else\@dropcapsfalse\fi
\DeclareOption{dropcaps}{\@dropcapstrue}
% option to use woofncychap package for styled chapter headings - JB
\newif\if@euler
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@euler\t@st\@eulertrue\else\@eulerfalse\fi
\DeclareOption{euler}{\@eulertrue}
% option to use woofncychap package for styled chapter headings - JB
\newif\if@gauss
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@gauss\t@st\@gausstrue\else\@gaussfalse\fi
\DeclareOption{gauss}{\@gausstrue}
% option to use alltt package - JB
\newif\if@alltt
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@alltt\t@st\@alltttrue\else\@allttfalse\fi
\DeclareOption{alltt}{\@alltttrue}
% option to use woolshort package a modification of lshort - JB
\newif\if@woolshort
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@woolshort\t@st\@woolshorttrue\else\@woolshortfalse\fi
\DeclareOption{woolshort}{\@woolshorttrue}
% option to include a colophon- JB
\newif\if@colophon
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@colophon\t@st\@colophontrue\else\@colophonfalse\fi
\DeclareOption{colophon}{\@colophontrue}
% option to use the Chicago citation and reference style added for Ian Sharp
\newif\if@woosterchicago
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@woosterchicago\t@st\@woosterchicagotrue\else\@woosterchicagofalse\fi
\DeclareOption{woosterchicago}{\@woosterchicagotrue}
% option to use the American Chemical Society citation and reference style added for Norman Chamusah
\newif\if@chemso
\expandafter\def\csname test@\jobname\endcsname{test}%
\def\t@st{test}%
\ifx\test@chemso\t@st\@chemsotrue\else\@chemsofalse\fi
\DeclareOption{achemso}{\@chemsotrue}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ExecuteOptions{letterpaper,12pt,oneside,onecolumn,final,openany}% - JB
\ProcessOptions

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% packages that are loaded for the convenience of the student - JB
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ifpdf}% to check if pdfTeX is being used - JB
\RequirePackage{ifxetex}% to check if XeTeX is being used -JB
\RequirePackage{textpos}% to position text on cover - JB
\RequirePackage{amsthm}% to style theorems - JB
\RequirePackage{amssymb}% to obtain special mathematical symbols - JB
\RequirePackage{amsmath}% to obtain special math related commands - JB
\RequirePackage{setspace}% to allow single and double spacing - JB
\RequirePackage{fancyhdr}% to have fancy chapter headings - JB
\ifxetex
	\RequirePackage{fontspec}% allows one to easily set up fonts in the document
	\RequirePackage{xunicode}
	\RequirePackage{xltxtra}% adds extra commands specific to XeTeX
	%\RequirePackage[xetex]{graphicx}
		\def\kaukelogo{\includegraphics[scale=.4]{kauke_wordmark}}
		\def\woosterlogo{\includegraphics[scale=.4]{wooster_stacked_black}}
		\RequirePackage{eso-pic}
		\if@wblack
		\newcommand\BackgroundPicture{%
			\put(-3,-5){%
				\parbox[b][\paperheight]{\paperwidth}{%       
					\vfill
					\centering
					\includegraphics[width=\paperwidth,height=\paperheight,%
						keepaspectratio]{W_black}%
					\vfill
					}}}
		\else
			\newcommand\BackgroundPicture{%
   				\put(-3,-5){%
     				\parbox[b][\paperheight]{\paperwidth}{%       
       				\vfill
       				\centering
       				\includegraphics[width=\paperwidth,height=\paperheight,%
                        keepaspectratio]{kauke_arch_gray}%
       				\vfill
     			}}}
		\fi
\else % alter class behavior based on version of TeX - JB
			\RequirePackage[pdftex]{graphicx}
			\def\kaukelogo{\includegraphics[scale=.4]{kauke_wordmark}}
			\def\woosterlogo{\includegraphics[scale=.4]{wooster_stacked_black}}
			\RequirePackage{eso-pic}
			\if@wblack
				\newcommand\BackgroundPicture{%
					\put(-3,-5){%
						\parbox[b][\paperheight]{\paperwidth}{%       
							\vfill
							\centering
							\includegraphics[width=\paperwidth,height=\paperheight,%
						keepaspectratio]{W_black}%
							\vfill
						}}}
			\else
				\newcommand\BackgroundPicture{%
					\put(-3,-5){%
						\parbox[b][\paperheight]{\paperwidth}{%       
							\vfill
							\centering
							\includegraphics[width=\paperwidth,height=\paperheight,%
								keepaspectratio]{kauke_arch_gray}%
							\vfill
				}}}
			\fi
\fi

% Kyle Kindbom requested a theorem style where the theorem header was on a separate line.
% The break theorem style will put a line break after the theorem header. - JB
\newtheoremstyle{break}% name
  {\topsep}%	Space above
  {\topsep}%	Space below
  {\itshape}%	Body font
  {}%			Indent amount (empty = no indent, \parindent = para indent)
  {\bfseries}%	Thm head font
  {.}%			Punctuation after thm head
  {\newline}%	Space after thm head: " " = normal interword space;
        %		\newline = linebreak
  {}%			Thm head spec (can be left empty, meaning `normal')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\input{woo1\@ptsize.clo}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand\baselinestretch{}
\setlength\parskip{0\p@ \@plus \p@}

% prohibit widows and page-breaking after a hyphenated line: - JB

\widowpenalty 100000
\displaywidowpenalty 5000
\brokenpenalty 100000
\RequirePackage[letterpaper,marginparwidth=.6in,hmargin={1.5in,1in},top=1in,bottom=1in]{geometry}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\renewcommand\topfraction{.7}
\setcounter{bottomnumber}{1}
\renewcommand\bottomfraction{.3}
\setcounter{totalnumber}{3}
\renewcommand\textfraction{.2}
\renewcommand\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\renewcommand\dbltopfraction{.7}
\renewcommand\dblfloatpagefraction{.5}

% placing of floats with the text: - JB

\renewcommand{\topfraction}{.7}
\renewcommand{\textfraction}{.2}
\renewcommand{\bottomfraction}{.7}

\setlength\textfloatsep{11 pt plus 11 pt minus 3 pt}
\setlength\floatsep{9 pt plus 9 pt minus 3 pt}
\setlength\intextsep{11 pt plus 11 pt minus 3 pt}

\if@twoside
  \def\ps@headings{%
      \let\@oddfoot\@empty\let\@evenfoot\@empty
      \def\@evenhead{\thepage\hfil\slshape\leftmark}%
      \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
      \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markboth {{% removed MakeUpperCase - JB
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \thechapter. \ % removed \@chapapp - JB
          \fi
        \fi
        ##1}}{}}%
    \def\sectionmark##1{%
      \markright {{% removed MakeUpperCase - JB
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}}}
\else
  \def\ps@headings{%
    \let\@oddfoot\@empty
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\chaptermark##1{%
      \markright {{% removed MakeUpperCase - JB
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \thechapter. \ % removed \@chapapp - JB
          \fi
        \fi
        ##1}}}}
\fi
\def\ps@myheadings{%
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
   \let\@authordegrees\relax
\let\@school\relax
\let\@program\relax
\def\d@greetoobtain{Bachelor of Arts}
\newcommand{\presentdegrees}[1]{\def\@authordegrees{, #1}}
\newcommand{\degreetoobtain}[1]{\def\d@greetoobtain{#1 }}
\newcommand{\presentschool}[1]{\def\@school{#1}}
\newcommand{\academicprogram}[1]{\def\@program{#1}}
\academicprogram{\relax}
\newcommand{\advisor}[1]{\def\@dvisor{#1}}
\let\@dvisor\relax % :-)
\let\advisorname\advisor % for compatibility
\def\second@dvisor{}
\newcommand{\secondadvisor}[1]{%
      \def\\{\noexpand\\}%
      \global\edef\second@dvisor{\second@dvisor \\ #1}}

\newcommand{\gradyear}[1]{\def\ye@r{#1}}  % graduation year

% copyright - JH

\newcommand{\copyrightdate}[1]{\gdef\@copydate{#1}}
\let\@copydate\@date
  
\newif\if@copyright
\@copyrightfalse
\newcommand{\copyrighted}[1][\@author]{\@copyrighttrue
   \def\@copyright{#1}}
\newcommand{\disscopyright}{%
   \cleardoublepage
   \thispagestyle{empty}   
   ~
   \if@copyright
   \vspace*{\fill}
   \begin{center}
   \begin{singlespace}%
     \copyright\ \ye@r\ by \@copyright
     %\@copydate
\end{singlespace}
   \end{center}
   \vfill   
   \fi  
} 

% kaukecopyright - JB

\if@kaukecopy
    \renewcommand{\copyrighted}[1][\@author]{%
   	\@copyrighttrue%
     	 \def\@copyright{#1}%
	 }
    \renewcommand{\disscopyright}{%
     	 \cleardoublepage%
      	 \thispagestyle{empty}%
      	 ~%
      	\if@copyright%
          	\vspace*{\fill}%
				\begin{center}%
                \kaukelogo%
   				\begin{singlespace}%
     					\copyright\ \ye@r\ by \@copyright
     					%\@copydate%
			     \end{singlespace}%
            		\end{center}%                      
          \vfill
   		\fi
    	}
\fi

% woostercopyright - JB

\if@woostercopy
\renewcommand{\copyrighted}[1][\@author]{%
	\@copyrighttrue%
	\def\@copyright{#1}%
}
\renewcommand{\disscopyright}{%
	\cleardoublepage%
	\thispagestyle{empty}%
	~%
	\if@copyright%
	\vspace*{\fill}%
	\begin{center}%
		\woosterlogo%
		\begin{singlespace}%
			\copyright\ \ye@r\ by \@copyright
			%\@copydate%
		\end{singlespace}%
	\end{center}%                      
	\vfill
	\fi
}
\fi

% a series of title page definitions one for each supported class point size - JB

 \ifnum\@ptsize=0  % 10 pt
  \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%

% The Kauke arch is centered on the page background - JB

\AddToShipoutPicture*{\BackgroundPicture}
\let\footnoterule\relax
{\def\\{\noexpand\\}
\global\gdef\@titl@{{\@title}}}%
{
\begin{textblock}{6}(2.20,-.42)
\begin{singlespace}
\begin{center}
{\scshape\Large\@titl@}
\end{center}
\end{singlespace}%
\end{textblock}}
\begin{textblock}{6}(2.20,2.75)
\begin{center}
{\scshape
  \th@sistype}
\end{center}
\end{textblock}  
\begin{textblock}{7}(1.65,5.15)
\begin{singlespace}
\begin{center}
Presented in Partial Fulfillment of the Requirements for \\
the Degree \d@greetoobtain in the \\
 \@program\ at \@school
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,7.8)
\begin{singlespace}
\begin{center}
by \\
\@author \@authordegrees\\
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,8.8)
{\def\baselinestretch{1}\normalsize
\begin{center}
\@school\\
\ye@r
\end{center}}%
\end{textblock}
\begin{textblock}{6}(0,11)
\noindent
\hspace{1px}
\begin{minipage}[b]{\hsize}
\begin{flushleft}
{\bfseries Advised by:} \\
\@dvisor
\second@dvisor
\end{flushleft}
\end{minipage}%
\par
  \@thanks
\end{textblock}
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\def\@maketitle{%
  \newpage
  \null

% The Kauke arch is centered on the page background - JB

\AddToShipoutPicture*{\BackgroundPicture}
\let\footnoterule\relax
{\def\\{\noexpand\\}
\global\gdef\@titl@{{\@title}}}%
{
\begin{textblock}{6}(2.20,-.42)
\begin{singlespace}
\begin{center}
{\scshape\Large\@titl@}
\end{center}
\end{singlespace}}%
\end{textblock}
\begin{textblock}{6}(2.20,2.75)
\begin{center}
{\scshape
  \th@sistype}
\end{center}
\end{textblock}  
\begin{textblock}{7}(1.65,5.15)
\begin{singlespace}
\begin{center}
Presented in Partial Fulfillment of the Requirements for \\
the Degree \d@greetoobtain in the \\
 \@program\ at \@school
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,7.8)
\begin{singlespace}
\begin{center}
by \\
\@author \@authordegrees\\
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,8.8)
{\def\baselinestretch{1}\normalsize
\begin{center}
\@school\\
\ye@r
\end{center}}%
\end{textblock}
\begin{textblock}{6}(0,11)
\noindent
\begin{minipage}[b]{\hsize}
\begin{flushleft}
{\bfseries Advised by:} \\
\@dvisor
\second@dvisor
\end{flushleft}
\end{minipage}%
\par
  \@thanks
\end{textblock}
}
\fi
\else\ifnum\@ptsize=1 % 11 pt
 \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%

% The Kauke arch is centered on the page background - JB

\AddToShipoutPicture*{\BackgroundPicture}
\let\footnoterule\relax
{\def\\{\noexpand\\}
\global\gdef\@titl@{{\@title}}}%
{
\begin{textblock}{6}(2.20,-.55)
\begin{singlespace}
\begin{center}
{\scshape\Large\@titl@}
\end{center}
\end{singlespace}%
\end{textblock}}
\begin{textblock}{6}(2.20,2.65)
\begin{center}
{\scshape
  \th@sistype}
\end{center}
\end{textblock}  
\begin{textblock}{7}(1.65,4.97)
\begin{singlespace}
\begin{center}
Presented in Partial Fulfillment of the Requirements for \\
the Degree \d@greetoobtain in the \\
 \@program\ at \@school
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,7.67)
\begin{singlespace}
\begin{center}
by \\
\@author \@authordegrees\\
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,8.70)
{\def\baselinestretch{1}\normalsize
\begin{center}
\@school\\
\ye@r
\end{center}}%
\end{textblock}
\begin{textblock}{6}(0,11)
\noindent
\hspace{1px}
\begin{minipage}[b]{\hsize}
\begin{flushleft}
{\bfseries Advised by:} \\
\@dvisor
\second@dvisor
\end{flushleft}
\end{minipage}%
\par
  \@thanks
\end{textblock}
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\def\@maketitle{%
  \newpage
  \null

% The Kauke arch is centered on the page background - JB

\AddToShipoutPicture*{\BackgroundPicture}
\let\footnoterule\relax
{\def\\{\noexpand\\}
\global\gdef\@titl@{{\@title}}}%
{
\begin{textblock}{6}(2.20,-.55)
\begin{singlespace}
\begin{center}
{\scshape\Large\@titl@}
\end{center}
\end{singlespace}}%
\end{textblock}
\begin{textblock}{6}(2.20,2.65)
\begin{center}
{\scshape
  \th@sistype}
\end{center}
\end{textblock}  
\begin{textblock}{7}(1.65,4.97)
\begin{singlespace}
\begin{center}
Presented in Partial Fulfillment of the Requirements for \\
the Degree \d@greetoobtain in the \\
 \@program\ at \@school
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,7.67)
\begin{singlespace}
\begin{center}
by \\
\@author \@authordegrees\\
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,8.70)
{\def\baselinestretch{1}\normalsize
\begin{center}
\@school\\
\ye@r
\end{center}}%
\end{textblock}
\begin{textblock}{6}(0,11)
\noindent
\begin{minipage}[b]{\hsize}
\begin{flushleft}
{\bfseries Advised by:} \\
\@dvisor
\second@dvisor
\end{flushleft}
\end{minipage}%
\par
  \@thanks
\end{textblock}
}
\fi
\else\ifnum\@ptsize>1 % 12 pt or greater
 \if@titlepage
  \newcommand\maketitle{\begin{titlepage}%

% The Kauke arch is centered on the page background - JB

\AddToShipoutPicture*{\BackgroundPicture}
\let\footnoterule\relax
{\def\\{\noexpand\\}
\global\gdef\@titl@{{\@title}}}%
{
\begin{textblock}{6}(2.20,-.65)
\begin{singlespace}
\begin{center}
{\scshape\Large\@titl@}
\end{center}
\end{singlespace}%
\end{textblock}}
\begin{textblock}{6}(2.20,2.6)
\begin{center}
{\scshape
  \th@sistype}
\end{center}
\end{textblock}  
\begin{textblock}{8}(1.25,4.9)
\begin{singlespace}
\begin{center}
Presented in Partial Fulfillment of the Requirements for \\
the Degree \d@greetoobtain in the \\
 \@program\ at \@school
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,7.59)
\begin{singlespace}
\begin{center}
by \\
\@author \@authordegrees\\
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,8.7)
{\def\baselinestretch{1}\normalsize
\begin{center}
\@school\\
\ye@r
\end{center}}%
\end{textblock}
\begin{textblock}{6}(0,11)
\noindent
\hspace{1px}
\begin{minipage}[b]{\hsize}
\begin{flushleft}
{\bfseries Advised by:} \\
\@dvisor
\second@dvisor
\end{flushleft}
\end{minipage}%
\par
  \@thanks
\end{textblock}
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\def\@maketitle{%
  \newpage
  \null

% The Kauke arch is centered on the page background - JB

\AddToShipoutPicture*{\BackgroundPicture}
\let\footnoterule\relax
{\def\\{\noexpand\\}
\global\gdef\@titl@{{\@title}}}%
{
\begin{textblock}{6}(2.20,-.65)
\begin{singlespace}
\begin{center}
{\scshape\Large\@titl@}
\end{center}
\end{singlespace}}%
\end{textblock}
\begin{textblock}{6}(2.20,2.6)
\begin{center}
{\scshape
  \th@sistype}
\end{center}
\end{textblock}  
\begin{textblock}{8}(1.25,4.9)
\begin{singlespace}
\begin{center}
Presented in Partial Fulfillment of the Requirements for \\
the Degree \d@greetoobtain in the \\
 \@program\ at \@school
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,7.59)
\begin{singlespace}
\begin{center}
by \\
\@author \@authordegrees\\
\end{center}
\end{singlespace}
\end{textblock}
\begin{textblock}{6}(2.20,8.7)
{\def\baselinestretch{1}\normalsize
\begin{center}
\@school\\
\ye@r
\end{center}}%
\end{textblock}
\begin{textblock}{6}(0,11)
\noindent
\begin{minipage}[b]{\hsize}
\begin{flushleft}
{\bfseries Advised by:} \\
\@dvisor
\second@dvisor
\end{flushleft}
\end{minipage}%
\par
  \@thanks
\end{textblock}
}
\fi
\fi
\fi
\fi

% bug causing wrong page numbering in table of contents fixed [1997/12/04]   
% (reported by Karen Gibbs) - JH

\newcommand{\dedication}[1]{%
  \cleardoublepage
  \chapter*{}
  \addcontentsline{toc}{chapter}{\dedname}%
  \thispagestyle{plain}%
  \vspace*{\fill}
  \begin{center}
    #1
  \end{center}
  \vfill
  \newpage
  }

% Abstract - JH

\newenvironment{abstract}{%
  \if@bstractonly
  \cleardoublepage  
  \setcounter{page}{1}%
  \pagenumbering{arabic}%
  \pagestyle{plain}  
  \chapter*{\@title}%
  \begin{singlespace}
  \begin{center}
    by\\
    \@author\ \d@greetoobtain\\
    The College of Wooster, \ye@r\\
    \@dvisor
  \end{center}
  \end{singlespace}
  \vspace{\baselineskip}
  \else  
  \chapter*{\abstractname}%
  \addcontentsline{toc}{chapter}{\abstractname}%
  \fi  
  }{%
  \global\let\@end@bstract\relax
  \if@bstractonly
  \global\let\@end@bstract\enddocument
  \def\@currenvir{document}% nasty trick!
  \fi\@end@bstract}

% Acknowlwdgements - JH

\newenvironment{acknowl}{%
\chapter*{\ackname}%
\addcontentsline{toc}{chapter}{\ackname}%
}
      {}

% Colophon - JB
      
\newenvironment{colophon}{%
\chapter*{\colophonname}%
\addcontentsline{toc}{chapter}{\colophonname}%
\begin{singlespace}
\begin{quote}
\small
}
        {\end{quote}\end{singlespace}}

% Vita - JH

\newenvironment{vita}{%
\chapter*{\vitaname}%
\addcontentsline{toc}{chapter}{\vitaname}%
\begingroup\def\baselinestretch{1}%
\normalsize}%
        {\endgroup}

\newenvironment{datelist}{%
\begin{list}{}{%
\setlength\topsep\baselineskip
\setlength\partopsep{0pt}%
\setlength\itemsep\baselineskip
\setlength\rightmargin{0pt}%
\setlength\labelwidth{.5 \hsize}%
            \addtolength\labelwidth{-\labelsep}%
            \setlength\leftmargin{\hsize}%
\addtolength\leftmargin{-\labelwidth}%
\renewcommand\makelabel[1]{\noindent ##1 \dotfill~}}%
}{\end{list}}

% \dateitem provided for compatibility with the preceding versions. Its use
% is deprecated. Use \begin{datelist} \item[1997] blah blah blah .... instead. - JH

\newcommand{\dateitem}[2]{\noindent #1 \dotfill \parbox[t]{.5 \hsize}{#2}%
       \vskip\baselineskip}  
  
\newenvironment{publist}{%
        \vskip .2 \vsize
        \penalty -1000%
        \vskip -.2 \vsize
        \vspace{10 pt}%
\begin{center}
\pubname%
}%
{\end{center}\vskip\baselineskip}

\newcommand{\pubitem}[1]{\noindent #1 \vskip\baselineskip}

\newenvironment{fieldsstudy}{%
        \vskip .3 \vsize
        \penalty -1000%
        \vskip -.3 \vsize
        \vspace{10 pt}%
\begin{center}
\fosname%
}%
{\end{center}\vskip\baselineskip}

\newcommand{\majorfield}[1]{\noindent \majorfieldname: #1 \vskip\baselineskip}
\newcommand{\minorfield}[1]{\noindent \minorfieldname: #1 \vskip\baselineskip}
\newcommand{\specialization}[1]{\noindent \specializationname: #1
  \vskip\baselineskip}
\newcommand{\onestudy}[2]{\noindent\studinname #1: #2}


\newenvironment{studieslist}{%
        \gdef\studn@me{\studinname:\let\studn@me\relax}%
        \noindent\begin{tabular}{@{\protect\studn@me }l l l}}{\end{tabular}}

\newcommand{\studyitem}[2]{\global\let\studn@me\relax & #1 & #2 \\}

\newcommand*\chaptermark[1]{}
\setcounter{secnumdepth}{2}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {\@arabic\c@chapter}
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand{\@chapapppage}{\relax}
\newif\if@numberedchapters
\newcommand\frontmatter{%
    \cleardoublepage
  \@numberedchaptersfalse
  \@mainmatterfalse
  \pagenumbering{roman}
  \pagestyle{plain}}
\newcommand\mainmatter{%
    \cleardoublepage
  \renewcommand{\@chapapppage}{\pagename}
  \@numberedchapterstrue
  \@mainmattertrue
  \pagenumbering{arabic}
  \pagestyle{headings}}
\newcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@numberedchapterstrue
  \@mainmattertrue
  \appendix
  \pagestyle{headings}}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\newcommand{\titlefont}{\fontshape{sc}}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge \partname\nobreakspace\thepart% removed \bfseries - JB
       \par
       \vskip 20\p@
     \fi
     \Huge #2\par}% removed \bfseries - JB
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge #1\par}% removed \bfseries - JB
    \@endpart}
\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}
\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \if@numberedchapters % added - JB
                         	{\let\Roman\roman
                          	\edef\@tmpmsg{\noexpand\typeout{%
                          	\noexpand\@chapapp\space\thechapter.}}%
                          	\uppercase\expandafter{\@tmpmsg}}%
                          	\ifnum\value{chapter}=1%
                         		\edef\@tmptoc{\noexpand\addtocontents{toc}{%
                          		\noexpand\@tocheadline{\@chapapp}{\@chapapppage}}}
                          		\@tmptoc
                          	\fi
                         % removed \typeout{\@chapapp\space\thechapter.} - JB
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#1}%
                       	 \else
                         	\addcontentsline{toc}{chapter}{#1}%
                       	 \fi
                       \fi
                    \else
                      	 \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \addtocontents{lol}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                    \fi}
\def\@makechapterhead#1{% - JB
  \vspace*{50\p@}%
{\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        {\small\textsl \@chapapp\space {\fontsize{20}{22}\selectfont$\mathit{\thechapter}$}} % removed \bfseries - JB
        \par\nobreak
        \vskip 10\p@ % 20 -> 10 - JB
      \fi
    \fi
    \interlinepenalty\@M
   \fontshape{sc}\fontsize{20}{22}\selectfont #1\par\nobreak % \Huge -> \scshape\LARGE removed \bfseries - JB
    \vskip 30\p@
	\noindent
  }}
\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}
\def\@makeschapterhead#1{%
\if@twocolumn
  \vspace*{83\p@}
\else  
  \vspace*{50\p@}%
\fi  
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \fontshape{sc}\fontsize{20}{22}\selectfont  #1\par\nobreak% \Huge -> LARGE removed \bfseries - JB
    \vskip 30\p@
  }}

% do not indent first paragraph of section by default - JB

\def\@startsection#1#2#3#4#5#6{\if@noskipsec \leavevmode \fi
   \par \@tempskipa #4\relax
   \@afterindentfalse
   \ifdim \@tempskipa <\z@ \@tempskipa -\@tempskipa \relax\fi
   \if@nobreak \everypar{}\else
     \addpenalty{\@secpenalty}\addvspace{\@tempskipa}\fi\@ifstar
     {\@ssect{#3}{#4}{#5}{#6}}{\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}}}

% removed all the \bfseries from the section heading --- who wants
% all that stuff bold?!? Added \scshape - JB 
  
\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\scshape\Large}}
\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\scshape\large}}
\newcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\scshape\normalsize}}
\newcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\normalsize\scshape\bfseries}}
\newcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\normalsize\bfseries}}
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.5em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}
\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}
\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}
\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}
\newenvironment{titlepage}
    {%
      \cleardoublepage
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\newcounter{figure}[chapter]
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}
\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}
\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\setlength\abovecaptionskip{24pt minus 12pt}
\long\def\@makecaption#1#2{%
\small
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize {\def\baselinestretch{1}\normalsize
    \sbox\@tempboxa{#1: }%
\@setpar{\@@par
\@tempdima = \hsize
\advance\@tempdima-\wd\@tempboxa
\parshape \@ne 1\wd\@tempboxa \@tempdima}%
\par
\parindent 0pt\noindent
\hbox to \z@{\hss #1: }%
        #2\par}%
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.55em}
\newcommand\@tocrmarg{2.55em}
\newcommand\@dotsep{4.5}
\setcounter{tocdepth}{2}
\newcommand{\@tocheadline}[2]{%
\if@nobreak \relax \else \addvspace{.66\baselineskip}\fi
\hbox to \hsize{#1 \hfil #2}%
}
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \contentsname}{\contentsname}}%
    {\def\baselinestretch{1}%
\normalsize
\@starttoc{toc}%
}%
    \if@restonecol\twocolumn\fi
    }%
\newcommand*\l@part[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{-\@highpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \setlength\@tempdima{3em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      {\leavevmode
       \large \bfseries #1\hfil \hb@xt@\@pnumwidth{\hss #2}}\par
       \nobreak
         \global\@nobreaktrue
         \everypar{\global\@nobreakfalse\everypar{}}%
    \endgroup
  \fi}%
\newcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 0.5em \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode % removed \bfseries - JB
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}%
\newcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand*\l@subsection{\@dottedtocline{1}{3.8em}{3.2em}}
\newcommand*\l@subsubsection{\@dottedtocline{1}{7.0em}{4.1em}}
\newcommand*\l@paragraph{\@dottedtocline{1}{10em}{5em}}
\newcommand*\l@subparagraph{\@dottedtocline{1}{12em}{6em}}
\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
     \chapter*{\listfigurename}%
     \@mkboth{\listfigurename}% remove MakeUpperCase - JB
              {\listfigurename}% remove MakeUpperCase - JB
            \addcontentsline{toc}{chapter}{\listfigurename}
            \@tocheadline{Figure}{Page}
    {\def\baselinestretch{1}% single space - JB
    \normalsize
\@starttoc{lof}%
}%
    \if@restonecol\twocolumn\fi
    }
\newcommand*\l@figure{\@dottedtocline{0}{0.5em}{3.2em}}
\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
      \@mkboth{%
          \listtablename}% remove MakeUpperCase - JB
         {\listtablename}% remove MakeUpperCase - JB
         \addcontentsline{toc}{chapter}{\listtablename}
         \@tocheadline{Table}{Page}%
         {\def\baselinestretch{1}% single space - JB
\normalsize
\@starttoc{lot}%
}%
    \if@restonecol\twocolumn\fi
    }
    \let\l@table\l@figure

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Make redefinitions to allow listings package to work with woosterthesis
% Thanks to Adam Anthony for finding the listings package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\if@code
\RequirePackage{listings}
\renewcommand{\lstlistlistingname}{List of Listings}
\renewcommand{\lstlistoflistings}{% - JB
\if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
\chapter*{\lstlistlistingname}%
     \@mkboth{%
          \lstlistlistingname}% remove MakeUpperCase - JB
         {\lstlistlistingname}
         \addcontentsline{toc}{chapter}{\lstlistlistingname}%
\@tocheadline{Listing}{Page}%
{\def\baselinestretch{1}
\normalsize
\@starttoc{lol}%
}
\if@restonecol\twocolumn\fi}
\let\l@lstlisting\l@figure
\fi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \@mkboth{\bibname}{\bibname}% removed \MakeUppercase -JB
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty

% Use natbib.sty for the bibliography and make some modifications by cutting code from natbib and altering it- JB
\RequirePackage{ifthen}% to test boolean conditions - JB
\newboolean{achemso} % for American Chemical Society style
\newboolean{woosterchicago} % for Chicago style
% load natbib with the options used in achemso style and set boolean to true
\if@chemso
\RequirePackage[sort&compress,numbers,super]{natbib}
\setboolean{achemso}{true}
\else % load natbib, set bibliography punctuation for Chicago style and set boolean to true
	\if@woosterchicago
		\RequirePackage{natbib}
		\bibpunct{[}{]}{;}{a}{,}{,}
		\setboolean{woosterchicago}{true}
	\else % load natbib and define the wooster bibliography style
		\RequirePackage{natbib}
		\newcommand\bibstyle@wooster{\bibpunct{[}{]}{,}{n}{}{}%
		     \gdef\NAT@biblabelnum##1{##1.}}
	\fi
\fi

\providecommand\bibsection{}
\@ifundefined{chapter}%
  {\renewcommand\bibsection{\section*{\refname
    \@mkboth{{\refname}}{{\refname}}}}}
  {\@ifundefined{NAT@sectionbib}%
    {\renewcommand\bibsection{\chapter*{\bibname
     \@mkboth{{\bibname}}{{\bibname}}}}}
    {\renewcommand\bibsection{\section*{\bibname
     \ifx\@mkboth\@gobbletwo\else\markright{{\bibname}}\fi}}}}
\@ifclassloaded{amsart}%
  {\renewcommand\bibsection{\section*{\refname}}}{}
\@ifclassloaded{amsbook}%
  {\renewcommand\bibsection{\chapter*{\bibname}}}{}
  \@ifclassloaded{woosterthesis}%
  {\renewcommand\bibsection{\chapter*{\bibname\@mkboth{{\bibname}}{{\bibname}}}}}{}
\@ifundefined{bib@heading}{}{\let\bibsection\bib@heading}
\renewenvironment{thebibliography}[1]{\setlength\baselineskip{1\@ptsize pt\@plus5\p@ \@minus3\p@}\setlength\bibsep{\baselinestretch\baselineskip}%%
 \bibsection\addcontentsline{toc}{chapter}{\bibname}%
 \parindent \z@\bibpreamble\bibfont\list
   {\@biblabel{\arabic{NAT@ctr}}}{\@bibsetup{#1}%
    \setcounter{NAT@ctr}{0}}%
    \ifNAT@openbib
      \renewcommand\newblock{\par}
    \else
      \renewcommand\newblock{\hskip .11em \@plus.33em \@minus.07em}%
    \fi
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax
    \let\citeN\cite \let\shortcite\cite
    \let\citeasnoun\cite
 }{\def\@noitemerr{%
  \PackageWarning{natbib}
     {Empty `thebibliography' environment}}%
  \endlist\vskip-\lastskip}
  
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \columnseprule \z@
                \columnsep 35\p@
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\indexname}% removed \MakeUppercase -JB
                        {\indexname}% removed \MakeUppercase -JB
                \thispagestyle{plain}
                \setlength\baselineskip{1\@ptsize pt}% single space - JB
                \parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
% - JB
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}% reset footnotes on each page - JB
\newcommand\@makefntext[1]{%
    \parindent 1em%
    \noindent
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\renewcommand{\footnotesize}{%
   \def\baselinestretch{1}% to make single spacing!
   \@setfontsize\footnotesize\@xpt\@xiipt
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep 3\p@ \@plus2\p@ \@minus\p@
                \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\setlength\footnotesep{12pt}

% Figure command easier to remember than includegraphics. It has two arguments #1= file and %#2=scaling factor

\newcommand{\woopic}[2]{
  \includegraphics[scale=#2]{#1}
}

% Set up the initial names for various items

\newcommand{\thesistype}[1]{\def\th@sistype{#1}}
\let\th@sistype\relax
\newcommand{\advname}{Advisor}
\newcommand{\dedname}{Dedication}
\newcommand{\chaptername}{CHAPTER}
\newcommand\appendixname{APPENDIX}
\newcommand\contentsname{Contents}
\newcommand\listfigurename{List of Figures}
\newcommand\listtablename{List of Tables}
\renewcommand{\bibname}{References}
\newcommand\indexname{Index}
\newcommand\figurename{Figure}
\newcommand\tablename{Table}
\newcommand\partname{Part}
\newcommand\abstractname{Abstract}
\newcommand\colophonname{Colophon}
\newcommand{\pagename}{PAGE}
\newcommand{\ackname}{Acknowledgments}
\newcommand{\vitaname}{Vita}
\newcommand{\pubname}{Publications}
\newcommand{\fosname}{Fields of Study}
\newcommand{\majorfieldname}{Major field}
\newcommand{\minorfieldname}{Minor field}
\newcommand{\specializationname}{Specialization}
\newcommand{\studinname}{Studies in}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}
\pagestyle{headings}
\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

\if@bstractonly % empty everything that may come before abstract
\let\maketitle\relax
\let\disscopyright\relax
\renewcommand{\dedication}[1]{}
\fi
	\newboolean{index}
	\newboolean{colophon}
	\if@index
		\RequirePackage{makeidx}
		\setboolean{index}{true}
	\fi
	\if@verbatim
		\RequirePackage{verbatim}
	\fi
	\if@dropcaps
		\RequirePackage{lettrine}
	\fi
	\if@gauss
		\RequirePackage[Gauss]{styles/woofncychap}
	\fi
	\if@euler
		\RequirePackage[Euler]{styles/woofncychap}
	\fi
	\if@alltt
		\RequirePackage{alltt}
	\fi
	\if@woolshort
		\RequirePackage{styles/woolshort}
	\fi
	\if@palatino
		\RequirePackage[T1]{fontenc}
		\RequirePackage{pxfonts}
	\fi
	\if@maple
		\RequirePackage[noplots]{maple2e}
	\fi
	\if@picins
		\RequirePackage{wrapfig}
	\fi
	\if@colophon
		\setboolean{colophon}{true}
	\fi
	\RequirePackage{float}% to handle figures and tables - JB
	\RequirePackage[style=base,format=hang,labelfont={bf,footnotesize},font=footnotesize, justification=raggedright]{caption}% to format captions - JB
	\RequirePackage{subfig}% to allow multiple images in a figure. subfig used instead of subfigure which is deprecated (1-24-2020) - JB
	\captionsetup[subfloat]{listofindent=4em}% set captions on subfigures - JB
	\setcounter{lofdepth}{2}% setting depth of the list of figures - JB
% Load hyperref.sty to create a linked document. Warn users that packages called after this
% could mess up hyperlinks.

\ifxetex
	\if@blacklinks
		\RequirePackage[xetex,%
		pdfusetitle=true,%
		pdfpagemode=UseOutlines,%
		bookmarks,%
		bookmarksopen=true,%
		pdfstartview=FitV,%
		colorlinks,%
		allcolors=black,%
		linkcolor=black,%
		citecolor=black,%
		pagebackref=false,%
		plainpages=false,%
		linktocpage=true,%
		pdfpagelabels=true,%
		hyperindex=false,%
		pdfpagetransition=Glitter,%
		breaklinks=true,%
		urlcolor=black,%
		pdfstartpage=1]
		{hyperref}
	\else
		\RequirePackage{xcolor}
		\definecolor{refcolor}{cmyk}{1,0.98,0,0}    % Color for the reference links
		\definecolor{urlcolor}{cmyk}{0.8,0.32,0.98,0.2}    % Color for the url links
		\definecolor{citecolor}{cmyk}{0.5,1,0,0}    % Color for the citation links
		\RequirePackage[xetex,%
		pdfusetitle=true,%
		pdfpagemode=UseOutlines,%
		bookmarks,%
		bookmarksopen=true,%
		pdfstartview=FitV,%
		colorlinks,%
		allcolors=black,%
		linkcolor=refcolor,%
		citecolor=citecolor,%
		pagebackref=true,%
		plainpages=false,%
		linktocpage=true,%
		pdfpagelabels=true,%
		hyperindex=true,%
		pdfpagetransition=Glitter,%
		breaklinks=true,%
		urlcolor=urlcolor,%
		pdfstartpage=1]
		{hyperref}
	\fi		
\else
	\RequirePackage[verbose,expansion=alltext,stretch=20]{microtype}
	\if@blacklinks			
		\RequirePackage[pdftex,%
		pdfusetitle=true,%
		pdfpagemode=UseOutlines,%
		bookmarks,%
		bookmarksopen=true,%
		pdfstartview=FitV,%
		colorlinks,%
		allcolors=black,%
		linkcolor=black,%
		citecolor=black,%
		pagebackref=false,%
		plainpages=false,%
		linktocpage=true,%			
		pdfpagelabels=true,%
		hyperindex=true,%
		pdfpagetransition=Glitter,%
		breaklinks=true,%
		urlcolor=black,%
		pdfstartpage=1]	
		{hyperref}
	\else
		\RequirePackage{xcolor}
		\definecolor{refcolor}{cmyk}{1, 0.98, 0, 0}    % Color for the reference links
		\definecolor{urlcolor}{cmyk}{0.8 ,0.32, 0.98, 0.2}    % Color for the url links
		\definecolor{citecolor}{cmyk}{0.5, 1, 0, 0}    % Color for the citation links
		\RequirePackage[pdftex,%
		pdfusetitle=true,%
		pdfpagemode=UseOutlines,%
		bookmarks,%
		bookmarksopen=true,%
		pdfstartview=FitV,%
		colorlinks,%
		allcolors=black,%
		linkcolor=refcolor,%
		citecolor=citecolor,%
		pagebackref=true,%
		plainpages=false,%
		linktocpage=true,%
		pdfpagelabels=true,%
		hyperindex=true,%
		pdfpagetransition=Glitter,%
		breaklinks=true,%			
		urlcolor=urlcolor,%
		pdfstartpage=1]
		{hyperref}	
	\fi
\fi
\typeout{*** Warning: The  hyperref package has been loaded. Loading any packages after this could interfere with the hyperref package***}
%\def\ifundefined#1{\expandafter\ifx\csname#1\endcsname\relax}
\DeclareGraphicsExtensions{.pdf, .jpg, .tif}
\doublespacing
%%
%% End of file `woosterthesis.cls'.