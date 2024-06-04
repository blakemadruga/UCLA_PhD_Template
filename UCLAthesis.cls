%
% UCLA THESIS/DISSERTATION CLASS -- for LaTeX version 2e
%	(C) Copyright 1995 by John Heidemann.
% Taken from UCLA THESIS/DISSERTATION CLASS (version 0.94 BETA, 5/23/91)
%	(C) Copyright 1988 Richard B. Wales.  All Rights Reserved.
%	by Richard B. Wales.
% Taken from DISSERTATION style (1/10/86)
%	by Dorab Patel and Eduardo Krell
% Taken from REPORT style
%	[Copyright (C) 1985 by Leslie Lamport]
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Notes on the LaTeX2e port:
%
%  I have done a quick port of Rich Wales' "thesis" LaTeX 2.09
%  document style to LaTeX2e.  The major changes were in option
%  handling and font selection.  Additionally, I renamed the files
%  to fit within MS-DOS 8.3 constraints (even though I neither use
%  nor advocate MS-DOS).
%      -johnh
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
% Version checking.
%%%
\NeedsTeXFormat{LaTeX2e}
\def\uclathesversion{1.0}
\def\uclathesdate{1995/05/11}
\ProvidesClass{uclathes}[\uclathesdate, \uclathesversion]
\typeout{LaTeX2e port copyright (C) 1995 by John Heidemann.}
\typeout{Copyright (C) 1988 by Richard B. Wales, copyright (C) 1985 by Leslie Lamport.}
\typeout{Please send bug reports and graduation notices to <johnh@ficus.cs.ucla.edu>.}

%
% First load critical packages (needed for option processing).
%
\RequirePackage{ifthen}

% Internally, this forces all headers checked by the University to meet the formatting
% guidelines.
\def\header#1{\uppercase{#1}}

% Get the title page macros.
%\input{uclathma.clo}

%%------------------------------------------------------------------dt

% UCLA THESIS MACROS
% (C) Copyright 1995 by John Heidemann,
% derived from work (C) Copyright 1988 Richard B. Wales,
% taken in turn from material Copyright (C) 1985 by Leslie Lamport.

%%%
% Version checking.
%%%
\NeedsTeXFormat{LaTeX2e}
\def\uclathmaversion{1.0 beta}
\def\uclathmadate{1995/08/25}
\ProvidesFile{uclathma}[\uclathmadate, \uclathmaversion]

% The following commands set the thesis/dissertation title and author,
% as well as the type size for printing the title.

