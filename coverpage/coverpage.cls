%%% coverpage.cls -- class file to produce a cover page for
%%%                  `kasa-thesis.cls'

%% Author: Masaya Maeda <m-maeda@ics.es.osaka-u.ac.jp>
%% $Id: coverpage.cls,v 1.2 2001/03/19 07:32:41 m-maeda Exp $

%% v1.3 by Yasunori Ishihara (2007/02/28)

%%% Commands:

%% the followings are mandatory:
%%
%%    \題目       -- title of your thesis
%%    \著者名     -- your name
%%    \提出日     -- submission due of the thesis
%%    \所属       -- affliation
%%    \論文の種類 -- type of the thesis; ``特別研究報告'' 
%%                   or ``修士学位論文''
%%
%% the following two commands are optional; if you write your thesis
%% in English, you need these commands.
%%
%%    \英文題目   -- title in English if you write thesis in English
%%    \英文著者名 -- your name in English
%%
%% finally, the commands below would produce a cover page:
%%
%%    \表紙       -- as you guess
%%    \背表紙     -- ditto

%%% Code:

\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{coverpage}[2007/02/28 v1.3]

\LoadClassWithOptions{jarticle}[10pt,a4paper]
\RequirePackage[dvips]{graphicx}

\setlength\headheight{\z@}
\setlength\headsep{\z@}
\setlength\topskip{-5mm}
\setlength\footskip{\z@}

\newlength\tempdima
\newlength\tempdimb
\newlength\tempdimc
\setlength\topmargin{5.1cm}
%%    \setlength\topmargin{5.6cm} v1.2
\addtolength\topmargin{-1in}
\setlength\oddsidemargin{3.8cm}
\addtolength\oddsidemargin{-1in}
\setlength\textwidth{14cm}
\setlength\tempdima{.5\p@}
\setlength\tempdimb{3.5cm}
\setlength\tempdimc{11.5cm}
\setlength\textheight{4\tempdima}
\addtolength\textheight{3\tempdimb}
%%    \addtolength\textheight{2\tempdimb} v1.2
\addtolength\textheight{\tempdimc}

\def\@title{}
\def\題目#1{\gdef\@title{#1}}
\def\@author{}
\def\著者名#1{\gdef\@author{#1}}
\def\@institute{}
\def\所属#1{\gdef\@institute{#1}}
\def\@deadline{}
\def\提出日#1{\gdef\@deadline{#1}}
\def\@thesisname{}
\def\論文の種類#1{\gdef\@thesisname{#1}}
\def\e@title{}
\def\英文題目#1{\gdef\e@title{#1}}
\def\e@author{}
\def\英文著者名#1{\gdef\e@author{#1}}

\def\表紙{%
    \newpage
    \hrule \@width\textwidth \@height\tempdima
    \vbox to\tempdimb{%
        \vss
        \nointerlineskip
        \hb@xt@\textwidth{\kanjiskip=0pt\@plus1fill\@minus1fill
            \hskip2cm\Huge\bfseries\@thesisname\hskip2cm}
        \vss}%
    \hrule \@width\textwidth \@height\tempdima
    \vbox to\tempdimc{%
        \vskip 1cm
        \hb@xt@\textwidth{\hss\LARGE\bfseries 題\quad 目\hss}%
        \vskip 5mm
        \hb@xt@\textwidth{%
            \hss
            \vbox{\hsize=\paperwidth
                \begin{center}
                    \ifx\e@title\@empty
                      \LARGE\@title
                    \else
                      \LARGE\e@title\\
                      \vskip 3mm
                      \Large\@title
                    \fi
                \end{center}}
            \hss}
        \vss
        \hb@xt@\textwidth{\hss\LARGE\bfseries 指\quad 導\quad 教\quad 員\hss}%
        \vskip 5mm
        \hb@xt@\textwidth{\hss\LARGE 藤原 融 教授\hss}
        \vskip 1cm}%
    \hrule \@width\textwidth \@height\tempdima
    \vbox to\tempdimb{%
        \vss
        \hb@xt@\textwidth{\hss\LARGE\bfseries 報\quad 告\quad 者\hss}%
        \vskip 5mm
        \hb@xt@\textwidth{\hss\LARGE\@author\hss}
        \vss}%
    \hrule \@width\textwidth \@height\tempdima%
    \vbox to\tempdimb{%
        \vss
        \hb@xt@\textwidth{\hss\large\@deadline\hss}%
        \nointerlineskip
        \vskip 5mm
        \hb@xt@\textwidth{%
            \vbox{\hsize=\textwidth
                \begin{center}
                    \large\bfseries\@institute
                \end{center}}}%
        \vss}%
    \newpage
}

\def\背表紙{%
    \newpage
    \setlength\textheight{\paperheight}
    \setlength\textwidth{\paperwidth}
    \setlength\topmargin{\paperheight}
    \addtolength\topmargin{-25cm}
    \setlength\topmargin{.5\topmargin}
    \addtolength\topmargin{-1in}
    \setlength\oddsidemargin{3cm}
    \addtolength\oddsidemargin{-1in}
    \setlength\@tempdima{25cm}
    \addtolength\@tempdima{-1pt}
    \setlength\@tempdimb{1cm}
    \addtolength\@tempdimb{-1pt}
    \rotatebox{-90}{\hbox{%
            \vbox to1cm{%
                \hrule \@height.5pt \@width25cm
                \hb@xt@25cm{%
                    \vrule \@width.5pt \@height\@tempdimb
                    \hskip 5mm
                    \hbox{\vbox to\@tempdimb{\vss
                            \hbox{\ifx\e@title\@empty \@title
                                \else\small\e@title\fi}%
                            \vss}}
                    \hfill
                    \hbox{\vbox to\@tempdimb{\vss
                            \hbox{\ifx\e@author\@empty \@author
                                \else\small\e@author\fi}%
                            \vss}}
                    \hskip 5mm
                    \vrule \@width.5pt \@height\@tempdimb}
                \hrule \@height.5pt \@width25cm
                }}}
    \newpage
}

\pagestyle{empty}

%%% coverpage.cls ends here
