%
% LaTeX2e class for bachelor and master thesis proposals
% SECORO, University of Bremen, Germany
% Please feel free to send issues, suggestions or pull requests to:
% https://github.com/secorolab/thesis-proposal
% Based on the template by Argentina Ortega Sainz and Ronni Hartanto
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis_proposal}[2026/11/03 The SECORO thesis proposal class]

\newcommand*{\proposaltype}[1]{\gdef\@proposaltype{#1}%
}
\newcommand*{\@proposaltype}{\texttt{\string\proposaltype} not set. Please select the bachelor or master option}

% Options
\DeclareOption{master}{\proposaltype{Master Thesis Proposal}}
\DeclareOption{bachelor}{\proposaltype{Bachelor Thesis Proposal}}

% Execute the default option
\ExecuteOptions{master}

% Process other options
\ProcessOptions\relax

% Load class options
\LoadClass[12pt,a4paper,oneside]{article}

%-------------------------------------------------------------------------------
%	VARIOUS REQUIRED PACKAGES AND CONFIGURATIONS
%-------------------------------------------------------------------------------

\RequirePackage[T1]{fontenc} % Proper hyphenation and copyable text for accented characters
\RequirePackage{lmodern} % Scalable Latin Modern fonts
\RequirePackage[english]{babel} % Hyphenation patterns
\RequirePackage{csquotes} % Context-sensitive quotes, recommended by biblatex
\RequirePackage{xcolor}
\RequirePackage{graphicx} % Required to include images
\RequirePackage{amsmath,amssymb,amsthm} % Math packages
\RequirePackage{listings} % Required for including snippets of code
\RequirePackage{booktabs} % Required for better horizontal rules in tables
\RequirePackage{microtype} % Slightly tweak font spacing for aesthetics
\RequirePackage{geometry}
\RequirePackage[titletoc]{appendix}
\RequirePackage{setspace}
\RequirePackage{url}
\RequirePackage[backend=biber,style=numeric-comp]{biblatex} % Add sources with \addbibresource in the document

\onehalfspacing

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\thirdpartylogo}[1]{\def\@thirdpartylogo{#1}}
\thirdpartylogo{}

\newcommand*{\supervisors}[1]{\gdef\@supervisors{#1}%
}
\newcommand*{\@supervisors}{\texttt{\string\supervisors} currently
not set. Please fix this.}

% Colors
\definecolor{unibremen}{HTML}{D50B2E} % Red of the Universit\"at Bremen logo

\definecolor{keywords}{RGB}{0,100,0}
\definecolor{comments}{RGB}{0,100,50}
\definecolor{stringred}{RGB}{160,0,0}
\definecolor{codeblue}{RGB}{0,0,150}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\maketitle}{%
% The title page and the first content page are both numbered 1, so the title
% page gets no PDF page anchor to avoid duplicate hyperref destinations
\hypersetup{pageanchor=false}
\begin{titlepage}
\newgeometry{left=3cm, bottom=3cm}

\begin{minipage}{0.475\textwidth}
    \centering
	\includegraphics[height=1.5cm]{images/UniBremen_Logo.png}
\end{minipage}
\begin{minipage}{0.475\textwidth}
    \centering
    \includegraphics[height=1.5cm]{images/secoro-logo-horizontal-v2.png}
\end{minipage}
\ifx\@thirdpartylogo\@empty
  \relax
\else
\centering
\vfill
\begin{minipage}{0.4\textwidth}
    \centering
    \includegraphics[height=1.3cm]{\@thirdpartylogo}
\end{minipage}

\fi%


\vfill
\centering
\vspace{1.5cm}
{\Large\@proposaltype\unskip\strut\par}
\vspace{1.5cm}
{\huge\bfseries\@title\unskip\strut\par}
\vspace{2cm}
{\Large\itshape\@author\unskip\strut\par}
\vfill


Supervised by\par
\vskip 8pt
{\large
\@supervisors\unskip\strut\par
}

\vfill

{\large \@date}
\end{titlepage}
\restoregeometry
\hypersetup{pageanchor=true}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and footer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}

%% Page style for title pages.
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyfoot[L]{\color{darkgray}\footnotesize\@author}
    \fancyhead[C]{\color{darkgray}\footnotesize\@title}
    \fancyfoot[C]{\color{darkgray}\footnotesize\thepage}
    \fancyfoot[R]{\color{darkgray}\footnotesize\@proposaltype}
}

\RequirePackage[bookmarksnumbered,bookmarksopen,hidelinks]{hyperref} % PDF bookmarks (viewer outline) and links; load last

% Fill the PDF metadata from the title page fields
\AtBeginDocument{\hypersetup{pdftitle={\@title}, pdfauthor={\@author}}}

\endinput
