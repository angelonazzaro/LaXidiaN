\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{laxidian}[2025/03/01 v2.0 Laxidian]
\LoadClass[a4paper,english,twoside,11pt]{book}

%%%% PACKAGES
% General
\RequirePackage[english]{babel} % Language support
\RequirePackage{fancyhdr} % Customizing headers and footers
\RequirePackage{geometry} % Setting page geometry and layout
\RequirePackage{hyperref} % Handle hyperrlinks
\RequirePackage{titlesec} % Customizing chapters, sections and subsections
\RequirePackage{blindtext}
\RequirePackage{changepage}
\RequirePackage[nomain, acronym, automake]{glossaries-extra}
\setabbreviationstyle[acronym]{long-short}

\renewcommand*{\glsnamefont}[1]{\textbf{#1}}
\renewcommand*{\acronymfont}[1]{\textbf{#1}}

\makeglossaries
\include{glossary}

% Text formatting and manipulation
\RequirePackage{lipsum} % Testing purposes
\RequirePackage{parskip} % Remove indentation of first paragraph
\RequirePackage{xcolor} % Colors
\RequirePackage{anyfontsize}

% Utitilies
\RequirePackage{soul} % Highlightning text
\RequirePackage{todonotes} % Better TODO notes
\RequirePackage{fontawesome5} % Icons
\RequirePackage[many]{tcolorbox} % Custom boxed environments
\RequirePackage{mfirstuc} % Capitlize words

% Math
% \RequirePackage{mathdesign}
\RequirePackage{tensor}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{physics}
\RequirePackage{siunitx}
\RequirePackage{mathtools}
\RequirePackage{calc}
\RequirePackage{definitions} % Custom definitions for Deep Learning
\RequirePackage{annotate-equations}

% Figures, Tables, Plots and Boxes
\RequirePackage{float} % Position float elements
\RequirePackage{wrapfig} % Wrapping text around figures
\RequirePackage{graphicx} % Including figures
\RequirePackage{tikz} % Graphics and diagrams
\RequirePackage{tikz-3dplot} % 3D support for tikz
\RequirePackage{pgfplots} % Plots
\pgfplotsset{compat=1.18}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage[amsmath]{ntheorem}
\RequirePackage[style=0, ntheorem]{mdframed} % Theorems and definitions

\graphicspath{{figures/}} % Set path for images

% Bibgliography
\RequirePackage{csquotes,xpatch} % recommended
\RequirePackage[backend=biber, style=alphabetic]{biblatex}

% Set font
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

%%%%%%%%%%%%%%%%

%%%% COMMANDS AND ENVS

\newcommand{\blankpage}{
    \clearpage
    \thispagestyle{empty}
    \null
    \clearpage
}

\newcommand{\textdash}{\enspace\textemdash\enspace}
\newcommand{\divider}{\setlength{\parindent}{0pt}\textcolor{black!30}{\rule{\linewidth}{0.6pt}}\smallskip\setlength{\parindent}{1.5em}}
\newcommand{\Acomment}[1]{\textquotedblleft \textit{#1}\textquotedblright}
\renewcommand\vec{\boldsymbol}

% Colors
\definecolor{base}{HTML}{1e1e1e}
\definecolor{red}{HTML}{fb464c}
\definecolor{orange}{HTML}{e9973f}
\definecolor{yellow}{HTML}{e0de71}
\definecolor{green}{HTML}{44cf6e}
\definecolor{cyan}{HTML}{53dfdd}
\definecolor{blue}{HTML}{027aff}
\definecolor{purple}{HTML}{7852ee}
\definecolor{pink}{HTML}{fa99cd}

% Soul
\DeclareRobustCommand{\hlred}[1]{{\sethlcolor{red!30}\hl{#1}}}
\DeclareRobustCommand{\hlgreen}[1]{{\sethlcolor{green!30}\hl{#1}}}
\DeclareRobustCommand{\hlblue}[1]{{\sethlcolor{blue!30}\hl{#1}}}


% Colors of hyperref
\hypersetup{
    colorlinks=true,
    linkcolor=purple!125,
    breaklinks=true,
    citecolor=purple,
    urlcolor=blue!75,
}

% Theorems and definitions
% hhttps://tex.stackexchange.com/questions/26041/different-colorcoded-theorems/26049#26049
\mdfsetup{%
    topline=false,
    rightline=false,
    bottomline=false,
    linewidth=3pt,
    font=\normalfont,
    innerleftmargin=15pt,
    innerrightmargin=0pt,
    skipabove=\baselineskip,
    skipabove=1.2\baselineskip,
}
\newmdtheoremenv[linecolor=purple]{definition}{Definition}[chapter]

\mdfsetup{%
    topline=false,
    rightline=false,
    bottomline=false,
    linewidth=3pt,
    font=\normalfont,
    innerleftmargin=15pt,
    innerrightmargin=0pt,
    skipabove=\baselineskip,
    skipabove=1.2\baselineskip,
}
\newmdtheoremenv[linecolor=blue]{theorem}{Theorem}[chapter]

% Callout Boxes

% Icons
\newcommand{\infoicon}{\faInfoCircle}
\newcommand{\tipicon}{\faLightbulb}
\newcommand{\faqicon}{\faQuestionCircle}
\newcommand{\successicon}{\faCheckCircle}
\newcommand{\dangericon}{\faTimesCircle}

% Function to map icon names to icon commands
\newcommand{\geticon}[1]{%
  \ifstrequal{#1}{info}{\infoicon}{%
  \ifstrequal{#1}{tip}{\tipicon}{%
  \ifstrequal{#1}{faq}{\faqicon}{%
  \ifstrequal{#1}{success}{\successicon}{%
  \ifstrequal{#1}{danger}{\dangericon}{\faInfoCircle}% default icon
}}}}}

% Function to map environment names to colors
\newcommand{\getcolor}[1]{%
  \ifstrequal{#1}{info}{blue}{%
  \ifstrequal{#1}{faq}{orange}{%
  \ifstrequal{#1}{danger}{red}{%
  \ifstrequal{#1}{success}{green}{%
  \ifstrequal{#1}{tip}{cyan}{blue}% default color
}}}}}

\newtcolorbox[auto counter, number within=chapter]{calloutbox}[3]{
    colback=#1!25,
    colbacktitle=#1!25,
    arc=3pt,
    boxrule=0pt, frame hidden,
    enhanced,
    left=10pt,
    right=10pt,
    bottom=4.5pt,
    top=4.5pt,
    breakable,
    before skip=0.5cm,
    after skip=0.5cm,
    toptitle=5pt,
    label=#2,
    fonttitle=\bfseries\large,
    title=\color{#1}{#3}
}

\newcounter{calloutinfo}[chapter]
\newcounter{calloutfaq}[chapter]
\newcounter{calloutdanger}[chapter]
\newcounter{calloutsuccess}[chapter]
\newcounter{callouttip}[chapter]

\NewDocumentEnvironment{callout}{D<>{info} o d || b}{
    % Assign color and counter prefix dynamically
    \ifstrequal{#1}{info}{%
        \def\calloutcolor{blue}%
        \def\calloutcounterprefix{calloutinfo}%
        \def\calloutprefix{I}%
    }{
    \ifstrequal{#1}{faq}{%
        \def\calloutcolor{orange}%
        \def\calloutcounterprefix{calloutfaq}%
        \def\calloutprefix{F}%
    }{
    \ifstrequal{#1}{danger}{%
        \def\calloutcolor{red}%
        \def\calloutcounterprefix{calloutdanger}%
        \def\calloutprefix{D}%
    }{
    \ifstrequal{#1}{success}{%
        \def\calloutcolor{green}%
        \def\calloutcounterprefix{calloutsuccess}%
        \def\calloutprefix{S}%
    }{
    \ifstrequal{#1}{tip}{%
        \def\calloutcolor{cyan}%
        \def\calloutcounterprefix{callouttip}%
        \def\calloutprefix{T}%
    }{
        \def\calloutcolor{blue} % Default color
        \def\calloutcounterprefix{calloutinfo}%
        \def\calloutprefix{C}%
    }}}}}

    % Default callout title
    \IfValueTF{#2} {
        \def\callouttitle{#2}
    }{
        \def\callouttitle{\capitalisewords{#1}}
    }

    % Handle label: Increment counter only if a label is provided
    \IfValueTF{#3}{
        \refstepcounter{\calloutcounterprefix} % Dynamically reference counter
        \def\calloutlabel{#3}
        \edef\calloutcounter{\calloutprefix.\thechapter.\arabic{\calloutcounterprefix}} % Format label
        \label{#3} % Attach label to the counter
    }{
        \def\calloutcounter{} % No counter for unlabeled callouts
        \def\calloutlabel{}
    }

    % Callout box display logic
    \IfValueTF{#3}{ % If labeled, include counter
        \begin{calloutbox}{\calloutcolor}{\calloutlabel}{\geticon{#1} \hspace{0.15pt} \calloutcounter \hspace{0.1cm} \callouttitle}
    }{
        \begin{calloutbox}{\calloutcolor}{\calloutlabel}{\geticon{#1} \hspace{0.15pt} \callouttitle}
    }
    #4
    \end{calloutbox}
}

% Numbering
\renewcommand{\thecalloutinfo}{I.\thechapter.\arabic{calloutinfo}}
\renewcommand{\thecalloutfaq}{F.\thechapter.\arabic{calloutfaq}}
\renewcommand{\thecalloutdanger}{CD.\thechapter.\arabic{calloutdanger}}
\renewcommand{\thecalloutsuccess}{S.\thechapter.\arabic{calloutsuccess}}
\renewcommand{\thecallouttip}{CT.\thechapter.\arabic{callouttip}}
\renewcommand{\theequation}{E.\thechapter.\arabic{equation}}
\renewcommand{\thetable}{T.\thechapter.\arabic{table}}
\renewcommand{\thefigure}{F.\thechapter.\arabic{figure}}
\renewcommand{\thedefinition}{D.\thechapter.\arabic{definition}}
\renewcommand{\thetheorem}{T.\thechapter.\arabic{theorem}}
% \renewcommand{\thelisting}{C.\thechapter.\arabic{listing}}

\newcommand{\laxidian}{LaXidiaN }

%%%%%%%%%%%%%%%

%%%% DOCUMENT STRUCTURE

% Fancy header - Alice in a Differentiable Wonderland
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}}
\fancyhead{} % clear all header fields
\fancyhead[LE]{{\color{black!40}\thepage}}
\fancyhead[RE]{\bfseries\normalfont {\color{black!40}\nouppercase{\rightmark}}}
\fancyhead[LO]{\bfseries\normalfont {\color{black!40}\nouppercase{Chapter \thechapter: \leftmark}}}
\fancyhead[RO]{{\color{black!40}\thepage}}
\fancyfoot{}
\fancyfoot[C]{\thepage}

% Chapter style - Alice in a Differentiable Wonderland
\definecolor{gray75}{gray}{0.75}
\newcommand{\hsp}{\hspace{20pt}}
\titleformat{\chapter}[hang]{\Huge\bfseries}{\selectfont \thechapter\hsp\textcolor{gray75}{|}\hsp}{0pt}{\Huge\bfseries}

\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}

% Cover Page
\newcommand{\university}{University of Pisa}
\newcommand{\department}{Computer Science Department}
\newcommand{\degree}{Master Degree Course}
\newcommand{\course}{Name of the Course}
\newcommand{\authorname}{Name Surname}
\newcommand{\academicyear}{Academic Year 2022-2023}

\newcommand{\coverpage}{
    \begin{titlepage}
    \changepage{}{}{}{}{}{}{}{}{}
    \begin{center}
    \includegraphics [width=.2\columnwidth, angle=0]{cover/stemma}\\ % height
    \vspace{1cm}
    {\LARGE \textbf{\textrm{\textsc{\university}}}}\\
    \vspace{0.5cm}
    {\Large \scshape \textrm{\textbf{\department}}}\\
    \vspace{0.5cm}
    {\Large \scshape \textrm{\textbf{\degree}}} \\
    \vspace{5cm}
    {\Huge \bfseries \course} \\
    \vspace{5cm}
    {\large \textbf{\textrm{\textsc{Author}}}: \textrm{\textsc{\authorname}}} \\
    \vspace{2cm}
    {\small \academicyear} \\
    \end{center}
    \end{titlepage}
}

% Front Matter
\AtBeginDocument {
    \coverpage
    \blankpage
    \begingroup
    \pagenumbering{roman}
    \phantomsection
    \addcontentsline{toc}{chapter}{Table of Contents}
    \tableofcontents
    \blankpage

    \phantomsection
    \addcontentsline{toc}{chapter}{List of Figure}
    \listoffigures
    \blankpage

    \phantomsection
    \addcontentsline{toc}{chapter}{List of Tables}
    \listoftables
    \blankpage

    \printglossary
    \blankpage

    \phantomsection
    \addcontentsline{toc}{chapter}{Bibliography}

    \endgroup
    \mainmatter
    \pagestyle{fancy}
    \pagenumbering{arabic}
}

% Bibliography
\addbibresource{bibliography.bib}
\AtEndDocument {
    \blankpage
    \printbibliography[heading=bibintoc, title=Bibliography]
    \blankpage
    \thispagestyle{empty}
    \vspace*{\fill}
    \begin{center}
        \begin{figure}[H]
            \centering
            \includegraphics[width=1.5in, clip, keepaspectratio]{logo/laxidian-logo}\label{fig:laxidian-logo}
        \end{figure}
        {\huge \textbf{LaXidiaN}} \medskip \\ {\large A \LaTeX template inspired by Obsidian.} \bigskip \\
        \textbf{This document was written using LaXidiaN, a sophisticated LaTeX template inspired by Obsidian. If you have any feedback you´d like to share, be it a complaint or a new feature you´d like to see, please open an issue or a pull request on our github repository.} \bigskip \\ %
        \href{https://github.com/robertodr01/LaXidiaN}{\underline{LaXidiaN repository}}
    \end{center}
    \vfill
}

%%%%%%%%%%%%%%%%