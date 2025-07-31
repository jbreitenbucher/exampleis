% ===================================================
% Wooster Thesis Class: Refactored
% Faithful, complete, all options & actions
% ===================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{woosterthesis}[2025/07/24 v5.0 Wooster IS Thesis Class an extension of book.cls. This is a major refactoring and cleanup of the class.]

% Required for boolean and conditional processing of index and colophon
\RequirePackage{ifthen}

% --- Boolean flags for custom options ---
\newif\if@bstractonly	\@bstractonlyfalse
\newif\if@copyright	\@copyrightfalse
\newif\if@blacklinks
\newif\if@palatino
\newif\if@tikz
\newif\if@code
\newif\if@wblack
\newif\if@scottie
\newif\if@kaukecopy
\newif\if@woostercopy
\newif\if@chicago
\newif\if@apa
\newif\if@acs
\newif\if@citeorder
\newif\if@mla
\newif\if@foreignlanguage
\newif\if@lshortwooster
\newif\if@maple
\newif\if@verbatim
\newif\if@dropcaps
\newif\if@euler
\newif\if@gauss
\newif\if@alltt
\newif\if@picins
\newif\if@woosterchapters	\@woosterchapterstrue
\newif\if@woostersections	\@woostersectionstrue
\newif\if@woostertitlepage	\@woostertitlepagetrue
\newif\if@woostercaptions	\@woostercaptionstrue
\newif\if@woostertoc	\@woostertoctrue
\newif\if@singlespace

% --- Legacy boolean ---
\newboolean{index}
\newboolean{colophon}
\newboolean{abstractonly}
\setboolean{abstractonly}{false}

% --- Declare class options ---
\DeclareOption{abstractonly}{\@bstractonlytrue \setboolean{abstractonly}{true}}
\DeclareOption{acs}{\@acstrue}
\DeclareOption{alltt}{\@alltttrue}
\DeclareOption{apa}{\@apatrue}
\DeclareOption{blacklinks}{\@blacklinkstrue}
\DeclareOption{chicago}{\@chicagotrue}
\DeclareOption{citeorder}{\@citeordertrue}
\DeclareOption{code}{\@codetrue}
\DeclareOption{colophon}{\setboolean{colophon}{true}}
\DeclareOption{copyright}{\@copyrighttrue}
\DeclareOption{dropcaps}{\@dropcapstrue}
\DeclareOption{euler}{\@eulertrue}
\DeclareOption{foreignlanguage}{\@foreignlanguagetrue}
\DeclareOption{gauss}{\@gausstrue}
\DeclareOption{index}{\setboolean{index}{true}}
\DeclareOption{kaukecopyright}{\@kaukecopytrue}
\DeclareOption{lshortwooster}{\@lshortwoostertrue}
\DeclareOption{maple}{\@mapletrue}
\DeclareOption{mla}{\@mlatrue}
\DeclareOption{palatino}{\@palatinotrue}
\DeclareOption{picins}{\@picinstrue}
\DeclareOption{scottie}{\@scottietrue}
\DeclareOption{tikz}{\@tikztrue}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{verbatim}{\@verbatimtrue}
\DeclareOption{wblack}{\@wblacktrue}
\DeclareOption{woostercopyright}{\@woostercopytrue}
\DeclareOption{woosterchapters}{\@woosterchapterstrue}
\DeclareOption{nowoosterchapters}{\@woosterchaptersfalse}
\DeclareOption{woostersections}{\@woostersectionstrue}
\DeclareOption{nowoostersections}{\@woostersectionsfalse}
\DeclareOption{woostertitlepage}{\@woostertitlepagetrue}
\DeclareOption{nowoostertitlepage}{\@woostertitlepagefalse}
\DeclareOption{woostertoc}{\@woostertoctrue}
\DeclareOption{nowoostertoc}{\@woostertocfalse}
\DeclareOption{singlespace}{\@singlespacetrue}

% Meta-style options
\DeclareOption{minimalstyle}{
  \@woosterchaptersfalse
  \@woostersectionsfalse
  \@woostertitlepagetrue
  \@woostertoctrue
\@singlespacetrue
}

\DeclareOption{nostyle}{
  \@woosterchaptersfalse
  \@woostersectionsfalse
  \@woostertitlepagefalse
  \@woostertocfalse
\@singlespacetrue
}

% --- Set default options ---
\ExecuteOptions{10pt,letterpaper,twoside,onecolumn,openany,draft}

% --- Forward unknown options to book ---
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{book}
}

% --- Process options and load base class ---
\ProcessOptions\relax
\LoadClass{book}

% --- Core packages required for all engines ---
\RequirePackage{ifpdf,ifxetex,graphicx,eso-pic,fancyhdr,amsmath,amsthm,amssymb,setspace,float}
\RequirePackage[absolute,overlay]{textpos}

% Penalty values to control page breaks
\widowpenalty=100000
\displaywidowpenalty=5000
\hyphenpenalty=5000 \tolerance=1000

% Float spacing and layout
\renewcommand\bottomfraction{.7}
\setlength\textfloatsep{11 pt plus 11 pt minus 3 pt}
\setlength\floatsep{9 pt plus 9 pt minus 3 pt}
\setlength\intextsep{11 pt plus 11 pt minus 3 pt}

