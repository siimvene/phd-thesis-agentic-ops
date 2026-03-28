% TTUPhD.cls - TalTech Doctoral Thesis Document Class
% Based on Overleaf template structure
% License: CC BY 4.0

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{TTUPhD}[2026/03/28 TalTech PhD Thesis]

% Base on book class
\LoadClass[12pt,a4paper,twoside,openright]{book}

% Required packages
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english,estonian]{babel}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{hyperref}
\RequirePackage{natbib}
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{listings}
\RequirePackage{xcolor}
\RequirePackage{amsmath}
\RequirePackage{pdfpages}

% Page geometry (TalTech requirements)
\geometry{
    a4paper,
    left=30mm,
    right=20mm,
    top=25mm,
    bottom=25mm,
    bindingoffset=10mm
}

% Line spacing
\onehalfspacing

% Header/footer style
\pagestyle{fancy}
\fancyhf{}
\fancyhead[LE,RO]{\thepage}
\fancyhead[RE]{\leftmark}
\fancyhead[LO]{\rightmark}
\renewcommand{\headrulewidth}{0.4pt}

% Chapter title formatting
\titleformat{\chapter}[display]
    {\normalfont\huge\bfseries}
    {\chaptertitlename\ \thechapter}
    {20pt}
    {\Huge}

% Hyperref setup
\hypersetup{
    colorlinks=true,
    linkcolor=black,
    citecolor=blue,
    urlcolor=blue
}

% Code listing style
\lstset{
    basicstyle=\ttfamily\small,
    breaklines=true,
    frame=single,
    numbers=left,
    numberstyle=\tiny\color{gray}
}

% Custom commands for thesis metadata
\newcommand{\thesistitle}[1]{\gdef\@thesistitle{#1}}
\newcommand{\thesistitleet}[1]{\gdef\@thesistitleet{#1}}
\newcommand{\thesisauthor}[1]{\gdef\@thesisauthor{#1}}
\newcommand{\supervisor}[1]{\gdef\@supervisor{#1}}
\newcommand{\cosupervisor}[1]{\gdef\@cosupervisor{#1}}
\newcommand{\opponent}[1]{\gdef\@opponent{#1}}
\newcommand{\defensedate}[1]{\gdef\@defensedate{#1}}
\newcommand{\issn}[1]{\gdef\@issn{#1}}
\newcommand{\isbn}[1]{\gdef\@isbn{#1}}

% Title page command
\newcommand{\maketitlepage}{
    \begin{titlepage}
        \centering
        \includegraphics[width=0.4\textwidth]{img/taltech-logo.pdf}\\[1cm]

        {\Large School of Information Technologies}\\[0.5cm]
        {\large Department of Software Science}\\[2cm]

        {\Large \@thesisauthor}\\[1cm]

        {\LARGE\bfseries \@thesistitle}\\[2cm]

        {\Large DOCTORAL THESIS}\\[3cm]

        \vfill

        {\large Tallinn \the\year}
    \end{titlepage}
}

% Estonian title page
\newcommand{\maketitlepageet}{
    \begin{titlepage}
        \centering
        \includegraphics[width=0.4\textwidth]{img/taltech-logo.pdf}\\[1cm]

        {\Large Infotehnoloogia teaduskond}\\[0.5cm]
        {\large Tarkvarateaduse instituut}\\[2cm]

        {\Large \@thesisauthor}\\[1cm]

        {\LARGE\bfseries \@thesistitleet}\\[2cm]

        {\Large DOKTORITÖÖ}\\[3cm]

        \vfill

        {\large Tallinn \the\year}
    \end{titlepage}
}

% Reverse title page (supervisor info)
\newcommand{\makereversepage}{
    \thispagestyle{empty}
    \vspace*{0.5\textheight}

    \noindent\textbf{Supervisor:} \@supervisor\\[0.5cm]
    \ifdef{\@cosupervisor}{\noindent\textbf{Co-supervisor:} \@cosupervisor\\[0.5cm]}{}
    \ifdef{\@opponent}{\noindent\textbf{Opponent:} \@opponent\\[0.5cm]}{}
    \ifdef{\@defensedate}{\noindent\textbf{Defense date:} \@defensedate\\[1cm]}{}

    \vfill

    \noindent\textbf{Declaration:}\\
    Hereby I declare that this doctoral thesis, my original investigation and achievement, submitted for the doctoral degree at Tallinn University of Technology, has not been submitted for any academic degree elsewhere.

    \vspace{1cm}

    \noindent\rule{6cm}{0.4pt}\\
    \@thesisauthor

    \vfill

    \ifdef{\@issn}{\noindent ISSN \@issn\\}{}
    \ifdef{\@isbn}{\noindent ISBN \@isbn\\}{}

    \noindent Copyright \the\year{} \@thesisauthor

    \clearpage
}

% Abstract environment
\newenvironment{abstracten}{
    \chapter*{Abstract}
    \addcontentsline{toc}{chapter}{Abstract}
}{}

\newenvironment{abstractet}{
    \chapter*{Kokkuvõte}
    \addcontentsline{toc}{chapter}{Kokkuvõte}
}{}

% Abbreviations
\newenvironment{abbreviations}{
    \chapter*{Abbreviations and Terms}
    \addcontentsline{toc}{chapter}{Abbreviations and Terms}
}{}

% Publications list
\newenvironment{publications}{
    \chapter*{List of Publications}
    \addcontentsline{toc}{chapter}{List of Publications}
}{}

% Author contributions
\newenvironment{contributions}{
    \chapter*{Author's Contributions}
    \addcontentsline{toc}{chapter}{Author's Contributions}
}{}

% CV environment
\newenvironment{curriculumvitae}{
    \chapter*{Curriculum Vitae}
    \addcontentsline{toc}{chapter}{Curriculum Vitae}
}{}

\newenvironment{elulookirjeldus}{
    \chapter*{Elulookirjeldus}
    \addcontentsline{toc}{chapter}{Elulookirjeldus}
}{}

\endinput