\def\@title{NO TITLE!?!}
\def\@author{NO AUTHOR!?!}
\def\@titlesize{\normalsize}  % 2016: Cannot be larger than other text.
\renewcommand{\title}[1]{\def\@title{#1}}
\renewcommand{\author}[1]{\def\@author{#1}}
\newcommand{\titlesize}[1]{\def\@titlesize{#1}}

% The following commands set the department name.

\newif\if@department
\newcommand{\department}[1]{\def\@department{#1}\@departmenttrue}
\newcommand{\nodepartment}{\@departmentfalse}
\department{NO DEPARTMENT!?!}

% The following commands will process the "MA", "MS", "PhD", or "EdD"
% option.  (The default is "PhD".)

\newcommand{\thesis}[1]
   {\def\@thesisname{thesis}
    \def\@Thesisname{Thesis}
    \def\@degreename{#1}
   }
\newcommand{\blahfoo}[1]
   {\def\@thesisname{blahfoo}
    \def\@Thesisname{Blahfoo}
    \def\@degreename{#1}
   }
\newcommand{\dissertation}[1]
   {\def\@thesisname{dissertation}
    \def\@Thesisname{Dissertation}
    \def\@degreename{#1}
   }
\dissertation{Doctor of Philosophy}	% default

% The following commands set the year in which the degree will be
% awarded, as well as the year of copyright.

\def\@degreeyear{\number\month}
\def\@degreemonth{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi}
\def\@copyrightyear{\number\year}
\newif\if@cyrset
\@cyrsetfalse
\newcommand{\degreeyear}[1]
   {\def\@degreeyear{#1}\if@cyrset\else\def\@copyrightyear{#1}\fi}
\newcommand{\degreemonth}[1]{\def\@degreemonth{#1}}
\newcommand{\copyrightyear}[1]{\def\@copyrightyear{#1}\@cyrsettrue}

%%------------------------------------------------------------------dt

\DeclareOption{PhD}{}			% default -- nothing more to do
\DeclareOption{MA}{\thesis{Master of Arts}}
\DeclareOption{MS}{\thesis{Master of Science}}
\DeclareOption{EdD}{\dissertation{Doctor of Education}\@departmentfalse}


% The following commands will process the "single" or "double" option.
% (The default is "double".)  This controls inter-line spacing.  Note
% that the \@doublespacing value is computed by dividing the inter-line
% spacing for 3 lines/inch (1/3 inch, or 24.09 points) by the spacing
% specified for "normalsize" type (15.6 points).

\def\@singlespacing{1.0}
\def\@doublespacing{1.544}	  % see above for explanation of value
\let\@spacing=\@doublespacing
% \DeclareOption{single}{\typeout{*** Sorry, single spacing disabled ***}}
\DeclareOption{single}{\let\@spacing=\@singlespacing}
\DeclareOption{double}{\let\@spacing=\@doublespacing}

\DeclareOption{draft}{\overfullrule 5pt}  % Causes overfull hboxes to be marked.

%
% Optional title hyphenation added 14-Jun-95 by johnh.
%
\newboolean{hyphenatetitles}
\setboolean{hyphenatetitles}{true}
\DeclareOption{nohyphenatetitles}{\setboolean{hyphenatetitles}{false}}
\DeclareOption{hyphenatetitles}{\setboolean{hyphenatetitles}{true}}

% The \ProcessOptions command does the options.

\ProcessOptions

% The "uclath17.sty" file defines things that depend on the type size.
% In order to meet the UCLA requirements for minimum size of print in a
% thesis or dissertation, only one size (12-point) is supported.

%\input{uclath17.clo}\relax

%%---------------------------------------------------------------dt

% POINT SIZE OPTION for UCLA thesis style
% (C) Copyright 1995 by John Heidemann,
% derived from work (C) Copyright 1988 Richard B. Wales,
% taken in turn from material Copyright (C) 1985 by Leslie Lamport.

%  ****************************************
%  *               FONTS                  *
%  ****************************************
%

%%%
% Version checking.
%%%
\NeedsTeXFormat{LaTeX2e}
\def\uclathxiiversion{1.0 beta}
\def\uclathxiidate{1995/05/11}
\ProvidesFile{uclath17.clo}[\uclathxiidate, \uclathxiiversion]


\lineskip 1pt            % \lineskip is 1pt for all font sizes.
\normallineskip 1pt
\renewcommand\baselinestretch{\@spacing}  % single or double spacing

% Each size-changing command \SIZE executes the command
%        \@setsize\SIZE{BASELINESKIP}\FONTSIZE\@FONTSIZE
% where:
%   BASELINESKIP = Normal value of \baselineskip for that size.  (Actual 
%                  value will be \baselinestretch * BASELINESKIP.)
%
%  \FONTSIZE     = Name of font-size command.  The currently available
%                  (preloaded) font sizes are: \vpt (5pt), \vipt (6pt),
%                  \viipt (etc.), \viiipt, \ixpt, \xpt, \xipt, \xiipt,
%                  \xivpt, \xviipt, \xxpt, \xxvpt.
%  \@FONTSIZE    = The same as the font-size command except with an
%                  '@' in front---e.g., if \FONTSIZE = \xivpt then
%                  \@FONTSIZE = \@xivpt.
%
% For reasons of efficiency that needn't concern the designer,
% the document style defines \@normalsize instead of \normalsize .  This is
% done only for \normalsize, not for any other size-changing commands.

% NOTE:  All line spacings have been set to the nominal value times 1.3
% (e.g., 15.6pt for 12-point type).  If you change this spacing, you
% must make a corresponding change to the "\@doublespacing" value in the
% "thesis.sty" file in order to preserve 3-lines/inch double spacing.

% johnh: my font sizes are taken from LaTeX2e's bk12.clo.

\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xiipt{14.5}%
   \abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}

\newcommand\small{%
   \@setfontsize\small\@xipt{13.6}%
   \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 9\p@ \@plus3\p@ \@minus5\p@
               \parsep 4.5\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\footnotesize{%
   \@setfontsize\footnotesize\@xpt\@xiipt
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 6\p@ \@plus2\p@ \@minus2\p@
               \parsep 3\p@ \@plus2\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\newcommand\scriptsize{\@setfontsize\scriptsize\@viiipt{9.5}}
\newcommand\tiny{\@setfontsize\tiny\@vipt\@viipt}
\newcommand\large{\@setfontsize\large\@xivpt{18}}
\newcommand\Large{\@setfontsize\Large\@xviipt{22}}
\newcommand\LARGE{\@setfontsize\LARGE\@xxpt{25}}
\newcommand\huge{\@setfontsize\huge\@xxvpt{30}}
\let\Huge=\huge

\normalsize  % Choose the normalsize font.


%  ****************************************
%  *            PAGE LAYOUT               *
%  ****************************************
%
% All margin dimensions measured from a point one inch from top and side
% of page.  A little extra (0.1 in) is added on each side to ensure that
% the text will fall within the UCLA thesis margin limits even if photo-
% copying enlarges or misaligns it slightly.

%
% According to the Feb. 1995 revision of RfTaDP,
% margins are to be 1.5'' left, 1'' top and right, and 1.5'' bottom.
% I've checked these margins with dvips 5.58 output to a LaserJet IV
% and they matched.   -johnh, 20-Jun-95
%

% SIDE MARGINS:
%\oddsidemargin 0.65in     %   Note that \oddsidemargin = \evensidemargin
%\evensidemargin 0.65in    % these are added to the 1 inch margin.

% VERTICAL SPACING:        
                          % Top of page:
%\topmargin 0.15in         %    Nominal distance from top of page to top
                          %    of box containing running head.
\headheight 0pt           %    Height of box containing running head.
\headsep 0pt              %    Space between running head and text.
% \topskip = 10pt         %    '\baselineskip' for first line of page.
                          % Bottom of page:
% johnh: footheight unused
% \footheight 12pt          %    Height of box containing running foot.
%\footskip 0.25in            %    Distance from baseline of box containing
\footskip 0.5in            %    Distance from baseline of box containing
                            %    foot to baseline of last line of text.
% johnh: footskip -> 0.8in from 0.6in to meet RFTADP guidelines
% (probably with LaTeX209 footheight was added to footskip).

% DIMENSION OF TEXT:

\textheight 9in       % Height of text (including footnotes and fig-
                         % ures, excluding running head and foot).
%\textwidth 6.5in         % Width of text line.
\textwidth 6.25in         % Width of text line.
%\textwidth 6in 

% A \raggedbottom command causes 'ragged bottom' pages: pages set to
% natural height instead of being stretched to exactly \textheight.

% FOOTNOTES:

% As of 2016, footnotes must be separated by a single blank line.
% Original value here was 8.4pt so we just doubled it.
\footnotesep 16.8pt   % Height of strut placed at the beginning of every
                      % footnote = height of normal \footnotesize strut,
                      % so no extra space between footnotes.

\skip\footins 10.8pt plus 9pt minus 2pt  % Space between last line of
                                         % text & top of first footnote.

% FLOATS: (a float is something like a figure or table)
%
%  FOR FLOATS ON A TEXT PAGE:
%
%    ONE-COLUMN MODE OR SINGLE-COLUMN FLOATS IN TWO-COLUMN MODE:
\floatsep 14pt plus 2pt minus 4pt        % Space between adjacent floats moved
                                         % to top or bottom of text page.
\textfloatsep 20pt plus 2pt minus 4pt    % Space between main text and floats
                                         % at top or bottom of page.
\intextsep 14pt plus 4pt minus 4pt       % Space between in-text figures and 
                                         % text.
% johnh: \@maxsep unused
% \@maxsep 20pt                            % The maximum of \floatsep, 
                                         % \textfloatsep and \intextsep (minus
                                         % the stretch and shrink).

%  FOR FLOATS ON A SEPARATE FLOAT PAGE OR COLUMN:
%    ONE-COLUMN MODE OR SINGLE-COLUMN FLOATS IN TWO-COLUMN MODE:
\@fptop 0pt plus 1fil    % Stretch at top of float page/column. (Must be    
                         % 0pt plus ...)                                    
\@fpsep 10pt plus 2fil    % Space between floats on float page/column.       
\@fpbot 0pt plus 1fil    % Stretch at bottom of float page/column. (Must be 
                         % 0pt plus ... )                                   


%  ****************************************
%  *           PARAGRAPHING               *
%  ****************************************
%
\parskip 4pt plus 1pt              % Extra vertical space between paragraphs.
\parindent 1.5em                   % Width of paragraph indentation.
\topsep 10pt plus 4pt minus 6pt    % Extra vertical space, in addition to 
                                   % \parskip, added above and below list and
                                   % paragraphing environments.
\partopsep 3pt plus 2pt minus 2pt  % Extra vertical space, in addition to 
                                   % \parskip and \topsep, added when user
                                   % leaves blank line before environment.
\itemsep 5pt plus 2.5pt minus 1pt  % Extra vertical space, in addition to
                                   % \parskip, added between list items.

% The following page-breaking penalties are defined

\@lowpenalty   51      % Produced by \nopagebreak[1] or \nolinebreak[1]
\@medpenalty  151      % Produced by \nopagebreak[2] or \nolinebreak[2]
\@highpenalty 301      % Produced by \nopagebreak[3] or \nolinebreak[3]

\@beginparpenalty -\@lowpenalty    % Before a list or paragraph environment.
\@endparpenalty   -\@lowpenalty    % After a list or paragraph environment.
\@itempenalty     -\@lowpenalty    % Between list items.

% \clubpenalty         % 'Club line'  at bottom of page.
% \widowpenalty        % 'Widow line' at top of page.
% \displaywidowpenalty % Math display widow line.
% \predisplaypenalty   % Breaking before a math display.
% \postdisplaypenalty  % Breaking after a math display.
% \interlinepenalty    % Breaking at a line within a paragraph.
% \brokenpenalty       % Breaking after a hyphenated line.


%    ****************************************
%    *        CHAPTERS AND SECTIONS         *
%    ****************************************
%

\def\part{\cleardoublepage   % Starts new page.
   \thispagestyle{plain}     % Page style of part page is 'plain'
    \@tempswafalse           %  @tempswa := false
  \hbox{}\vfil               % Add fil glue to center title  
  \bgroup  \centering        % BEGIN centering
  \secdef\@part\@spart}     

\def\@part[#1]#2{\ifnum \c@secnumdepth >-2\relax  % IF secnumdepth > -2
        \refstepcounter{part}                     %   THEN step part counter
        \addcontentsline{toc}{part}{\thepart      %        add toc line
        \hspace{1em}#1}\else                      %   ELSE add unnumbered line
        \addcontentsline{toc}{part}{#1}\fi        % FI
   \markboth{}{}
    \ifnum \c@secnumdepth >-2\relax  % IF secnumdepth > -2
      \normalsize\bfseries Part \thepart   %   THEN Print 'Part' and number
    \par                             %         in \normalsize bold.
    \vskip 20pt \fi                  %        Add space before title.
    \huge \bfseries                        % FI
    #1\@endpart}                     % Print Title in \huge bold.
    
% \@endpart finishes the part page
%
\def\@endpart{\par\egroup     % END centering 
   \vfil\newpage              % End page with 1fil glue.
   \if@tempswa                % IF @tempswa = true       
     \twocolumn               %   THEN \twocolumn 
   \fi}                       % FI

\def\@spart#1{\normalsize \bfseries            % Print title in \normalsize boldface
   #1\@endpart}

% \@makechapterhead {TEXT} : Makes the heading for the \chapter command.
%

\def\@makechapterhead#1{             % Heading for \chapter command
  \vspace*{20pt}                     % Space at top of text page.
  { \parindent 0pt \raggedright 
    \ifnum \c@secnumdepth >\m@ne     % IF secnumdepth > -1 THEN
      \centering \Large\bfseries \@chapapp{} \thechapter % Print 'CHAPTER' and number.
      \par 
      \vskip 10pt                    % Space between number and title.
      \fi
    \centering \Large\bfseries                        % Title.
    #1\par 
    \nobreak                         % TeX penalty to prevent page break.
    \vskip 20pt                      % Space between title and text.
  } }

% \@makeschapterhead {TEXT} : Makes the heading for the \chapter* command.
%

% As of 2016, these titles must be same size as surrounding text and
% cannot be bold.
\def\@makeschapterhead#1{            % Heading for \chapter* command
   % \vspace*{20pt}                  % Space at top of page.
  { \parindent 0pt \raggedright 
    \centering         % Title.
    \header{#1}\par 
    \nobreak                         % TeX penalty to prevent page break.
    \vskip 20pt                      % Space between title and text.
  } }

% \secdef{UNSTARCMDS}{STARCMDS} :
%    When defining a \chapter or \section command without using
%    \@startsection, you can use \secdef as follows:
%       \def\chapter { ... \secdef \CMDA \CMDB }
%       \def\CMDA    [#1]#2{ ...   % Command to define \chapter[...]{...}
%       \def\CMDB    #1{ ...       % Command to define \chapter*{...}

\def\chapter{\clearpage      % Starts new page.
   \thispagestyle{plain}     % Page style of chapter page is 'plain'
   \global\@topnum\z@        % Prevents figures from going at top of page.
   \@afterindentfalse        % Suppress indent in first paragraph.
   \secdef\@chapter\@schapter}   % Change to \@afterindenttrue to indent.

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
        \refstepcounter{chapter}
        \typeout{\@chapapp\space\thechapter.}
        \addcontentsline{toc}{chapter}{\protect
        \numberline{\thechapter}#1}\else
      \addcontentsline{toc}{chapter}{#1}\fi
   \chaptermark{#1}
   \addtocontents{lof}{\protect\addvspace{10pt}} % Adds between-chapter space
   \addtocontents{lot}{\protect\addvspace{10pt}} % to lists of figs & tables.
    \@makechapterhead{#2}
    \@afterheading}                 % Routine called after chapter and
                                    % section heading.

\def\@schapter#1{\@makeschapterhead{#1} 
              \@afterheading}

% \@startsection {NAME}{LEVEL}{INDENT}{BEFORESKIP}{AFTERSKIP}{STYLE} 
%            optional * [ALTHEADING]{HEADING}
%    Generic command to start a section.  
%    NAME       : e.g., 'subsection'
%    LEVEL      : a number, denoting depth of section -- e.g., chapter=1,
%                 section = 2, etc.  A section number will be printed if
%                 and only if LEVEL < or = the value of the secnumdepth
%                 counter.
%    INDENT     : Indentation of heading from left margin
%    BEFORESKIP : Absolute value = skip to leave above the heading.  
%                 If negative, then paragraph indent of text following 
%                 heading is suppressed.
%    AFTERSKIP  : if positive, then skip to leave below heading,
%                       else - skip to leave to right of run-in heading.
%    STYLE      : commands to set style
%  If '*' missing, then increments the counter.  If it is present, then
%  there should be no [ALTHEADING] argument.  A sectioning command
%  is normally defined to \@startsection + its first six arguments.

\ifthenelse{\boolean{hyphenatetitles}}{%
	\newcommand{\TitleHyphenation}{}%
	}{%
	\newcommand{\TitleHyphenation}{%
		\pretolerance=10000%
		\hyphenpenalty=200%
		\raggedright}%
	}

\def\section{\@startsection {section}{1}{\z@}{-3.5ex plus 1ex minus 
    .2ex}{2.3ex plus .2ex}{\large\bfseries\TitleHyphenation}}
\def\subsection{\@startsection{subsection}{2}{\z@}{-3.25ex plus 1ex minus 
   .2ex}{1.5ex plus .2ex}{\normalsize\bfseries\TitleHyphenation}}
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-3.25ex plus 
   1ex minus .2ex}{1.5ex plus .2ex}{\normalsize\bfseries\TitleHyphenation}}
% Because \{sub,}paragraph are in-line, we allow hyphenation always.
\def\paragraph{\@startsection
     {paragraph}{4}{\z@}{3.25ex plus 1ex minus .2ex}{-1em}{\normalsize\bfseries}}
\def\subparagraph{\@startsection
     {subparagraph}{4}{\parindent}{3.25ex plus 1ex minus 
     .2ex}{-1em}{\normalsize\bfseries}}

% Default initializations of \...mark commands.  (See below for their
% us in defining page styles.
%

\def\chaptermark#1{}
% \def\sectionmark#1{}           % Preloaded definitions
% \def\subsectionmark#1{}
% \def\subsubsectionmark#1{}
% \def\paragraphmark#1{}
% \def\subparagraphmark#1{}

% The value of the counter secnumdepth gives the depth of the
% highest-level sectioning command that is to produce section numbers.
%

\setcounter{secnumdepth}{3}

% APPENDIX
%
% The \appendix command must do the following:
%    -- reset the chapter counter to zero
%    -- set \@chapapp to Appendix (for messages)
%    -- redefine the chapter counter to produce appendix numbers
%    -- reset the section counter to zero
%    -- redefine the \chapter command if appendix titles and headings are
%       to look different from chapter titles and headings.

\def\appendix{\par
  \setcounter{chapter}{0}
  \setcounter{section}{0}
  \def\@chapapp{APPENDIX}
  \def\thechapter{\Alph{chapter}}}


%    ****************************************
%    *                LISTS                 *
%    ****************************************
%

% The following commands are used to set the default values for the list
% environment's parameters. See the LaTeX manual for an explanation of
% the meanings of the parameters.  Defaults for the list environment are
% set as follows.  First, \rightmargin, \listparindent and \itemindent
% are set to 0pt.  Then, for a Kth level list, the command \@listK is
% called, where 'K' denotes 'i', 'ii', ... , 'vi'.  (I.e., \@listiii is
% called for a third-level list.)  By convention, \@listK should set
% \leftmargin to \leftmarginK.
%
% For efficiency, level-one list's values are defined at top level, and
% \@listi is defined to set only \leftmargin.

\leftmargini 2.5em
\leftmarginii 2.2em     % > \labelsep + width of '(m)'
\leftmarginiii 1.87em   % > \labelsep + width of 'vii.'
\leftmarginiv 1.7em     % > \labelsep + width of 'M.'
\leftmarginv 1em
\leftmarginvi 1em

\leftmargin\leftmargini
\labelwidth\leftmargini\advance\labelwidth-\labelsep
\labelsep .5em
\parsep 5pt plus 2.5pt minus 1pt

\def\@listI{\leftmargin\leftmargini}
\let\@listi\@listI

\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii\advance\labelwidth-\labelsep
   \topsep 5pt plus 2.5pt minus 1pt
   \parsep 2.5pt plus 1pt minus 1pt
   \itemsep \parsep}

\def\@listiii{\leftmargin\leftmarginiii
    \labelwidth\leftmarginiii\advance\labelwidth-\labelsep
    \topsep 2.5pt plus 1pt minus 1pt 
    \parsep \z@ \partopsep 1pt plus 0pt minus 1pt
    \itemsep \topsep}

\def\@listiv{\leftmargin\leftmarginiv
     \labelwidth\leftmarginiv\advance\labelwidth-\labelsep}

\def\@listv{\leftmargin\leftmarginv
     \labelwidth\leftmarginv\advance\labelwidth-\labelsep}

\def\@listvi{\leftmargin\leftmarginvi
     \labelwidth\leftmarginvi\advance\labelwidth-\labelsep}

%%---------------------------------------------------------------dt


%    ****************************************
%    *                LISTS                 *
%    ****************************************
%

% ENUMERATE
%  Enumeration is done with four counters: enumi, enumii, enumiii
%  and enumiv, where enumN controls the numbering of the Nth level
%  enumeration.  The label is generated by the commands \labelenumi 
%  ... \labelenumiv.  The expansion of \p@enumN\theenumN defines the 
%  output of a \ref command.  

\def\labelenumi{\arabic{enumi}.}    
\def\theenumi{\arabic{enumi}}     
 
\def\labelenumii{(\alph{enumii})}
\def\theenumii{\alph{enumii}}
\def\p@enumii{\theenumi}

\def\labelenumiii{\roman{enumiii}.}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi(\theenumii)}

\def\labelenumiv{\Alph{enumiv}.}
\def\theenumiv{\Alph{enumiv}}     
\def\p@enumiv{\p@enumiii\theenumiii}

% ITEMIZE
% Itemization is controlled by four commands: \labelitemi, \labelitemii,
% \labelitemiii, and \labelitemiv, which define the labels of the various 
% itemization levels.

\def\labelitemi{$\bullet$}
\def\labelitemii{\bfseries --}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}


% VERSE
%   The verse environment is defined by making clever use of the
%   list environment's parameters.  The user types \\ to end a line.
%   This is implemented by \let'in \\ equal \@centercr.
%
\def\verse{\let\\=\@centercr  
  \list{}{\itemsep\z@ \itemindent -1.5em\listparindent \itemindent 
          \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist

% QUOTATION
%   Fills lines
%   Indents paragraph
%   
\def\quotation{\list{}{\listparindent 1.5em
    \itemindent\listparindent
    \rightmargin\leftmargin\parsep 0pt plus 1pt}\item[]}
\let\endquotation=\endlist

% QUOTE -- same as quotation except no paragraph indentation,
%
\def\quote{\list{}{\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist

% DESCRIPTION 
%
%  To change the formatting of the label, you must redefine 
%  \descriptionlabel.  

\def\descriptionlabel#1{\hspace\labelsep \bfseries #1}
\def\description{\list{}{\labelwidth\z@ \itemindent-\leftmargin
       \let\makelabel\descriptionlabel}}

\let\enddescription\endlist

\newdimen\descriptionmargin
\descriptionmargin=3em


%    ****************************************
%    *         OTHER ENVIRONMENTS           *
%    ****************************************
%
%
% THEOREM 
% \@begintheorem ... \@endtheorem are the commands executed at the
% beginning and end of a (user-defined) theorem-like environment.
% Except \@opargbegintheorem is executed when an optional argument is
% given.  Cf. LATEX.TEX.
%
% \def\@begintheorem#1#2{\it \trivlist \item[\hskip \labelsep{\bfseries #1\ #2}]}
% \def\@opargbegintheorem#1#2#3{\it \trivlist
%       \item[\hskip \labelsep{\bfseries #1\ #2\ (#3)}]}
% \def\@endtheorem{\endtrivlist}


% TITLEPAGE
%  In the normal environments, the titlepage environment does nothing but 
%  start and end a page, and inhibit page numbers.  It also resets the
%  page number to zero.  In two-column style, it still makes a one-column
%  page.
\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
     \else \newpage \fi \thispagestyle{empty}\c@page\z@}

\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

% ARRAY AND TABULAR
%

\arraycolsep 5pt     % Half the space between columns in an array environment.
\tabcolsep 6pt       % Half the space between columns in a tabular environment.
\arrayrulewidth .4pt % Width of rules in array and tabular environment.
\doublerulesep 2pt   % Space between adjacent rules in array or tabular env.

% TABBING
%
\tabbingsep \labelsep   % Space used by the \' command.  (See LaTeX manual.)

% MINIPAGE
%  \@minipagerestore is called upon entry to a minipage environment to
%  set up things that are to be handled differently inside a minipage
%  environment. In the current styles, it does nothing.
%
% \skip\@mpfootins : plays same role for footnotes in a minipage as
%                    \skip\footins does for ordinary footnotes

\skip\@mpfootins = \skip\footins

% FRAMEBOX
%
\fboxsep = 3pt    % Space left between box and text by \fbox and \framebox.
\fboxrule = .4pt  % Width of rules in box made by \fbox and \framebox.


%    ****************************************
%    *        CHAPTERS AND SECTIONS         *
%    ****************************************
%
% DEFINE COUNTERS:
%
% \newcounter{NEWCTR}[OLDCTR] : Defines NEWCTR to be a counter, which is 
%                               reset to zero when counter OLDCTR is stepped.  
%                               Counter OLDCTR must already be defined.

\newcounter{part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]

% For any counter CTR, \theCTR is a macro that defines the printed version
% of counter CTR.  It is defined in terms of the following macros:
%
%  \arabic{COUNTER} : The value of COUNTER printed as an arabic numeral.
%  \roman{COUNTER}  : Its value printed as a lower-case roman numberal.
%  \Roman{COUNTER}  : Its value printed as an upper-case roman numberal.
%  \alph{COUNTER}   : Value of COUNTER printed as a lower-case letter:
%                         1 = a, 2 = b, etc.
%  \Alph{COUNTER}   : Value of COUNTER printed as an upper-case letter:
%                           1 = A, 2 = B, etc.
%

\def\thepart          {\Roman{part}}
\def\thechapter       {\arabic{chapter}}
\def\thesection       {\thechapter.\arabic{section}}
\def\thesubsection    {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection.\arabic{subsubsection}}
\def\theparagraph     {\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph  {\theparagraph.\arabic{subparagraph}}
                     
% \@chapapp is initially defined to be 'CHAPTER'.  The \appendix
% command redefines it to be 'APPENDIX'.
\def\@chapapp{CHAPTER}


%    ****************************************
%    *         TABLE OF CONTENTS, ETC.      *
%    ****************************************
%
% A \subsection command writes a 
%       \contentsline{subsection}{TITLE}{PAGE}
% command on the .toc file, where TITLE contains the contents of the
% entry and PAGE is the page number.  If subsections are being numbered,
% then TITLE will be of the form
%       \numberline{NUM}{HEADING}
% where NUM is the number produced by \thesubsection.  Other sectioning
% commands work similarly.  
%
% A \caption command in a 'figure' environment writes
%    \contentsline{figure}{\numberline{NUM}{CAPTION}}{PAGE}
% on the .lof file, where NUM is the number produced by \thefigure and
% CAPTION is the figure caption.  It works similarly for a 'table' environment.
%
% The command \contentsline{NAME} expands to \l@NAME.  So, to specify
% the table of contents, we must define \l@chapter, \l@section, 
% \l@subsection, ... ; to specify the list of figures, we must define
% \l@figure; and so on.  Most of these can be defined with the
% \@dottedtocline command, which works as follows.
%
% \@dottedtocline{LEVEL}{INDENT}{NUMWIDTH}{TITLE}{PAGE}
%    LEVEL    : An entry is produced only if LEVEL < or = value of 
%               'tocdepth' counter.  Note, \chapter is level 0, \section
%               is level 1, etc.
%    INDENT   : The indentation from the outer left margin of the start of 
%               the contents line.
%    NUMWIDTH : The width of a box in which the section number is to go,
%               if TITLE includes a \numberline command.
%   
% This command uses the following three parameters, which are set
% with a \def (so em's can be used to make them depend upon the font).
%   \@pnumwidth : The width of a box in which the page number is put.
%   \@tocrmarg  : The right margin for multiple line entries.  One
%                 wants \@tocrmarg > or = \@pnumwidth
%   \@dotsep    : Separation between dots, in mu units.  Should be \def'd to
%                 a number like 2 or 1.7

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{2}

% TABLEOFCONTENTS

\def\tableofcontents{
\chapter*{Table of Contents\markboth{CONTENTS}{CONTENTS}}
\renewcommand\baselinestretch{\@spacing}\@normalsize\@starttoc{toc}}

\def\l@part#1#2{\addpenalty{-\@highpenalty}
   \addvspace{2.25em plus 1pt}  % space above part line
   \begingroup
   \@tempdima 3em         % width of box holding part number, used by 
     \parindent \z@ \rightskip \@pnumwidth             %% \numberline
     \parfillskip -\@pnumwidth   
     {\large \bfseries          % set line in \large boldface
     \leavevmode          % TeX command to enter horizontal mode.       
     #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
     \nobreak             % Never break after part entry
   \endgroup}

\def\l@chapter#1#2{\pagebreak[3] 
   \vskip 1.0em plus 1pt  % space above chapter line
   \@tempdima 1.5em       % width of box holding chapter number
   \begingroup
     \parindent \z@ \rightskip \@pnumwidth 
     \parfillskip -\@pnumwidth   
     \bfseries                  % Boldface.
     \leavevmode          % TeX command to enter horizontal mode.       
    #1\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep mu$}\hfill 
     \hbox to\@pnumwidth{\hfil #2}\par
   \endgroup}

\def\l@section{\@dottedtocline{1}{1.5em}{2.3em}}
\def\l@subsection{\@dottedtocline{2}{3.8em}{3.2em}}
\def\l@subsubsection{\@dottedtocline{3}{7.0em}{4.1em}}
\def\l@paragraph{\@dottedtocline{4}{10em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{12em}{6em}}

% LIST OF FIGURES
%
\newif\if@figures
\@figurestrue  % rbw did this in \makeintropages; I moved it here.  ---johnh 950825
\def\listoffigures{
  \if@figures\chapter*{List of Figures\markboth
   {LIST OF FIGURES}{LIST OF FIGURES}}\@starttoc{lof}\fi}

\def\l@figure{\@dottedtocline{1}{0em}{2.3em}}

% LIST OF TABLES
%
\newif\if@tables
\@tablestrue  % rbw did this in \makeintropages; I moved it here.  ---johnh 950825
\def\listoftables{
  \if@tables\chapter*{List of Tables\markboth
   {LIST OF TABLES}{LIST OF TABLES}}\@starttoc{lot}\fi}

\let\l@table\l@figure


%    ****************************************
%    *             BIBLIOGRAPHY             *
%    ****************************************
%
% The thebibliography environment executes the following commands:
%
%  \def\newblock{\hskip .11em plus .33em minus -.07em} --
%      Defines the `closed' format, where the blocks (major units of 
%      information) of an entry run together.
%
%  \sloppy  -- Used because it's rather hard to do line breaks in 
%      bibliographies,
% 
%  \sfcode`\.=1000\relax --
%      Causes a `.' (period) not to produce an end-of-sentence space.

\def\thebibliography#1{\chapter*{References\markboth
  {REFERENCES}{REFERENCES}}
  \addcontentsline{toc}{chapter}{References}
  \renewcommand\baselinestretch{1}
  \@normalsize
  \list{[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumi}}
    \def\newblock{\hskip .11em plus .33em minus -.07em}
    \sloppy
    \sfcode`\.=1000\relax}

\def\endthebibliography{\renewcommand\baselinestretch{\@spacing}\@normalsize\endlist}

% \def\@biblabel#1{[#1]\hfill}  % Produces the label for a \bibitem[...]
                                % command. 
% \def\@cite#1{[#1]}            % Produces the output of the \cite command.


%    ****************************************
%    *              THE INDEX               *
%    ****************************************
%
% THE THEINDEX ENVIRONMENT
% Produces double column format, with each paragraph a separate entry.
% The user commands \item, \subitem and \subsubitem are used to
% produce the entries, and \indexspace adds an extra vertical space
% that's the right size to put above the first entry with a new letter
% of the alphabet.

\newif\if@restonecol

\def\theindex{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
\columnseprule \z@
\columnsep 35pt\twocolumn[\@makeschapterhead{Index}]
    \markboth{INDEX}{INDEX}\thispagestyle{plain}\parindent\z@
    \parskip\z@ plus .3pt\relax\let\item\@idxitem}

\def\@idxitem{\par\hangindent 40pt}

\def\subitem{\par\hangindent 40pt \hspace*{20pt}}

\def\subsubitem{\par\hangindent 40pt \hspace*{30pt}}

\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}

\def\indexspace{\par \vskip 10pt plus 5pt minus 3pt\relax}


%    ****************************************
%    *             FOOTNOTES                *
%    ****************************************
%
% \footnoterule is a macro to draw the rule separating the footnotes from
% the text.  It should take zero vertical space, so it needs a negative
% skip to compensate for any positive space taken by the rule.  (See
% PLAIN.TEX.)

\def\footnoterule{\kern-3\p@   
  \hrule width .4\columnwidth 
  \kern 2.6\p@}                 % The \hrule has default height of .4pt .

% \newcounter{footnote}
\@addtoreset{footnote}{chapter}  % Numbers footnotes within chapters

%   \@makefntext{NOTE} :
%        Must produce the actual footnote, using \@thefnmark as the mark 
%        of the footnote and NOTE as the text.  It is called when effectively
%        inside a \parbox of width \columnwidth (i.e., with \hsize = 
%        \columnwidth).  
%
%        The following macro indents all lines of the footnote by 10pt, and 
%        indents the first line of a new paragraph by 1em.  To change these 
%        dimensions, just substitute the desired value for '10pt' [in both 
%        places] or '1em'.  The mark is flushright against the footnote. 
%          \long\def\@makefntext#1{\@setpar{\@@par\@tempdima \hsize 
%             \advance\@tempdima-10pt\parshape \@ne 10pt \@tempdima}\par
%             \parindent 1em\noindent \hbox to \z@{\hss$^{\@thefnmark}$}#1}
%
%        A simpler macro is used, in which the footnote text is
%        set like an ordinary text paragraph, with no indentation except
%        on the first line of a paragraph, and the first line of the 
%        footnote.  Thus, all the macro must do is set \parindent
%        to the appropriate value for succeeding paragraphs and put the 
%        proper indentation before mark.

\long\def\@makefntext#1{\parindent 1em\noindent 
            \hbox to 1.8em{\hss$^{\@thefnmark}$}#1}

% \@makefnmark : A macro to generate the footnote marker that goes
%    in the text.  Default used.
%


%    ****************************************
%    *         FIGURES AND TABLES           *
%    ****************************************
% 
% Float placement parameters.  See LaTeX manual for their definition.
%
\setcounter{topnumber}{2}
\def\topfraction{.7}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.3}
\setcounter{totalnumber}{3}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

% \@makecaption{NUMBER}{TEXT} : Macro to make a figure or table caption.  
%      NUMBER : Figure or table number--e.g., 'Figure 3.2' 
%      TEXT   : The caption text.
%  Macro should be called inside a \parbox of right width, with \normalsize.

\long\def\@makecaption#1#2{
   \vskip 10pt 
   \setbox\@tempboxa\hbox{#1: #2}
   \ifdim \wd\@tempboxa >\hsize   % IF longer than one line:
       \unhbox\@tempboxa\par      %   THEN set as ordinary paragraph.
     \else                        %   ELSE  center.
       \hbox to\hsize{\hfil\box\@tempboxa\hfil}  
   \fi}

% To define a float of type TYPE (e.g., TYPE = figure), the document style 
% must define the following.
%
%  \fps@TYPE   : The default placement specifier for floats of type TYPE.
%
%  \ftype@TYPE : The type number for floats of type TYPE.  Each TYPE has
%                associated a unique positive TYPE NUMBER, which is a power 
%                of two.  E.g., figures might have type number 1, tables type 
%                number 2, programs type number 4, etc.
%
%  \ext@TYPE   : The file extension indicating the file on which the 
%                contents list for float type TYPE is stored.  For example, 
%                \ext@figure = 'lof'.
%
%  \fnum@TYPE  : A macro to generate the figure number for a caption.
%                For example, \fnum@TYPE == Figure \thefigure.
%
%  The actual float-making environment commands--e.g., the commands
%  \figure and \endfigure--are defined in terms of the macros \@float
%  and \end@float, which are described below.
%
%  \@float{TYPE}[PLACEMENT] : Macro to begin a float environment for a 
%     single-column float of type TYPE with PLACEMENT as the placement 
%     specifier.  The default value of PLACEMENT is defined by \fps@TYPE.   
%     The environment is ended by \end@float.  
%     E.g., \figure == \@float{figure}, \endfigure == \end@float.

% FIGURE
%
\newcounter{figure}[chapter]
\def\thefigure{\thechapter.\@arabic\c@figure}

\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{Figure \thefigure}
\def\figure{\@figurestrue\@float{figure}}
\let\endfigure\end@float
\@namedef{figure*}{\@figurestrue\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}

% TABLE
%
\newcounter{table}[chapter]
\def\thetable{\thechapter.\@arabic\c@table}

\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{Table \thetable}
\def\table{\@tablestrue\@float{table}}
\let\endtable\end@float
\@namedef{table*}{\@tablestrue\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}


%    ****************************************
%    *            PAGE STYLES               *
%    ****************************************
%
% The page style 'foo' is defined by defining the command \ps@foo.  This
% command should make only local definitions.  There should be no stray
% spaces in the definition, since they could lead to mysterious extra
% spaces in the output.
%
% The \ps@... command defines the macros \@oddhead, \@oddfoot,
% \@evenhead, and \@evenfoot to define the running heads and
% feet---e.g., \@oddhead is the macro to produce the contents of the
% heading box for odd-numbered pages.  It is called inside an \hbox of
% width \textwidth.
%
% To make headings determined by the sectioning commands, the page style
% defines the commands \chaptermark, \sectionmark, ... , where
% \chaptermark{TEXT} is called by \chapter to set a mark, and so on.
% The \...mark commands and the \...head macros are defined with the
% help of the following macros.  (All the \...mark commands should be
% initialized to no-ops.)
%
% MARKING CONVENTIONS:
% LaTeX extends TeX's \mark facility by producing two kinds of marks
% a 'left' and a 'right' mark, using the following commands:
%     \markboth{LEFT}{RIGHT} : Adds both marks.
%     \markright{RIGHT}      : Adds a 'right' mark.
%     \leftmark  : Used in the \@oddhead, \@oddfoot, \@evenhead or \@evenfoot
%                  macro, gets the current 'left'  mark.  Works like TeX's 
%                  \botmark command.
%     \rightmark : Used in the \@oddhead, \@oddfoot, \@evenhead or \@evenfoot
%                  macro, gets the current 'right'  mark.  Works like TeX's 
%                  \firstmark command.
% The marking commands work reasonably well for right marks 'numbered 
% within' left marks--e.g., the left mark is changed by a \chapter command and
% the right mark is changed by a \section command.  However, it does
% produce somewhat anomalous results if two \bothmark's occur on the same page.
% 

\mark{{}{}}   % Initializes TeX's marks

% \def\ps@empty{\def\@oddhead{}
%   \def\@oddfoot{}
%   \def\@evenhead{}\def\@evenfoot{}}
%
% \def\ps@plain{\def\@oddhead{}
%   \def\@oddfoot{\rm\hfil\thepage\hfil}
%   \def\@evenhead{}
%   \let\@evenfoot\@oddfoot}

% Definition of 'headings' page style 
%  Note the use of ##1 for parameter of \def\chaptermark inside the
%  \def\ps@headings.
%

\def\ps@headings{\def\@oddfoot{}\def\@evenfoot{}%     No feet.
\def\@oddhead{\hbox {}\slshape \rightmark \hfil \rm\thepage}% Heading.
\def\chaptermark##1{\markright {\uppercase{\ifnum \c@secnumdepth >\m@ne
  \@chapapp\ \thechapter. \ \fi ##1}}}}

% Definition of 'myheadings' page style.  
%
\def\ps@myheadings{\def\@oddhead{\hbox{}\slshape\rightmark \hfil \rm\thepage}%
\def\@oddfoot{}\def\@evenhead{\rm \thepage\hfil\slshape\leftmark\hbox {}}%
\def\@evenfoot{}\def\sectionmark##1{}\def\subsectionmark##1{}}


%    ****************************************
%    *            MISCELLANEOUS             *
%    ****************************************
%
% DATE
%
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}

% EQUATION and EQNARRAY -- put here because it must follow \chapter definition
%
% \newcounter{equation}    
%
\@addtoreset{equation}{chapter}   % Makes \chapter reset 'equation' counter.

\def\theequation{\thechapter.\arabic{equation}}

% \jot = 3pt      % Extra space added between lines of an eqnarray environment

% The macro \@eqnnum defines how equation numbers are to appear in equations.
%
% \def\@eqnnum{(\theequation)} 
% 

% CODE ENVIRONMENT
%
% same as verbatim except it is always in single spacing
% and double spacing is restores at the end

\begingroup \catcode `|=0 \catcode `[= 1
\catcode`]=2 \catcode `\{=12 \catcode `\}=12
\catcode`\\=12 |gdef|@xcode#1\end{code}[#1|end[code]]
|endgroup

\def\code{\par\renewcommand\baselinestretch{1}\@normalsize\@verbatim
\frenchspacing\@vobeyspaces \@xcode}
\def\endcode{\renewcommand\baselinestretch{\@spacing}\@normalsize\endtrivlist}

% FOOTNOTES
% change it so that footnotes are printed in single spacing
%
\long\def\@footnotetext#1{\insert\footins{\renewcommand\baselinestretch{1}
    \footnotesize
    \interlinepenalty\interfootnotelinepenalty 
    \splittopskip\footnotesep
    \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
    \hsize\columnwidth \@parboxrestore
   \edef\@currentlabel{\csname p@footnote\endcsname\@thefnmark}\@makefntext
    {\rule{\z@}{\footnotesep}\ignorespaces
      #1\strut}\renewcommand\baselinestretch{\@spacing}}}

%    ****************************************
%    *           INITIALIZATION             *
%    ****************************************
%
% Default initializations

\ps@plain                   % 'plain' page style
\pagenumbering{arabic}      % Arabic page numbers
\onecolumn                  % Single-column.
\if@twoside\else\raggedbottom\fi % Ragged bottom unless twoside option.

% Generate thesis preliminary pages
%\input{uclathti.clo}

%%---------------------------------------------------------------dt

% UCLA THESIS TITLE PAGE STYLE (format for preliminary pages)
% (C) Copyright 1995 by John Heidemann,
% derived from work (C) Copyright 1988 Richard B. Wales,
% taken in turn from material Copyright (C) 1985 by Leslie Lamport.

%%%
% Version checking.
%%%
\NeedsTeXFormat{LaTeX2e}
\def\uclathtiversion{1.0 beta}
\def\uclathtidate{1995/05/11}
\ProvidesFile{uclathti}[\uclathtidate, \uclathtiversion]

%
% When this file is included from other than uclathes,
% \@spacing may be undefined.
%
% NEEDSWORK:  This test always fails, even when uclathes.cls is loaded.
\def\@stdsinglespacing{1.0}
\ifx\@singlespacing\@stdsinglespacing
  % Spacing has already been set (in uclathes.cls).
\else
  % Spacing was not set, set it here as if we were uclathes.cls.
  % \typeout{Spacing not set.}
  \def\@singlespacing{1.0}
  \def\@doublespacing{1.544}	  % see above for explanation of value
  \let\@spacing=\@singlespacing
\fi

%
% The following macro pair save and restore ``twocolumn'' status.
%
\newif\if@ColumnSaveValue
\newcommand{\ColumnSave}{
  \if@twocolumn
    \@ColumnSaveValuetrue
  \else
    \@ColumnSaveValuefalse
  \fi
  \pagebreak
  \onecolumn
}
\newcommand{\ColumnSaveHeading}[1]{
  \if@twocolumn
    \@ColumnSaveValuetrue
    \pagebreak
    \twocolumn[#1]
  \else
    \@ColumnSaveValuefalse
    \pagebreak
    #1
  \fi
}
\newcommand{\ColumnRestore}{\if@ColumnSaveValue\twocolumn\fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			      TITLE PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\@maketitlepage{
   \begin {titlepage}
      \ColumnSave
      \begin {center}
         \header{University of California} \\
         \normalsize Los Angeles \\
         \vfill
         \@titlesize \@title \\
         \vskip 48pt plus0pt minus18pt
         \normalsize A \@thesisname\
	 submitted in partial satisfaction \\
         of the requirements for the degree \\
         \@degreename\if@department\ in \@department \fi\\
         \vskip 24pt plus0pt minus6pt
         by \\
         \vskip 24pt plus0pt minus6pt
         {\@author} \\
         \vfill
         {\normalsize \@degreeyear}
      \end {center}
      \ColumnRestore
   \end {titlepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			    COPYRIGHT PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@copyright
\@copyrighttrue
\newcommand\nocopyright{\@copyrightfalse}

\def\@copyrightinfo{All Rights Reserved}
\newcommand\copyrightinfo[1]{\def\@copyrightinfo{#1}}

\newcommand\@makecopyrightpage{
   \ColumnSave
   \thispagestyle{empty}
   \null
   \vfill
   \if@copyright
      \begin{center}
         %\normalsize \rm Copyright \copyright\ \@copyrightyear
         %\ifx\@copyrightyear\@degreeyear\else , \@degreeyear \fi
         %\ by \@author \\
         %\@copyrightinfo
	 \normalsize \normalfont \copyright\ Copyright by \\
	 \@author \\ \@copyrightyear
      \end{center}
   \fi
   \ColumnRestore
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			    SIGNATURE PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% The following definitions for "\chair" and "\member" allow for one or
% three chairs (co-chairs) and up to six additional committee members.

\newcounter{chairs}
\setcounter{chairs}{0}
\newcommand\chair[1]{
   \ifcase\value{chairs}
      \def\@chairA{#1} \or \def\@chairB{#1} \or \def\@chairC{#1}
   \else
      \typeout{Too many co-chairs.}
   \fi
   \addtocounter{chairs}{1}
}

\newcounter{members}
\setcounter{members}{0}
\newcommand\member[1]{
   \ifcase\value{members}
      \def\@memberA{#1} \or \def\@memberB{#1} \or \def\@memberC{#1} \or
      \def\@memberD{#1} \or \def\@memberE{#1} \or \def\@memberF{#1}
   \else
      \typeout{Too many committee members.}
   \fi
   \addtocounter{members}{1}
}

% The following definition for "\@signatureline" draws a line and puts
% a name underneath the line.  If the standard "single" line spacing is
% changed, it may be desirable to change the "\vskip" before the name.

\newcommand\@signatureline[1]{
   #1
   
}

\newcommand\@makesignaturepage{
   \ColumnSave
   \noindent
   \renewcommand\baselinestretch{\@doublespacing}\@normalsize
   \normalsize \normalfont The \@thesisname\ of \@author\ is approved.
   
   {\centering
      \ifnum\c@members>5 \@signatureline{\@memberF}\fi
      \ifnum\c@members>4 \@signatureline{\@memberE}\fi
      \ifnum\c@members>3 \@signatureline{\@memberD}\fi
      \ifnum\c@members>2 \@signatureline{\@memberC}\fi
      \ifnum\c@members>1 \@signatureline{\@memberB}\fi
      \ifnum\c@members>0 \@signatureline{\@memberA}
         \else\typeout{No non-chair committee members.}\fi
      \ifnum\c@chairs>2
         \@signatureline{\@chairC, Committee Co-Chair}
         \@signatureline{\@chairB, Committee Co-Chair}
         \@signatureline{\@chairA, Committee Co-Chair}
      \else\ifnum\c@chairs>1
         \@signatureline{\@chairB, Committee Co-Chair}
         \@signatureline{\@chairA, Committee Co-Chair}
      \else\ifnum\c@chairs>0
         \@signatureline{\@chairA, Committee Chair}
      \else\typeout{No committee chair.}
      \fi\fi\fi
      \vskip 72pt
      University of California, Los Angeles
      
      \@degreeyear
      
   }
   \ColumnRestore
   \renewcommand\baselinestretch{\@spacing}\@normalsize
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			   DEDICATION PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@dedication
\def\@dedication{}
\newcommand\dedication[1]{\@dedicationtrue\def\@dedication{#1}}

\newcommand\@makededication{
   \if@dedication
      \ColumnSave
      \par\pagestyle{plain}
      \renewcommand\baselinestretch{\@spacing}\@normalsize\normalfont
      \vspace*{0pt}		% force spacing at top of page
      \vfill
      \begin{center}
	 \@dedication
      \end{center}
      \vfill
      \ColumnRestore
   \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			 ACKNOWLEDGMENTS PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@acks
\def\@acknowledgments{}
\newcommand\acknowledgments[1]{\@ackstrue\def\@acknowledgments{#1}}

\newcommand\@makeacknowledgmentsheading{
  {
    \centering
    \header{Acknowledgments}
    \vskip 12pt
  }
}


\newcommand\@makeacknowledgments{
   \if@acks
      \ColumnSaveHeading{\@makeacknowledgmentsheading}
      \par\pagestyle{plain}
      \renewcommand\baselinestretch{\@spacing}\@normalsize
      \noindent \normalsize \normalfont \@acknowledgments
      \vfill
      \ColumnRestore
   \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			      VITA PAGE				       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This definition for the "\vitaitem" command allows for up to 26 vita
% items.  The use of "\normalfont" in each definition permits any macros that
% are sensitive to type style (and which might be disrupted by the mode
% set for the "tabular" processing) to work properly.

\newcounter{vitaitems}
\setcounter{vitaitems}{0}
\newcommand\@vitadate[1]{{\parbox[t]{1in}{\normalfont{#1}}}}
\newcommand\@vitatext[1]{{\parbox[t]{5.25in}{\normalfont{#1}}}}
\newcommand\vitaitem[2]{
   \ifcase\value{vitaitems}
      \def\@vitaA{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaB{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaC{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaD{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaE{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaF{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaG{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaH{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaI{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaJ{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaK{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaL{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaM{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaN{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaO{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaP{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaQ{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaR{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaS{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaT{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaU{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaV{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaW{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaX{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaY{\@vitadate{#1} & \@vitatext{#2}} \or
      \def\@vitaZ{\@vitadate{#1} & \@vitatext{#2}}
   \else
      \typeout{Too many vita items.}
   \fi
   \addtocounter{vitaitems}{1}
}

% These definitions for the "\publication" and "\presentation" commands
% allow for up to 26 publications and/or presentations.  Note that UCLA
% requires publications and presentations to be combined into a single
% list with a single title; the "@pubs" and "@pres" flags are used to
% determine what the title will look like.

\newcounter{publications}
\setcounter{publications}{0}
\newif\if@pubs \newif\if@pres
\newcommand\publication[1]{
   \@pubstrue
   \ifcase\value{publications}
      \def\@pubA{#1} \or \def\@pubB{#1} \or \def\@pubC{#1} \or
      \def\@pubD{#1} \or \def\@pubE{#1} \or \def\@pubF{#1} \or
      \def\@pubG{#1} \or \def\@pubH{#1} \or \def\@pubI{#1} \or
      \def\@pubJ{#1} \or \def\@pubK{#1} \or \def\@pubL{#1} \or
      \def\@pubM{#1} \or \def\@pubN{#1} \or \def\@pubO{#1} \or
      \def\@pubP{#1} \or \def\@pubQ{#1} \or \def\@pubR{#1} \or
      \def\@pubS{#1} \or \def\@pubT{#1} \or \def\@pubU{#1} \or
      \def\@pubV{#1} \or \def\@pubW{#1} \or \def\@pubX{#1} \or
      \def\@pubY{#1} \or \def\@pubZ{#1}
   \else
      \typeout{Too many publications/presentations.}
   \fi
   \addtocounter{publications}{1}
}
\newcommand\presentation[1]{
   \@prestrue
   \ifcase\value{publications}
      \def\@pubA{#1} \or \def\@pubB{#1} \or \def\@pubC{#1} \or
      \def\@pubD{#1} \or \def\@pubE{#1} \or \def\@pubF{#1} \or
      \def\@pubG{#1} \or \def\@pubH{#1} \or \def\@pubI{#1} \or
      \def\@pubJ{#1} \or \def\@pubK{#1} \or \def\@pubL{#1} \or
      \def\@pubM{#1} \or \def\@pubN{#1} \or \def\@pubO{#1} \or
      \def\@pubP{#1} \or \def\@pubQ{#1} \or \def\@pubR{#1} \or
      \def\@pubS{#1} \or \def\@pubT{#1} \or \def\@pubU{#1} \or
      \def\@pubV{#1} \or \def\@pubW{#1} \or \def\@pubX{#1} \or
      \def\@pubY{#1} \or \def\@pubZ{#1}
   \else
      \typeout{Too many publications/presentations.}
   \fi
   \addtocounter{publications}{1}
}

\newcommand\@printvitaitem[1]{
   \noindent
   \begin {tabular} {@{}p{1in}@{}p{6in}@{}}
      #1
   \end {tabular}
}

%\newcommand\@printpubitem[1]{\par \noindent #1} %--dt
\newcommand\@printpubitem[1]{\par \vskip -14pt \noindent #1} %--dt

\newcommand\@makevitapage{
   % Save the old stretch.
   \let\OldArrayStretch=\arraystretch
   \renewcommand\arraystretch{1.67}
   \ifnum\c@vitaitems>0
      \ColumnSave
      \par\pagestyle{plain}
    %  \renewcommand\baselinestretch{\@spacing}\@normalsize
       \renewcommand\baselinestretch{1.4}\@normalsize
      \begin{center}
         {\header{Vita}} \\
      \end{center}
      %\vskip 12pt        %--dt
      \vskip -12pt %--dt
      \ifnum\c@vitaitems>0  \@printvitaitem{\@vitaA} \fi
      \ifnum\c@vitaitems>1  \@printvitaitem{\@vitaB} \fi
      \ifnum\c@vitaitems>2  \@printvitaitem{\@vitaC} \fi
      \ifnum\c@vitaitems>3  \@printvitaitem{\@vitaD} \fi
      \ifnum\c@vitaitems>4  \@printvitaitem{\@vitaE} \fi
      \ifnum\c@vitaitems>5  \@printvitaitem{\@vitaF} \fi
      \ifnum\c@vitaitems>6  \@printvitaitem{\@vitaG} \fi
      \ifnum\c@vitaitems>7  \@printvitaitem{\@vitaH} \fi
      \ifnum\c@vitaitems>8  \@printvitaitem{\@vitaI} \fi
      \ifnum\c@vitaitems>9  \@printvitaitem{\@vitaJ} \fi
      \ifnum\c@vitaitems>10 \@printvitaitem{\@vitaK} \fi
      \ifnum\c@vitaitems>11 \@printvitaitem{\@vitaL} \fi
      \ifnum\c@vitaitems>12 \@printvitaitem{\@vitaM} \fi
      \ifnum\c@vitaitems>13 \@printvitaitem{\@vitaN} \fi
      \ifnum\c@vitaitems>14 \@printvitaitem{\@vitaO} \fi
      \ifnum\c@vitaitems>15 \@printvitaitem{\@vitaP} \fi
      \ifnum\c@vitaitems>16 \@printvitaitem{\@vitaQ} \fi
      \ifnum\c@vitaitems>17 \@printvitaitem{\@vitaR} \fi
      \ifnum\c@vitaitems>18 \@printvitaitem{\@vitaS} \fi
      \ifnum\c@vitaitems>19 \@printvitaitem{\@vitaT} \fi
      \ifnum\c@vitaitems>20 \@printvitaitem{\@vitaU} \fi
      \ifnum\c@vitaitems>21 \@printvitaitem{\@vitaV} \fi
      \ifnum\c@vitaitems>22 \@printvitaitem{\@vitaW} \fi
      \ifnum\c@vitaitems>23 \@printvitaitem{\@vitaX} \fi
      \ifnum\c@vitaitems>24 \@printvitaitem{\@vitaY} \fi
      \ifnum\c@vitaitems>25 \@printvitaitem{\@vitaZ} \fi
      \ifnum\c@publications>0{
         \ifx\@spacing\@doublespacing\parskip 24pt plus 4pt
	 \else                       \parskip 12pt plus 2pt
	 \fi
	 %\vskip 36pt %--dt
	 \begin{center}
	 %\vskip -36pt %--dt
	    \header{
	    \if@pubs
	       \if@pres Publications and Presentations
	       \else    Publications
	       \fi
	    \else       Presentations
	    \fi
	    }
	    \\
	 \end{center}
	 %\nobreak \vskip 12pt %--dt
	 \nobreak \vskip -12pt %--dt
         \ifnum\c@publications>0  \@printpubitem{\@pubA} \fi
         \ifnum\c@publications>1  \@printpubitem{\@pubB} \fi
         \ifnum\c@publications>2  \@printpubitem{\@pubC} \fi
         \ifnum\c@publications>3  \@printpubitem{\@pubD} \fi
         \ifnum\c@publications>4  \@printpubitem{\@pubE} \fi
         \ifnum\c@publications>5  \@printpubitem{\@pubF} \fi
         \ifnum\c@publications>6  \@printpubitem{\@pubG} \fi
         \ifnum\c@publications>7  \@printpubitem{\@pubH} \fi
         \ifnum\c@publications>8  \@printpubitem{\@pubI} \fi
         \ifnum\c@publications>9  \@printpubitem{\@pubJ} \fi
         \ifnum\c@publications>10 \@printpubitem{\@pubK} \fi
         \ifnum\c@publications>11 \@printpubitem{\@pubL} \fi
         \ifnum\c@publications>12 \@printpubitem{\@pubM} \fi
         \ifnum\c@publications>13 \@printpubitem{\@pubN} \fi
         \ifnum\c@publications>14 \@printpubitem{\@pubO} \fi
         \ifnum\c@publications>15 \@printpubitem{\@pubP} \fi
         \ifnum\c@publications>16 \@printpubitem{\@pubQ} \fi
         \ifnum\c@publications>17 \@printpubitem{\@pubR} \fi
         \ifnum\c@publications>18 \@printpubitem{\@pubS} \fi
         \ifnum\c@publications>19 \@printpubitem{\@pubT} \fi
         \ifnum\c@publications>20 \@printpubitem{\@pubU} \fi
         \ifnum\c@publications>21 \@printpubitem{\@pubV} \fi
         \ifnum\c@publications>22 \@printpubitem{\@pubW} \fi
         \ifnum\c@publications>23 \@printpubitem{\@pubX} \fi
         \ifnum\c@publications>24 \@printpubitem{\@pubY} \fi
         \ifnum\c@publications>25 \@printpubitem{\@pubZ} \fi
      }
      \ColumnRestore
   \fi\fi
   \renewcommand\arraystretch{\OldArrayStretch}
   \par \renewcommand\baselinestretch{\@spacing}\@normalsize %--dt
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%			    ABSTRACT PAGE			       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\if@abstract
\def\@abstract{}
\newcommand\abstract[1]{\@abstracttrue\def\@abstract{#1}}

%
% one argument: the baselinestretch
% The RFTADP requires doublespacing, but in techreports
% you may wish something less.
%
\newcommand{\@makeabstractpage}[1]{
   \if@abstract
      \ColumnSave
      \pagenumbering{roman}
      \setcounter{page}{2}
      \par\pagestyle{plain}
      \begin{center}
         % 2016 Title and author can no longer be in bold, or 
         % be larger than surrounding text.
         \header{Abstract of the \MakeUppercase{\@Thesisname}}\\[12pt]
         % 2016 Author name can no longer be in bold, or be larger
         % than surrounding text.
         {\@titlesize \@title}\\[12pt]
         \normalsize \normalfont by\\[12pt]
         {\@author} \\
         \normalsize \normalfont
	 \@degreename\if@department\ in \@department \fi\\
         University of California, Los Angeles, \@degreeyear \\
         \ifnum\c@chairs>2
            Professor \@chairA, Co-Chair \\
            Professor \@chairB, Co-Chair \\
            Professor \@chairC, Co-Chair \\
         \else\ifnum\c@chairs>1
            Professor \@chairA, Co-Chair \\
            Professor \@chairB, Co-Chair \\
         \else\ifnum\c@chairs>0
            Professor \@chairA, Chair \\
         \else\typeout{No committee chair.}
         \fi\fi\fi
      \end{center}
      \ifx\@spacing\@doublespacing\vskip 12pt\else\vskip 24pt\fi
      \renewcommand\baselinestretch{#1}\@normalsize
      %
      % Set up spacing.
      % If it's single spacing, indent the margins.
      % If double spacing is required than things are already
      % ugly enough (and we loose enough space) that we may
      % as well use the whole \textwidth.
      %
      \ifthenelse{\equal{#1}{\@stdsinglespacing}}{
	\begin{center}
	\begin{minipage}{4.75in}
	\setlength{\parindent}{1.5em}
	\@abstract
        \end{minipage}
	\end{center}
      }{
	\@abstract
      }

      \renewcommand\baselinestretch{\@spacing}\@normalsize
      \ColumnRestore
  \else
      \typeout{No abstract.}
   \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%								       %
%		      PRINT ALL PRELIMINARY PAGES		       %
%								       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\makeintropages{
  \@maketitlepage
  % If we're printing two sided,
  % insert a blank page for the back of the title page.
  % NOTE:  This extra page makes the output non-conforming
  % to the RFTADP, unless you throw it away.
  \if@twoside
    \typeout{Two-side detected.}    
    \pagebreak   % the back side of the title page
  \fi
  \@makecopyrightpage
  \@makeabstractpage{\@doublespacing}
  \@makesignaturepage
  \@makededication
  \tableofcontents
  \listoffigures
  \listoftables
  \@makeacknowledgments
  \@makevitapage
  \newpage \pagenumbering{arabic}
}

%%---------------------------------------------------------------dt

\renewcommand{\floatpagefraction}{0.7} 
\renewcommand{\dblfloatpagefraction}{0.7}

\usepackage{graphicx, subcaption}
\PassOptionsToPackage{draft}{graphicx}
\usepackage{bm, amsmath, amsthm, amssymb, amsfonts}
\usepackage{setspace}           % single-spaces figure captions
\counterwithout{footnote}{chapter} %number footnotes continuously throughout
\usepackage{microtype}
\usepackage{tabularx}
\usepackage{booktabs}
\usepackage{multirow, multicol}
\usepackage{url}
%\usepackage[linesnumbered,ruled,vlined]{algorithm2e}
\usepackage{mathtools}
\usepackage{natbib}
\def\cite#1{\citep{#1}}

% must be re-defined after natbib is loaded
\def\thebibliography#1{\chapter*{References\markboth
  {REFERENCES}{REFERENCES}}
  \addcontentsline{toc}{chapter}{References}
  \renewcommand\baselinestretch{1}
  \@normalsize
  \list{[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumi}}
    \def\newblock{\hskip .11em plus .33em minus -.07em}
    \sloppy
    \sfcode`\.=1000\relax}

\usepackage[
%pdftitle={},
%pdfauthor={},
pdftex, bookmarksnumbered, pagebackref]{hyperref}
\hypersetup{colorlinks,
citecolor=[rgb]{0.0,0.3,0.0},
filecolor=[rgb]{0.6,0.0,0.0},
linkcolor=[rgb]{0.0,0.0,0.4},
urlcolor=[rgb]{0.0,0.0,0.4}}