% Figure command easier to remember than includegraphics. It has two arguments #1= file and %#2=scaling factor
\newcommand{\woopic}[2]{
	\includegraphics[scale=#2]{#1}
}

% --- Set up document margins and headings based on one sided or two sided formatting ---
\if@twoside
	\RequirePackage[letterpaper,marginparwidth=.6in,hmargin={1.25in,1in},top=1in,bottom=1in]{geometry}
	\def\ps@headings{%
		\let\@oddfoot\@empty\let\@evenfoot\@empty
		\def\@evenhead{\thepage\hfil\slshape\leftmark}
		\def\@oddhead{{\slshape\rightmark}\hfil\thepage}
		\let\@mkboth\markboth
		\def\chaptermark##1{
			\markboth {
				% removed MakeUpperCase - JB
					\ifnum \c@secnumdepth >\m@ne
						\if@mainmatter
							\thechapter. \ % removed \@chapapp - JB
						\fi
					\fi
					##1
			}
			{}
		}%
        		\def\sectionmark##1{%
			\markright {
				% removed MakeUpperCase - JB
					\ifnum \c@secnumdepth >\z@
						\thesection. \ %
					\fi
					##1
        			}
        		}
        }
\else
	\RequirePackage[letterpaper,marginparwidth=.6in,hmargin={1in,1in},top=1in,bottom=1in]{geometry}
	\def\ps@headings{
		\let\@oddfoot\@empty
		\def\@oddhead{{\slshape\rightmark}\hfil\thepage}
		\let\@mkboth\markboth
		\def\chaptermark##1{%
			\markright {
				% removed MakeUpperCase - JB
					\ifnum \c@secnumdepth >\m@ne
						\if@mainmatter
							\thechapter. \ % removed \@chapapp - JB
						\fi
					\fi
					##1
			}
			{}
		}%
		\def\sectionmark##1{
			\markright {
				% removed MakeUpperCase - JB
					\ifnum \c@secnumdepth >\z@
						\thesection. \ 
					\fi
					##1
        			}
        		}
	}
\fi

% =============================================================
% WOOSTER THESIS TITLE PAGE
% Supports: \if@titlepage true or false
% Point sizes: 10pt, 11pt, 12pt+
% =============================================================

% --- Offsets (one place) ---
\newcommand{\TitleXOffset}{4}
\newcommand{\TitleYOffset}{1.925}
\newcommand{\TypeYOffset}{4.75}
\newcommand{\FulfillXOffset}{4}
\newcommand{\FulfillYOffset}{6.9}
\newcommand{\AuthorYOffset}{9.165}
\newcommand{\SchoolYOffset}{10.125}
\newcommand{\AdvisorYOffset}{12.3}

\ifnum\@ptsize=1
  \renewcommand{\TitleXOffset}{4}
  \renewcommand{\TitleYOffset}{1.85}
  \renewcommand{\TypeYOffset}{4.7}
  \renewcommand{\FulfillXOffset}{4}
  \renewcommand{\FulfillYOffset}{6.8}
  \renewcommand{\AuthorYOffset}{9.125}
  \renewcommand{\SchoolYOffset}{10.125}
\fi

\ifnum\@ptsize>1
  \renewcommand{\TitleXOffset}{4}
  \renewcommand{\TitleYOffset}{1.65}
  \renewcommand{\TypeYOffset}{4.65}
  \renewcommand{\FulfillXOffset}{4}
  \renewcommand{\FulfillYOffset}{6.7}
  \renewcommand{\AuthorYOffset}{8.925}
  \renewcommand{\SchoolYOffset}{10.125}
\fi

