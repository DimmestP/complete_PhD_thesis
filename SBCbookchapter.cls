%
% SBCbookchapter - SBC book chapters
%
% Copyright (C) 2005 Rafael Bohrer Ávila
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%
% Charset: ISO8859-1 (latin-1) áéíóúç
%
% $Id$
%

%=======================================================================
% Identification
%=======================================================================
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{SBCbookchapter}[2005/05/18 v0.1 SBC book chapter]

%=======================================================================
% Declaration of class options
%=======================================================================
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

%=======================================================================
% Main class inheritance and package loading
%=======================================================================
\LoadClass[12pt,a4paper,twoside]{report}
\RequirePackage{times}
\RequirePackage{mathptmx}

%=======================================================================
% Page layout: margins, numbering, paragraph skips and indentation
%=======================================================================
% top margin = 10 + 10 + 15 = 35mm
\setlength{\topmargin}{10mm}
\setlength{\headheight}{10mm}
\setlength{\headsep}{15mm}
\addtolength{\topmargin}{-1in}
\setlength{\topskip}{18pt}

% bottom margin = 297 - top margin - 237 = 25mm
\setlength{\textheight}{237mm}
\setlength{\footskip}{15mm}

% left/right margin = (210 - 150) / 2 = 30mm
\setlength{\oddsidemargin}{30mm}
\setlength{\textwidth}{150mm}
\addtolength{\oddsidemargin}{-1in}
\setlength{\evensidemargin}{\oddsidemargin}

\pagestyle{empty}

% parskip must be a rubber length
\setlength{\parskip}{6pt}
%\setlength{\parskip}{\fill}
%\addtolength{\parskip}{6pt}
\setlength{\parindent}{.5in}

%=======================================================================
% Font sizes
%=======================================================================
\newcommand{\chapnamesize}{\fontsize{18}{23}\selectfont}
\newcommand{\chapnumsize}{\fontsize{48}{60}\selectfont}
\newcommand{\titlesize}{\fontsize{20}{25}\selectfont}
\newcommand{\authorsize}{\fontsize{14}{18}\selectfont}
\newcommand{\sectionsize}{\fontsize{13}{17}\selectfont}
\newcommand{\captionsize}{\fontsize{10}{12}\selectfont}

%=======================================================================
% Redefinition of \maketitle
%=======================================================================
\renewcommand{\maketitle}{%
	\noindent%
	{\chapnamesize\textbf{\chaptername}\\[1ex]}
	{\chapnumsize\textbf{\thechapter}\\[2ex]}
	{\titlesize\textbf{\@title}\\[4ex]}
}


\newcommand{\makethesistitle}{%
    %% Get the height and if it's < 4cm set it to 4cm.
    \setlength{\titleboxheight}{\ht\titlebox + \dp\titlebox}%
    \ifthenelse{\lengthtest{ \titleboxheight < 4cm }}{
       \setlength{\titleboxheight}{4cm}}{}%
    \thispagestyle{empty}%
    \null\vfil%
    \begin{center}%
      {%\parskip=0pt
      %% Title in a parbox. Set its height to \titleboxheight
      \vskip 1em%
      {\Huge\defaultfont\bfseries%
        \parbox[c][\titleboxheight][c]{0.9\linewidth}{%
          \begin{onehalfspace}%
            \centering%
            \@title%
          \end{onehalfspace}%
        }%
      }%
      \vskip 3em%
      \vskip 5em%
      %% Author
      {\fontfamily{\rmdefault}\selectfont%
      {\LARGE\itshape%
      \parbox[c]{0.9\linewidth}{%
        \centering%
        \@author%
      }}}%
      %% University crest. Check crestflag.
        \vskip 10mm%
        \centering%
          \includegraphics[width=2in]{avatar-roundel-blackonwhite}\par%
        \vskip 10mm
      %% Qualification
      {\fontfamily{\rmdefault}\selectfont%
      {\LARGE%
      \parbox[c]{10cm}{%
        \begin{onehalfspace}%
          \centering%
          Doctor of Philosophy%
        \end{onehalfspace}%
      }\\%
      %% School
      [2mm] {School of Biological Sciences} \\%
      %% University
      [2mm] {University of Edinburgh} \\%
      %% Date
      [10mm]\@date
      }}}%
    \end{center}\par%
    \vfil\null}

%=======================================================================
% [Re]definition of environments abstract and resumo
%=======================================================================
\renewenvironment{abstract}[1][Abstract]{%
	\begin{center}
	\textbf{#1}
	\end{center}
    \onehalfspacing
}{%
}

\newenvironment{resumo}{%
	\begin{abstract}[Resumo]
}{%
	\end{abstract}
}

%=======================================================================
% Section heading and numbering
%=======================================================================
\renewcommand{\section}{%
    \onehalfspacing
	\@startsection{section}{1}{0pt}{-6pt}{.1pt}
		{\reset@font\sectionsize\bfseries}%
}
\renewcommand{\subsection}{%
	\@startsection{subsection}{2}{0pt}{-6pt}{.1pt}
		{\reset@font\bfseries}%
}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\def\@seccntformat#1{\csname the#1\endcsname.\hspace{.5em}}

%=======================================================================
% Figure and table captions
%=======================================================================
\setlength{\abovecaptionskip}{6pt}
\setlength{\belowcaptionskip}{6pt}
\def\@makecaption#1#2{%
	\def\@fmt{\sffamily\captionsize\textbf{#1. #2}}%
	\vskip\abovecaptionskip
	\sbox\@tempboxa{\@fmt}%
	\ifdim \wd\@tempboxa >\hsize
		\setlength{\@tempdima}{\textwidth}%
		\addtolength{\@tempdima}{-16mm}%
		\centerline{\parbox{\@tempdima}{\@fmt}}
	\else
		\centerline{\@fmt}
	\fi
	\vskip\belowcaptionskip
}
\renewcommand{\thefigure}{\thechapter.\arabic{figure}}
\renewcommand{\thetable}{\thechapter.\arabic{table}}