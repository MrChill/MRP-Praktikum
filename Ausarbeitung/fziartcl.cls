%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Latex document class for TKS/IDS articles
% Based on Koma article class
% Changes title page and page footer to include FZI logo and address
%
% Author: Dennis Nienhüser <nienhues@fzi.de>
% Date: 2008-02-14
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{fziartcl}[2009/09/22 v1.2]

\usepackage{graphicx}
\usepackage{fancyhdr}
\usepackage[utf8]{inputenc}
\usepackage{color}
\usepackage{ifthen}
\usepackage{kvoptions}

\PassOptionsToClass{a4paper,titlepage,12pt}{scrartcl}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\DeclareOption{ids}{}
\DeclareOption{tks}{}
\DeclareOption{en}{}
\DeclareOption{de}{}
\DeclareBoolOption{ids}
\DeclareBoolOption{en}
\DeclareComplementaryOption{tks}{ids}
\DeclareComplementaryOption{de}{en}
\ProcessKeyvalOptions*

\ProcessOptions

\LoadClass{scrartcl}

\usepackage[small,nooneline,bf]{caption}

% URLs that don't look like 1990
\usepackage[pdftex,bookmarks=true,colorlinks=false,hidelinks]{hyperref}

%
% Makro for to do things
%
\newcommand{\todo}[1]{\textbf{\textsc{\textcolor{red}{(TODO: #1)}}}}

% Use package:
%\usepackage{todonotes}
%\usepackage[obeyDraft]{todonotes}

%
% The date, appearing at the first page of the document. Today is default, renewcommand if necessary
%
\newcommand{\closingdate}{\@date}

\renewcommand*\maketitle[1][1]{%
    \begin{titlepage}

\thispagestyle{fancy}
\rfoot{}
\cfoot{\hrulefill\\
	\vspace{4mm}
	\begin{minipage}{5.6cm}
		\includegraphics*[height=60pt]{fzi-logo-2007}
	\end{minipage}
	\begin{minipage}{9.6cm}
\iffziartcl@en
                Research Center for Information Technology (FZI)\\
\else
                FZI Forschungszentrum Informatik\\
\fi
\iffziartcl@ids
  \iffziartcl@en
    Interactive Diagnosis- and Service Systems (IDS)\\
  \else
    Interaktive Diagnose- und Servicesysteme (IDS)\\
  \fi
\else
  \iffziartcl@en
    Technical Cognitive Assistance Systems (TCS)\\
  \else
    Technisch Kognitive Assistenzsysteme (TKS)\\
  \fi
\fi
\iffziartcl@en
		Haid-und-Neu-Straße 10--14\\
		76131 Karlsruhe, Germany
\else
                Haid-und-Neu-Straße 10--14\\
                76131 Karlsruhe
\fi
	\end{minipage}}

	\setcounter{page}{#1}%
	\let\footnotesize\small
	\let\footnoterule\relax
	\let\footnote\thanks
	\renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
	\let\@oldmakefnmark\@makefnmark
	\renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}%
	\ifx\@extratitle\@empty \else
	\noindent\@extratitle\next@tpage\cleardoublepage
	\thispagestyle{empty}%
	\fi
	\ifx\@titlehead\@empty \else
	\noindent\begin{minipage}[t]{\textwidth}%
	\@titlehead
	\end{minipage}\par
	\fi
	\null\vfill
	\begin{center}
	\ifx\@subject\@empty \else
		{\subject@font \@subject \par}%
		\vskip 3em
	\fi
	{\titlefont\huge \@title\par}%
	\vskip 3em
	{\Large \lineskip 0.75em
		\begin{tabular}[t]{c}
		\@author
		\end{tabular}\par
	}%
	\vskip 1.5em
	{\Large \closingdate \par}%
	\vskip \z@ \@plus3fill
	{\Large \@publishers \par}%
	\vskip 3em
	\end{center}\par
	\@thanks
	\vfill\null
	\if@twoside\next@tpage
	\noindent\begin{minipage}[t]{\textwidth}
		\@uppertitleback
	\end{minipage}\par
	\vfill
	\noindent\begin{minipage}[b]{\textwidth}
		\@lowertitleback
	\end{minipage}
	\fi
	\ifx\@dedication\@empty \else
	\next@tpage\null\vfill
	{\centering \Large \@dedication \par}%
	\vskip \z@ \@plus3fill
	\if@twoside \next@tpage\cleardoublepage \fi
	\fi
\end{titlepage}

\pagestyle{fancy}

\lhead{}
%%% \rhead{\nouppercase...} Does not work if an TOC is at the beginning of the document...
%%% \rhead{\nouppercase{\leftmark}}
\rhead{}

\lfoot{\includegraphics*[height=30pt]{fzi-logo-2007}}
\iffziartcl@en
\cfoot{Research Center for Information Technology (FZI)}
\else
\cfoot{FZI Forschungszentrum Informatik}
\fi

\rfoot{\thepage}

}

\endinput