% --- Parametric Title Page Macro (Titlepage mode) ---
\newcommand{\WoosterTitlePage}[9]{
  \AddToShipoutPicture*{\BackgroundPicture}
  \begin{titlepage}
    % Title
    \begin{textblock}{8}(#1,#2)
      \begin{singlespace}
        \begin{center}
          {\scshape\Large \@title}
        \end{center}
      \end{singlespace}
    \end{textblock}

    % Thesis type
    \begin{textblock}{7}(4.65,#3)
      \begin{center}
        {\scshape \th@sistype}
      \end{center}
    \end{textblock}

    % Fulfillment
    \begin{textblock}{8}(#4,#5)
      \begin{singlespace}
        \begin{center}
          Presented in Partial Fulfillment of the Requirements for \\
          the Degree \d@greetoobtain in the \\
          \@program\ at \@school
        \end{center}
      \end{singlespace}
    \end{textblock}

    % Author
    \begin{textblock}{7}(4.48,#6)
      \begin{singlespace}
        \begin{center}
          by \\ \@author \@authordegrees
        \end{center}
      \end{singlespace}
    \end{textblock}

    % School & year
    \begin{textblock}{7}(4.48,#7)
      {\def\baselinestretch{1}\normalsize
        \begin{center}
          \@school \\
          \ye@r
        \end{center}
      }
    \end{textblock}

    % Advisor
    \begin{textblock}{7}(3.5,#8)
      \noindent
      \hspace{1pt}
      \begin{minipage}[b]{\hsize}
        \begin{flushleft}
          {\bfseries Advised by:} \\
          \@dvisor
          \second@dvisor
        \end{flushleft}
      \end{minipage}
      \par
      \@thanks
    \end{textblock}

    #9 % optional
  \end{titlepage}

  % Cleanup
  \setcounter{footnote}{0}
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\date\relax
  \global\let\and\relax
}

% --- Parametric Inline Macro (\@maketitle) ---
\newcommand{\WoosterInlineTitlePage}[9]{
  \AddToShipoutPicture*{\BackgroundPicture}
  \null

  % Title
  \begin{textblock}{9}(#1,#2)
    \begin{singlespace}
      \centering {\scshape\Large \@title}
    \end{singlespace}
  \end{textblock}

  % Thesis type
  \begin{textblock}{7}(2.125,#3)
    \centering {\scshape \th@sistype}
  \end{textblock}

  % Fulfillment
  \begin{textblock}{8}(#4,#5)
    \begin{singlespace}
      \centering
      Presented in Partial Fulfillment of the Requirements for \\
      the Degree \d@greetoobtain in the \\
      \@program\ at \@school
    \end{singlespace}
  \end{textblock}

  % Author
  \begin{textblock}{7}(2.125,#6)
    \begin{singlespace}
      \centering
      by \\ \@author \@authordegrees
    \end{singlespace}
  \end{textblock}

  % School & year
  \begin{textblock}{7}(2.125,#7)
    {\def\baselinestretch{1}\normalsize
    \centering
    \@school \\ \ye@r}
  \end{textblock}

  % Advisor
  \begin{textblock}{7}(1,#8)
    \noindent
    \hspace{1pt}
    \begin{minipage}[b]{\hsize}
      \begin{flushleft}
        {\bfseries Advised by:} \\ \@dvisor \second@dvisor
      \end{flushleft}
    \end{minipage}
    \par
    \@thanks
  \end{textblock}

  #9 % optional
}

\def\@maketitle{
  \newpage
  \WoosterInlineTitlePage
    {\TitleXOffset}{\TitleYOffset}{\TypeYOffset}{\FulfillXOffset}{\FulfillYOffset}{\AuthorYOffset}{\SchoolYOffset}{\AdvisorYOffset}{}
}

% --- Final combined \maketitle ---
\renewcommand{\maketitle}{
\if@bstractonly\relax\else
  \if@titlepage
    \WoosterTitlePage
       {\TitleXOffset}{\TitleYOffset}{\TypeYOffset}{\FulfillXOffset}{\FulfillYOffset}{\AuthorYOffset}{\SchoolYOffset}{\AdvisorYOffset}{}
  \else
    \par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}
      \long\def\@makefntext##1{
        \parindent 1em\noindent
        \hb@xt@1.8em{\hss\@textsuperscript{\normalfont\@thefnmark}}##1
      }

      \if@twocolumn
        \ifnum \col@number=\@ne
          \@maketitle
        \else
          \twocolumn[\@maketitle]
        \fi
      \else
        \newpage
        \global\@topnum\z@
        \@maketitle
      \fi

      \thispagestyle{plain}
      \@thanks
    \endgroup

    % Cleanup
    \setcounter{footnote}{0}
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\date\relax
    \global\let\and\relax
  \fi
\fi
}

% --- Setting up behavior for front matter, main matter, and back matter ---
\newif\if@numberedchapters
\if@bstractonly
  \renewcommand\frontmatter{%
	\@numberedchaptersfalse    
	\@mainmatterfalse
    	\@openrightfalse
  }
\else
\renewcommand\frontmatter{
	\cleardoublepage
	\@numberedchaptersfalse
	\@mainmatterfalse
	\pagenumbering{roman}
	\pagestyle{plain}
}
\fi
\renewcommand\mainmatter{
	\cleardoublepage
	%\renewcommand{\@chapapppage}{\pagename}
	\@numberedchapterstrue
	\@mainmattertrue
	\pagenumbering{arabic}
	\pagestyle{headings}
}
\renewcommand\backmatter{
	\if@openright
		\cleardoublepage
	\else
		\clearpage
	\fi
	\@numberedchapterstrue
	\@mainmattertrue
	\appendix
	\pagestyle{headings}
}
\newcommand{\titlefont}{\fontshape{sc}}

\AtEndOfClass{%
% --- Setting up how to handle parts in the document ---
\def\@part[#1]#2{
	\ifnum \c@secnumdepth >-2\relax
		\refstepcounter{part}
		\addcontentsline{toc}{part}{\thepart\hspace{1em}#1}
	\else
		\addcontentsline{toc}{part}{#1}
	\fi
	\markboth{}{}
	{\centering
		\interlinepenalty \@M
		\normalfont
		\ifnum \c@secnumdepth >-2\relax
			\huge \partname\nobreakspace\thepart % removed \bfseries - JB
			\par
			\vskip 20\p@
		\fi
		\Huge #2\par
	} % removed \bfseries - JB
	\@endpart
}
\def\@spart#1{
	\markboth{}{}
	{\centering
		\interlinepenalty \@M
		\normalfont
		\Huge #1\par
	} % removed \bfseries - JB
	\@endpart
}

% --- Chapter heading formatting ---
\if@woosterchapters
    \def\@chapter[#1]#2{
      \ifnum \c@secnumdepth >\m@ne
        \if@mainmatter
          \refstepcounter{chapter}
          \if@numberedchapters % added - JB
	% Output chapter type to log (uppercase roman numerals)
            {\let\Roman\roman
             \edef\@tmpmsg{\noexpand\typeout{\noexpand\@chapapp\space\thechapter.}}
             \uppercase\expandafter{\@tmpmsg}}
		% Add "CHAPTER ... PAGE" heading once before first chapter
		\ifnum\value{chapter}=1
			\addtocontents{toc}{\protect\vspace{1.5\baselineskip}}
  			\addtocontents{toc}{\protect\noindent \@chapapp \hfill PAGE\par}
		\fi
	% Add numbered chapter to ToC
            \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1} % removed \typeout{\@chapapp\space\thechapter.} - JB
          \else
	% Add unnumbered chapter to ToC
            \addcontentsline{toc}{chapter}{#1}
          \fi
        \fi
      \else
	 % Not in mainmatter — always unnumbered chapter
        \addcontentsline{toc}{chapter}{#1}
      \fi
      \chaptermark{#1}
      \addtocontents{lof}{\protect\addvspace{10\p@}}
      \addtocontents{lot}{\protect\addvspace{10\p@}}
      \addtocontents{lol}{\protect\addvspace{10\p@}}
      \if@twocolumn
        \@topnewpage[\@makechapterhead{#2}]
      \else
        \@makechapterhead{#2}
      \fi
    }
\if@euler\else
    \if@gauss\else
    \def\@makechapterhead#1{
      \vspace*{50\p@}
      {\parindent\z@\raggedright\normalfont
       \ifnum \c@secnumdepth >\m@ne
         \if@mainmatter
           \texorpdfstring{\textsl \@chapapp\space {\fontsize{20}{22}\selectfont$\mathit{\thechapter}$}}{\@chapapp\space \thechapter} % removed \bfseries - JB
           \par\nobreak
           \vskip 10\p@ % 20 -> 10 - JB
         \fi
       \fi
       \interlinepenalty\@M
       \fontshape{sc}\fontsize{20}{22}\selectfont #1\par\nobreak % \Huge -> \scshape\LARGE removed \bfseries - JB
       \vskip 30\p@\noindent}
    }
\fi
\fi
    \def\@schapter#1{
      \if@twocolumn
        \@topnewpage[\@makeschapterhead{#1}]
      \else
        \@makeschapterhead{#1}
        \@afterheading
      \fi
    }
    \def\@makeschapterhead#1{
      \if@twocolumn \vspace*{83\p@}\else\vspace*{50\p@}\fi
      {\parindent\z@\raggedright\normalfont
       \interlinepenalty\@M
       \fontshape{sc}\fontsize{20}{22}\selectfont #1\par\nobreak % \Huge -> LARGE removed \bfseries - JB
       \vskip 30\p@}
    }
    \fi

% --- Section formatting ---
% do not indent first paragraph of section by default - JB
\if@woostersections
\def\@startsection#1#2#3#4#5#6{
	\if@noskipsec
		\leavevmode
	\fi
	\par \@tempskipa #4\relax
	\@afterindentfalse
	\ifdim \@tempskipa <\z@
		\@tempskipa -\@tempskipa
		\relax
	\fi
	\if@nobreak
		\everypar{}
	\else
		\addpenalty{\@secpenalty}
		\addvspace{\@tempskipa}
	\fi
	\@ifstar
		{
			\@ssect{#3}{#4}{#5}{#6}
		}
		{
			\@dblarg{\@sect{#1}{#2}{#3}{#4}{#5}{#6}}
		}
	}
  \renewcommand\section{\@startsection{section}{1}{\z@}
    {-3.5ex \@plus -1ex \@minus -.2ex}
    {2.3ex \@plus.2ex}
    {\scshape\Large}}
  \renewcommand\subsection{\@startsection{subsection}{2}{\z@}
    {-3.25ex\@plus -1ex \@minus -.2ex}
    {1.5ex \@plus .2ex}
    {\scshape\large}}
  \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}
    {-3.25ex\@plus -1ex \@minus -.2ex}
    {1.5ex \@plus .2ex}
    {\scshape\normalsize}}
  \renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}
    {3.25ex \@plus1ex \@minus.2ex}
    {-1em}%
    {\normalfont\normalsize\scshape\bfseries}}
\fi

% --- Title page handling ---
\if@woostertitlepage
  \renewenvironment{titlepage}{
    \cleardoublepage
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse\newpage
    \fi
    \thispagestyle{empty}
    \setcounter{page}\@ne
  }{%
    \if@restonecol
      \twocolumn
    \else
      \newpage
    \fi
    \if@twoside\else\setcounter{page}\@ne\fi
  }
\fi

% --- TOC/LOF/LOT formatting ---
\if@woostertoc
  \newcommand{\@tocheadline}[2]{
    \if@nobreak\relax\else\addvspace{.66\baselineskip}\fi
    \hbox to \hsize{#1 \hfil #2}
  }

  \renewcommand\tableofcontents{
    \if@twocolumn\@restonecoltrue\onecolumn\else\@restonecolfalse\fi
    \chapter*{\contentsname\@mkboth{\contentsname}{\contentsname}}
    {\def\baselinestretch{1}\normalsize\@starttoc{toc}}
    \if@restonecol\twocolumn\fi
  }

  \renewcommand\listoffigures{
    \if@twocolumn\@restonecoltrue\onecolumn\else\@restonecolfalse\fi
    \chapter*{\listfigurename}
    \@mkboth{\listfigurename}{\listfigurename}
    \addcontentsline{toc}{chapter}{\listfigurename}
    \@tocheadline{Figure}{Page}
    {\def\baselinestretch{1}\normalsize\@starttoc{lof}}
    \if@restonecol\twocolumn\fi
  }

  \renewcommand\listoftables{
    \if@twocolumn\@restonecoltrue\onecolumn\else\@restonecolfalse\fi
    \chapter*{\listtablename}
    \@mkboth{\listtablename}{\listtablename}
    \addcontentsline{toc}{chapter}{\listtablename}
    \@tocheadline{Table}{Page}
    {\def\baselinestretch{1}\normalsize\@starttoc{lot}}
    \if@restonecol\twocolumn\fi
  }
  \let\l@table\l@figure

  \renewcommand*\l@chapter[2]{
    \ifnum \c@tocdepth >\m@ne
      \addpenalty{-\@highpenalty}\vskip 0.5em \@plus\p@
      \setlength\@tempdima{1.5em}
      \begingroup\parindent\z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode\advance\leftskip\@tempdima
      \hskip -\leftskip #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty\endgroup
    \fi
  }
  \renewcommand*\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
  \renewcommand*\l@subsection{\@dottedtocline{1}{3.8em}{3.2em}}
  \renewcommand*\l@subsubsection{\@dottedtocline{1}{7.0em}{4.1em}}
  \renewcommand*\l@paragraph{\@dottedtocline{1}{10em}{5em}}
  \renewcommand*\l@subparagraph{\@dottedtocline{1}{12em}{6em}}
\fi
  \if@singlespace
     \singlespacing
  \else
      \doublespacing
    \fi
}

% --- Thesis metadata ---
\newcommand{\presentdegrees}[1]{\def\@authordegrees{, #1}}
\AtBeginDocument{
  \makeatletter
  \providecommand{\@authordegrees}{}  % safe to run here
  \makeatother
}
\newcommand{\degreetoobtain}[1]{\def\d@greetoobtain{#1 }}
\newcommand{\presentschool}[1]{\def\@school{#1}}
\newcommand{\academicprogram}[1]{\def\@program{#1}}
\newcommand{\advisor}[1]{\def\@dvisor{#1}}
\def\second@dvisor{}
\newcommand{\secondadvisor}[1]{
	\def\\{\noexpand\\}
	\global\edef\second@dvisor{\second@dvisor \\ #1}
}
\newcommand{\gradyear}[1]{\def\ye@r{#1}}

% --- Setting default names of document parts ---
\newcommand{\thesistype}[1]{\def\th@sistype{#1}}
\let\th@sistype\relax
\newcommand{\advname}{Advisor}
\newcommand{\dedname}{Dedication}
\renewcommand{\chaptername}{CHAPTER}
\renewcommand\appendixname{APPENDIX}
\renewcommand\contentsname{Contents}
\renewcommand\listfigurename{List of Figures}
\renewcommand\listtablename{List of Tables}
\renewcommand\indexname{Index}
\renewcommand\figurename{Figure}
\renewcommand\tablename{Table}
\renewcommand\partname{Part}
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
\def\today{
	\ifcase
		\month\or January\or February\or March\or April\or May\or June\or July\or August\or September\or October\or November\or December
	\fi
	\space\number\day, \number\year
}

% --- Appendix handling ---
\renewcommand\appendix{
  \par\setcounter{chapter}{0}\setcounter{section}{0}
  \gdef\@chapapp{\appendixname}
  \gdef\thechapter{\@Alph\c@chapter}
}

% --- Description environment ---
\renewenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin\let\makelabel\descriptionlabel}}
  {\endlist}
\renewcommand*\descriptionlabel[1]{
  \hspace\labelsep\normalfont\bfseries #1
}

% --- Dedication environment ---
\newcommand{\dedication}[1]{\cleardoublepage \chapter*{} \addcontentsline{toc}{chapter}{\dedname}\thispagestyle{plain}\vspace*{\fill} \begin{center}#1\end{center} \vfill \newpage}

% --- Abstract environment ---
\newenvironment{abstract}{
	\if@bstractonly
		\setcounter{page}{1}\pagenumbering{arabic}\pagestyle{plain}
		  \vspace*{3\baselineskip} {\centering\Huge \@title \par}\vspace{2\baselineskip}\begin{singlespace}\begin{center}by \@author\ \d@greetoobtain\\ The College of Wooster, \ye@r\\ \@dvisor\end{center}\end{singlespace}\vspace{\baselineskip}
	\else
		\chapter*{\abstractname}
		\addcontentsline{toc}{chapter}{\abstractname}
 	\fi
}{%
 	\global\let\@end@bstract\relax
	\if@bstractonly
		\global\let\@end@bstract\enddocument
		\def\@currenvir{document}% nasty trick!
	\fi
\@end@bstract
}

% --- Acknowledgments, Colophon, Vita environments---
\newenvironment{acknowl}{\chapter*{\ackname} \addcontentsline{toc}{chapter}{\ackname}}{}
\newenvironment{colophon}{\chapter*{\colophonname}\addcontentsline{toc}{chapter}{\colophonname}\begin{singlespace}\begin{quote} \small}{\end{quote}\end{singlespace}}
\newenvironment{vita}{\chapter*{\vitaname}\addcontentsline{toc}{chapter}{\vitaname}\begingroup\def\baselinestretch{1}\normalsize}{\endgroup}

% --- Datelist, Publist, Fields of Study for Vita ---
\newenvironment{datelist}{\begin{list}{}{%
	\setlength\topsep\baselineskip
	\setlength\partopsep{0pt}%
	\setlength\itemsep\baselineskip
	\setlength\rightmargin{0pt}%
	\setlength\labelwidth{.5 \hsize}%
	\addtolength\labelwidth{-\labelsep}%
	\setlength\leftmargin{\hsize}%
	\addtolength\leftmargin{-\labelwidth}%
\renewcommand\makelabel[1]{\noindent ##1 \dotfill~}}}{\end{list}}
% \dateitem provided for compatibility with the preceding versions. Its use
% is deprecated. Use \begin{datelist} \item[1997] blah blah blah .... instead. - JH
\newcommand{\dateitem}[2]{\noindent #1 \dotfill \parbox[t]{.5 \hsize}{#2}%
       \vskip\baselineskip} 
\newenvironment{publist}{\vskip .2 \vsize
        \penalty -1000
        \vskip -.2 \vsize
        \vspace{10 pt}
	\begin{center}
		\pubname}{\end{center}\vskip\baselineskip}
\newcommand{\pubitem}[1]{\noindent #1 \vskip\baselineskip}
\newenvironment{fieldsstudy}{\vskip .3 \vsize
        \penalty -1000
        \vskip -.3 \vsize
        \vspace{10 pt}
	\begin{center}
		\fosname}{\end{center}\vskip\baselineskip}
\newcommand{\majorfield}[1]{\noindent \majorfieldname: #1 \vskip\baselineskip}
\newcommand{\minorfield}[1]{\noindent \minorfieldname: #1 \vskip\baselineskip}
\newcommand{\specialization}[1]{\noindent \specializationname: #1\vskip\baselineskip}
\newcommand{\onestudy}[2]{\noindent\studinname #1: #2}
\newenvironment{studieslist}{
        \gdef\studn@me{\studinname:\let\studn@me\relax}
        \noindent\begin{tabular}{@{\protect\studn@me }l l l}}{\end{tabular}}
\newcommand{\studyitem}[2]{\global\let\studn@me\relax & #1 & #2 \\}

% --- Setting up numbering format for thesis parts ---
\renewcommand*\chaptermark[1]{}
\renewcommand \thepart {\@Roman\c@part}
\renewcommand\section{\@startsection{section}{1}{\z@}{-3.5ex}{2.3ex}{\scshape\Large}}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection .\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
%\newcommand{\@chapapppage}{\relax}

% --- Caption and figure formatting ---
\RequirePackage[style=base,format=hang]{caption}% to format captions - JB
\PassOptionsToPackage{class=woosterthesis}{caption}
\DeclareCaptionStyle{woosterthesis}{
  font=small,
  labelfont={bf,small},
  labelsep=colon,
  justification=centerlast,
  singlelinecheck=false,
  skip=\abovecaptionskip
}
\captionsetup{style=woosterthesis}
\RequirePackage{subfig} % replaces deprecated subfigure
\captionsetup[subfloat]{listofindent=4em}% set captions on subfigures - JB
\setcounter{lofdepth}{2}% setting depth of the list of figures - JB

% --- Conditional loading of packaged based on class options ---
% --- Font setup: Palatino option ---
\if@palatino
	\RequirePackage[sc]{mathpazo}
	\RequirePackage{pxfonts}
\fi

% --- TiKz support ---
\if@tikz
	\RequirePackage{tikz}
	\usetikzlibrary{positioning}
\fi

% --- Index support ---
\ifthenelse{\boolean{index}}{
	\RequirePackage{makeidx}
% ----------------------------------------
% set up the Index
% ----------------------------------------
	\renewenvironment{theindex}
		{
			\if@twocolumn
				\@restonecolfalse
			\else
				\@restonecoltrue
			\fi
			\columnseprule \z@
			\columnsep 35\p@
			\twocolumn[\@makeschapterhead{\indexname}]%
			\@mkboth{\indexname}{\indexname} % removed \MakeUppercase -JB
			\thispagestyle{plain}
			\setlength\baselineskip{1\@ptsize pt} % single space - JB
			\parindent\z@
			\parskip\z@ \@plus .3\p@\relax
			\let\item\@idxitem
		}
		{\if@restonecol\onecolumn\else\clearpage\fi}
%	\renewcommand\@idxitem{\par\hangindent 40\p@}
%	\renewcommand\subitem{\@idxitem \hspace*{20\p@}}
%	\renewcommand\subsubitem{\@idxitem \hspace*{30\p@}}
%	\renewcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax} % - JB
}{}

% --- Maple code support ---
\if@maple
	\RequirePackage[noplots]{maple2e}
\fi

% --- Support for verbatim text ---
\if@verbatim
	\RequirePackage{verbatim}
\fi

% --- Support for initial dropped capitals ---
\if@dropcaps
	\RequirePackage{lettrine}
\fi

% --- Chapter style with Gauss format ---
\if@gauss
	\RequirePackage[Gauss]{styles/woofncychap}
\fi

% --- Chapter style with Euler format ---
\if@euler
	\RequirePackage[Euler]{styles/woofncychap}
\fi

% --- Code listings support ---
\if@code
  \RequirePackage{listings}
  \renewcommand{\lstlistlistingname}{List of Listings}

  % Save the default \lstlistoflistings before overwriting
  \let\default@lstlistoflistings\lstlistoflistings

  % Custom version
  \newcommand{\wooster@lstlistoflistings}{
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\lstlistlistingname}
    \@mkboth{\lstlistlistingname}{\lstlistlistingname} % No MakeUppercase - JB
    \addcontentsline{toc}{chapter}{\lstlistlistingname}
    \@tocheadline{Listing}{Page}
    {\def\baselinestretch{1}\normalsize\@starttoc{lol}}
    \if@restonecol\twocolumn\fi
  }

  % Conditional definition
  \renewcommand{\lstlistoflistings}{
    \if@woostertoc
      \wooster@lstlistoflistings
    \else
      \default@lstlistoflistings
    \fi
  }

  % Use figure-style formatting in ToC
  \let\l@lstlisting\l@figure
\fi

% --- Support for typewriter text ---
\if@alltt
	\RequirePackage{alltt}
\fi

% --- Support for wrapped figures ---
\if@picins
	\RequirePackage{wrapfig}
\fi

% --- Option only used to produce the manual containing all the the lshort guide ---
\if@lshortwooster
	\RequirePackage{styles/lshortwooster}
\fi

% --- Support for ACS, APA, MLA, Chicago, Citation order, and numeric references ---
\if@acs
  \PassOptionsToPackage{style=chem-acs,articletitle,hyperref=auto,backref=true,backrefstyle=two,natbib=true,backend=biber}{biblatex}
\else\if@chicago
  \PassOptionsToPackage{annotation,notes,autocite=footnote,authordate,strict=true,autolang=other,bibencoding=inputenc,hyperref=auto,backref=true,backrefstyle=two,natbib=true,sorting=nty,backend=biber}{biblatex-chicago}
\else\if@apa
  \PassOptionsToPackage{style=apa,autolang=other,bibencoding=inputenc,hyperref=auto,backref=true,backrefstyle=two,natbib=true,sorting=nty,backend=biber}{biblatex}
\else\if@mla
  \PassOptionsToPackage{style=mla,autolang=other,bibencoding=inputenc,hyperref=auto,backref=true,backrefstyle=two,natbib=true,sorting=nty,backend=biber}{biblatex}
\else\if@citeorder
  \PassOptionsToPackage{style=numeric,autolang=other,bibencoding=inputenc,hyperref=auto,backref=true,backrefstyle=two,natbib=true,sorting=none,backend=biber}{biblatex}
\else
  \PassOptionsToPackage{hyperref=auto,backref=true,backrefstyle=two,natbib=true,style=numeric,backend=biber}{biblatex}
\fi\fi\fi\fi\fi

% --- XeTeX engine class loading ---
\ifxetex
	\RequirePackage{fontspec,xunicode,xltxtra,unicode-math}

	% Language support (optional)
	\if@foreignlanguage
		\RequirePackage{polyglossia}
		\RequirePackage[autostyle,autopunct=true]{csquotes}% to have context aware quotes when using foreign languages - JB
	\else
		\RequirePackage[style=american,autopunct=true]{csquotes}% to have context aware quotes when using foreign languages - JB
	\fi
	\if@blacklinks
		\RequirePackage[xetex,pdfusetitle=true,pdfpagemode=UseOutlines,bookmarks,bookmarksopen=true,pdfstartview=FitV,colorlinks,allcolors=black,linkcolor=black,citecolor=black,plainpages=false,linktocpage=true,pdfpagelabels=true,hyperindex=false,pdfpagetransition=Glitter,breaklinks=true,urlcolor=black,pdfstartpage=1]{hyperref}
	\else
		\RequirePackage{xcolor}
		\definecolor{refcolor}{cmyk}{1,0.98,0,0}    % Color for the reference links
		\definecolor{urlcolor}{cmyk}{0.8,0.32,0.98,0.2}    % Color for the url links
		\definecolor{citecolor}{cmyk}{0.5,1,0,0}    % Color for the citation links
		\RequirePackage[xetex,pdfusetitle=true,pdfpagemode=UseOutlines,bookmarks,bookmarksopen=true,pdfstartview=FitV,colorlinks,allcolors=black,linkcolor=refcolor,citecolor=citecolor,plainpages=false,linktocpage=true,pdfpagelabels=true,hyperindex=true,pdfpagetransition=Glitter,breaklinks=true,urlcolor=urlcolor,pdfstartpage=1]{hyperref}
	\fi
\else
	\RequirePackage[utf8]{inputenc}
   	\RequirePackage[T1]{fontenc}
   	\RequirePackage{lmodern}

	% Language support (optional)
	\if@foreignlanguage
		\RequirePackage{babel}
		\RequirePackage[autostyle,autopunct=true]{csquotes}% to have context aware quotes when using foreign languages - JB
	\else
		\RequirePackage[style=american,autopunct=true]{csquotes}% to have context aware quotes when using foreign languages - JB
	\fi
	\RequirePackage[verbose,expansion=alltext,stretch=20]{microtype}
	\if@blacklinks			
		\RequirePackage[pdftex,pdfusetitle=true,pdfpagemode=UseOutlines,bookmarks,bookmarksopen=true,pdfstartview=FitV,colorlinks,allcolors=black,linkcolor=black,citecolor=black,plainpages=false,linktocpage=true,pdfpagelabels=true,hyperindex=true,pdfpagetransition=Glitter,breaklinks=true,urlcolor=black,pdfstartpage=1]{hyperref}
	\else
		\RequirePackage{xcolor}
		\definecolor{refcolor}{cmyk}{1, 0.98, 0, 0}    % Color for the reference links
		\definecolor{urlcolor}{cmyk}{0.8 ,0.32, 0.98, 0.2}    % Color for the url links
		\definecolor{citecolor}{cmyk}{0.5, 1, 0, 0}    % Color for the citation links
		\RequirePackage[pdftex,pdfusetitle=true,pdfpagemode=UseOutlines,bookmarks,bookmarksopen=true,pdfstartview=FitV,colorlinks,allcolors=black,linkcolor=refcolor,citecolor=citecolor,plainpages=false,linktocpage=true,pdfpagelabels=true,hyperindex=true,pdfpagetransition=Glitter,breaklinks=true,urlcolor=urlcolor,pdfstartpage=1]{hyperref}	
	\fi
\fi

% --- Load BibLaTeX ---
\if@chicago
  \RequirePackage{biblatex-chicago}
\else
  \RequirePackage{biblatex}
\fi

% --- Logos & Background  for copyright and title pages---
\newcommand{\kaukelogo}{\includegraphics[scale=.4]{kauke_wordmark}}
\newcommand{\woosterlogo}{\includegraphics[scale=.4]{wooster_stacked_black}}
\newcommand{\BackgroundPicture}{
	\put(-3,-5){\parbox[b][\paperheight]{\paperwidth}{\vfill
	\centering
	\includegraphics[width=.9\paperwidth,height=.9\paperheight,keepaspectratio]{
		\if@wblack W_black
		\else
			\if@scottie scottie_head_grayscale
			\else kauke_arch_gray
			\fi
		\fi}
  \vfill}}}

% --- Copyright Control ---
\newcommand{\copyrightdate}[1]{\gdef\@copydate{#1}}
\let\@copydate\@date

\newif\if@copyright
\@copyrightfalse

\newcommand{\copyrighted}[1][\@author]{%
  \@copyrighttrue
  \def\@copyright{#1}%
}

% --- Set copyright logo (optionally overridden) ---
\newcommand{\@copyrightlogo}{} % default: no logo

\if@kaukecopy
  \renewcommand{\@copyrightlogo}{\kaukelogo}
\fi

\if@woostercopy
  \renewcommand{\@copyrightlogo}{\woosterlogo}
\fi

% --- Unified copyright page ---
\newcommand{\disscopyright}{%
  \if@bstractonly\relax\else
    \cleardoublepage
    \thispagestyle{empty}
    \null
    \vspace*{\fill}
    \if@copyright
      \begin{center}
        \@copyrightlogo
        \begin{singlespace}
          \copyright\ \ye@r\ by \@copyright\\
          All rights reserved.
        \end{singlespace}
      \end{center}
    \fi
    \vfill
  \fi
}

% --- Custom footnote rule ---
\renewcommand\footnoterule{
	\kern-3\p@
	\hrule\@width.4\columnwidth
	\kern2.6\p@
}
\@addtoreset{footnote}{chapter} % reset footnotes on each page - JB
\renewcommand\@makefntext[1]{%
	\parindent 1em%
	\noindent
	\hb@xt@1.8em{\hss\@makefnmark}#1
}
\renewcommand{\footnotesize}{%
	\def\baselinestretch{1} % to make single spacing!
	\@setfontsize\footnotesize\@xpt\@xiipt
	\abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
	\def\@listi{
		\leftmargin\leftmargini
		\topsep 6\p@ \@plus2\p@ \@minus2\p@
		\parsep 3\p@ \@plus2\p@ \@minus\p@
		\itemsep \parsep
	}%
	\belowdisplayskip \abovedisplayskip
}
\setlength\footnotesep{12pt}

\typeout{*** Warning: The  hyperref package has been loaded. Loading any packages after this could interfere with the hyperref package***}
\DeclareGraphicsExtensions{.pdf, .jpg, .tif, .png}
%
% End of file `woosterthesis.cls'.