%
% LaTeX2e class for bachelor and master thesis proposals
% SECORO, University of Bremen, Germany
% Please feel free to send issues, suggestions or pull requests to:
% https://github.com/secorolab/thesis-proposal
% Based on the template by Argentina Ortega Sainz and Ronni Hartanto
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis_proposal}[2026/11/03 The SECORO thesis proposal class]

\RequirePackage{xcolor}
\RequirePackage{ifthen}
\definecolor{slcolor}{HTML}{882B21}
\newcommand*{\proposaltype}[1]{\gdef\@proposaltype{#1}%
}
\newcommand*{\@proposaltype}{\texttt{\string\proposaltype} not set. Please select the bachelor or master option}


% Options
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{master}{\proposaltype{Master Thesis Proposal}}
\DeclareOption{bachelor}{\proposaltype{Bachelor Thesis Proposal}}

% Report options
% \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

% Execute the default option
\ExecuteOptions{master}

% Process other options
\ProcessOptions\relax

% Load class options
\LoadClass[12pt,a4paper, oneside]{article}

%-------------------------------------------------------------------------------
%	VARIOUS REQUIRED PACKAGES AND CONFIGURATIONS
%-------------------------------------------------------------------------------

\usepackage[numbers,sort&compress]{natbib}\citeindextrue % Round brackets around citations, change to square for square brackets
\usepackage{graphicx} % Required to include images
\usepackage{amsmath,amssymb,theorem} % Math packages
\usepackage{listings} % Required for including snippets of code
\usepackage{booktabs} % Required for better horizontal rules in tables
% \usepackage{xspace} % Provides the ability to use an intelligent space which is used in \institution and \department
% \usepackage[printonlyused,withpage]{acronym} % Include a list of acronyms
% \usepackage[acronym, toc]{glossaries}%Better package for acronyms
% \usepackage{rotating} % Allows tables and figures to be rotated
% \usepackage[xetex]{hyperref} % Required for links and changing link options
\usepackage{microtype} % Slightly tweak font spacing for aesthetics
% \usepackage{algorithm}
% \usepackage[noend]{algpseudocode}
% \usepackage{caption}
% %\captionsetup{belowskip=6pt,aboveskip=6pt}
% \usepackage{footnote}
% % \usepackage{minipage-marginpar}
% \makesavenoteenv{tabular}
% \makesavenoteenv{table}
% \usepackage[flushleft]{threeparttable}
% % \usepackage{subcaption}
% \usepackage[section]{placeins}
% \usepackage{lastpage}
% \usepackage[small, md, sc]{titlesec}
%\usepackage{inputenc}
\usepackage{geometry}
% %\usepackage{tocloft}
% \usepackage{adjustbox} % to limit size of tables
% \usepackage{pbox}
\usepackage[titletoc]{appendix}
% \usepackage{colortbl} % for color lines in tables
% \usepackage{rotfloat}
% \usepackage[page,toc,titletoc,title]{appendix} % Add appendices
% \usepackage{tocloft} % Add the word appendix to the TOC
\usepackage{setspace}
\usepackage{url}
\usepackage{lipsum} % Used to test

\onehalfspacing
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand\bibname{References} %Change Bibliography to References


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
}% \ifcsname @supervisors\endcsname
% \\ \@supervisors \fi \\
% \vfill

\vfill

{\large \@date}
\end{titlepage}
\restoregeometry

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PAGE LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIDE MARGINS:
% \oddsidemargin 28pt      %   Left margin on odd-numbered pages.
% \evensidemargin 0pt      %   Left margin on even-numbered pages.
% \marginparwidth 40pt     %   Width of marginal notes.
%
% \marginparsep 12pt          % Horizontal space between outer margin and
%                             % marginal note
% \textwidth 15cm             % width of text
%
% % VERTICAL SPACING:
%                          % Top of page:
% \topmargin  10pt          %    distance from top of page to running head
% \headheight 14pt         %    Height of box containing running head.
% \headsep  1cm            %    Space between running head and text.
% \textheight 8.8in        %    space for text
% \footskip 30pt           %    Distance from baseline of box containing foot
%                          %    to baseline of last line of text.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header and footer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titlesec}
\let\footruleskip\undefined
\usepackage{fancyhdr}% http://ctan.org/pkg/fancyhdr

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

%% Fancy style for the main matter.
% \fancypagestyle{mainmatter}{%
%     \fancyhf{}
%     \renewcommand*\headrulewidth{0.5pt}
%     %% Page numbers on the top left and top right.
%     \fancyfoot[C]{\thepage}
%     %% Chapter name on the left (even) page.
%     \fancyhead[RE]{\nouppercase{\rightmark}}
%     %% Section name on the right (odd) page.
%     \fancyhead[LO]{\nouppercase{\leftmark}}
% }

%% The mainmatter style is default for normal pages.
%\pagestyle{mainmatter}

%% Print the current chapter and section at the top of the page in Uni Bremen red.
% \renewcommand*\chaptermark[1]{\markboth{\textcolor{unibremen}{\thechapter.\ } #1}{}}
% \renewcommand*\sectionmark[1]{\markright{\textcolor{unibremen}{\thesection.\ } #1}}

%% Chapter titles have the same layout as parts.
% \titleformat{\chapter}
%     [display]
%     {\flushleft}%format
%     {\bfseries\Large}%label
%     {0pt}%sep
%     {\bfseries\Large\thechapter.~}%before code
%     % [\vspace{-1cm}]
% \titleformat{name=\chapter,numberless}
%   [display]
%   {\flushleft}
%   {\bfseries\Large}
%   {0pt}
%   {\bfseries\Large}
%
% \titlespacing{\chapter}{0pt}{-50pt}{10pt}
%
% \titleformat{\section}
%     [display]
%     {\flushleft}%format
%     {\bfseries\large}%label
%     {0pt}%sep
%     {\bfseries\large\thesection.~}%before code
%
% \titleformat{\subsection}
%     [display]
%     {\flushleft}%format
%     {\bfseries\large}%label
%     {0pt}%sep
%     {\bfseries\large\thesubsection.~}%before code

\usepackage{sectsty}
\chapterfont{\color{black}}
\sectionfont{\color{black}}
\subsectionfont{\color{black}}
\subsubsectionfont{\color{black}}

\usepackage[bookmarksnumbered,bookmarksopen,hidelinks]{hyperref} % PDF bookmarks (viewer outline) and links; load last

% \titleformat{\section}
%   [block]
%   {\large\scshape\centering{\Roman{section}.}}
%   {}
%   {1em}
%   {}
%

\endinput
