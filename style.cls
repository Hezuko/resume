\ProvidesClass{style}[2025/10/04 v3.1 Style class (manual header)]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

%----------------------------------------------------------------------------------------
%  REQUIRED PACKAGES AND MISC CONFIGURATIONS
%----------------------------------------------------------------------------------------
\usepackage[parfill]{parskip}   % No paragraph indentation
\usepackage{array}              % Bold tabular columns
\usepackage{ifthen}             % ifthenelse
\usepackage{graphicx}           % Images
\pagestyle{empty}               % No headers/footers

%----------------------------------------------------------------------------------------
%  MARGINS
%----------------------------------------------------------------------------------------
\usepackage{geometry}
\geometry{
  top=0.3in,
  bottom=0.3in,
  left=0.3in,
  right=0.3in,
  %showframe,
}

%----------------------------------------------------------------------------------------
%  NAME & ADDRESS (SAFE, OPTIONAL)
%----------------------------------------------------------------------------------------
% On stocke de façon sûre (pas de redéfinition récursive)
\newcommand\@cvname{}                % vide par défaut
\newcommand{\name}[1]{\def\@cvname{#1}}

\newcommand\addressSep{$\diamond$}
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

\newcommand{\address}[1]{%
  \@ifundefined{@addressone}{%
    \def \@addressone {#1}%
  }{%
    \@ifundefined{@addresstwo}{%
      \def \@addresstwo {#1}%
    }{%
      \def \@addressthree {#1}%
    }%
  }%
}

\newcommand{\printaddress}[1]{%
  \begingroup
    \def \\ {\addressSep\ }%
    \centerline{#1}%
  \endgroup
  \par \smallskip
}

\newcommand{\printname}{%
  \begingroup
    \ifx\@cvname\@empty\else
      \hfil{\MakeUppercase{\huge\bfseries \@cvname}}\hfil
      \bigskip\break
    \fi
  \endgroup
}

% --- PLUS AUCUNE REDÉFINITION DE \document ---
% (Avant: \renewcommand{\document}{...})
% On fournit plutôt une commande explicite :
\newcommand{\makecvheader}{%
  \printname
  \@ifundefined{@addressone}{}{\printaddress{\@addressone}}%
  \@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}}%
  \@ifundefined{@addressthree}{}{\printaddress{\@addressthree}}%
}

%----------------------------------------------------------------------------------------
%  SECTION FORMATTING
%----------------------------------------------------------------------------------------
\newenvironment{rSection}[1]{%
  \medskip
  \MakeUppercase{\textbf{#1}}
  \medskip
  \hrule
  \begin{list}{}{%
    \setlength{\leftmargin}{1.5em}%
  }%
  \item[]
}{%
  \end{list}
}

%----------------------------------------------------------------------------------------
%  WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------
\newenvironment{rSubsection}[4]{%
  \textbf{#1} \hfill {#2}%
  \ifthenelse{\equal{#3}{}}{}{%
    \\ \textit{#3} \hfill \textit{#4}%
  }%
  \smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em}%
    \setlength{\itemsep}{-0.5em} \vspace{-0.5em}%
}{%
  \end{list}
  \vspace{0.5em}%
}
