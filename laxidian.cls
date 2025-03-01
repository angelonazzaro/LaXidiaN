\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{laxidian}[2025/03/01 v1.0 Laxidian]
\LoadClass[11pt]{book}

%%%% PACKAGES 
% General 
\RequirePackage[english]{babel} % Language support
\RequirePackage{fancyhdr} % Customizing headers and footers 
\RequirePackage{geometry} % Setting page geometry and layout
\RequirePackage{hyperref} % Handle hyperrlinks 
\RequirePackage{titlesec} % Customizing chapters, sections and subsections 
\RequirePackage{blindtext}

% Text formatting and manipulation 
\RequirePackage{lipsum} % Testing purposes
\RequirePackage{parskip} % Remove indentation of first paragraph
\RequirePackage{xcolor} % Colors
\RequirePackage{anyfontsize}

% Utitilies
\RequirePackage{soul} % Highlightning text 
\RequirePackage{todonotes} % Better TODO notes 
\RequirePackage{fontawesome5} % Icons 
\RequirePackage[most]{tcolorbox} % Custom boxed environments
\RequirePackage{mfirstuc} % Capitlize words 

% Math 
\RequirePackage[adobe-utopia]{mathdesign}
\RequirePackage{tensor} 
\RequirePackage{amsmath} 
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
 
%%%%%%%%%%%%%%%%

%%%% COMMANDS AND ENVS

\newcommand{\blankpage}{
      \clearpage
      \thispagestyle{empty}
      \null
      \clearpage
}

\newcommand{\divider}{\\ \setlength{\parindent}{0pt}\textcolor{black!30}{\rule{\linewidth}{0.6pt}}\smallskip\setlength{\parindent}{1.5em}\\}
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
    linkcolor=purple!75,
    breaklinks=true,
    citecolor=purple!75,
    urlcolor=blue!75,
}

% Tcolorbox defaults
\tcbset {
  base/.style={
    arc=0mm,
    bottomtitle=0.5mm,
    boxrule=0mm,
    colbacktitle=blue,
    colframe=blue,
    coltitle=black,
    fonttitle=\bfseries,
    left=2.5mm,
    leftrule=1mm,
    right=3.5mm,
    title={#1},
    toptitle=0.75mm,
    breakable,
    enhanced
  }
}

% Theorems and definitions
% hhttps://tex.stackexchange.com/questions/26041/different-colorcoded-theorems/26049#26049
\mdfsetup{%
    topline=false,
    rightline=false,
    bottomline=false,
    linewidth=3pt,
    font=\normalize,
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
    font=\normalize,
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

\newtcolorbox[auto counter, number within=chapter]{callout}[3]{
    colback=#1!25,
    colbacktitle=#1!25,
    arc=3pt,
    boxrule=0pt, frame hidden,
    enhanced,
    left=10pt,
    right=10pt,
    top=4.5pt,
    bottom=4.5pt,
    breakable,
    label=#2,
    before skip=0.5cm,
    after skip=0.5cm,
    toptitle=4pt,
    fonttitle=\bfseries\large,
    title=\color{#1}{#3}
}

\newenvironment{info}[3][Info]{
    \begin{callout}{blue}{#1}{\infoicon \hspace{0.2cm} #2}
        #3
}{
    \end{callout}
}

\newenvironment{tip}[3][Tip]{
    \begin{callout}{cyan}{#1}{\tipicon \hspace{0.2cm} #2}
        #3
}{
    \end{callout}
}

\newenvironment{success}[3][Tip]{
    \begin{callout}{green}{#1}{\successicon \hspace{0.2cm} #2}
        #3
}{
    \end{callout}
}

\newenvironment{faq}[3][Faq]{
    \begin{callout}{orange}{#1}{\faqicon \hspace{0.2cm} #2}
        #3
}{
    \end{callout}
}

\newenvironment{danger}[3][Faq]{
    \begin{callout}{red}{#1}{\dangericon \hspace{0.2cm} #2}
        #3
}{
    \end{callout}
}

% Numbering
\renewcommand{\theequation}{E.\thechapter.\arabic{equation}}
\renewcommand{\thetable}{T.\thechapter.\arabic{table}}
\renewcommand{\thefigure}{F.\thechapter.\arabic{figure}}
\renewcommand{\thedefinition}{D.\thechapter.\arabic{definition}}
% \renewcommand{\thelisting}{C.\thechapter.\arabic{listing}}

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

% Chapter style - Alice in a Differentiable Wonderland
\definecolor{gray75}{gray}{0.75}
\newcommand{\hsp}{\hspace{20pt}}
\titleformat{\chapter}[hang]{\Huge\bfseries}{\selectfont \thechapter\hsp\textcolor{gray75}{|}\hsp}{0pt}{\Huge\bfseries}

\setcounter{tocdepth}{3}

% Front Matter
\AtBeginDocument {
    \begingroup 
        \pagenumbering{roman}
        \tableofcontents
        \blankpage
    
        \listoffigures
        \blankpage
        
        \listoftables
        \blankpage
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