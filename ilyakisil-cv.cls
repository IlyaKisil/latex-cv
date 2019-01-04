%% Start of file `ilyakisil-cv.cls'.
%
% This class file defines the structure and layout for the CV and Cover Letter.
%
% This class is based on:
%   1) The one downloaded from https://github.com/posquit0/Awesome-CV


%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{ilyakisil-cv}[2018/12/24 v0.0.1 Ilya Kisil Curriculum Vitae Class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
% Options for draft or final
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
% Inherit options of article
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}

% Needed to handle list environment
\RequirePackage{enumitem}

% Needed to handle text alignment
\RequirePackage{ragged2e}

% Needed to configure page layout
\RequirePackage{geometry}

% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}

% Needed to manage colors
\RequirePackage{xcolor}

% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}

% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}

% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}

% Needed to change line spacing in specific environment
\RequirePackage{setspace}

% Needed to manage fonts
\RequirePackage[quiet]{fontspec}

% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}

% Needed to manage math fonts
\RequirePackage{unicode-math}

% Needed for creating pictures with tikz
\RequirePackage{tikz}
\usetikzlibrary{
    shapes,
    backgrounds,
    mindmap,
    trees
}

%-------------------------------------------------------------------------------
% Needed to use icons from font-awesome (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome4}
% Needed to use icons from font-awesome-5 (https://github.com/javydekoning/LaTeX-FontAwesome5)
\RequirePackage{fontawesome5}
%-------------------------------------------------------------------------------

\RequirePackage[default,opentype]{sourcesanspro}
% Needed for the photo ID
\RequirePackage[skins]{tcolorbox}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks,unicode]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}


%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: './fonts/')
% Usage: \fontdir[fonts_new_dir/]
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir

% Configure a directory location for images(default: './imgs/')
\graphicspath{
    {imgs/}
}


%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{
    left=2.0cm,
    top=1.5cm,
    right=2.0cm,
    bottom=2.0cm,
    footskip=.5cm
}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}


%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}

% Basic colors
\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

% Text colors
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}

% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-green}{HTML}{008F45}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
\definecolor{awesome-gold}{HTML}{EFCD00}
\colorlet{awesome}{awesome-red}

% Boolean value to switch section color highlighting
\newbool{acvSectionColorHighlight}
\setbool{acvSectionColorHighlight}{true}

% Awesome section color
\def\@sectioncolor#1#2#3{%
  \ifbool{acvSectionColorHighlight}{{\color{awesome}#1#2#3}}{#1#2#3}%
}

% Boolean value to switch enable/disable 'vhrulefill' for 'cvsection'
\newbool{acvSectionVHRuleFill}
\setbool{acvSectionVHRuleFill}{true}


%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
% Set the FontAwesome font to be up-to-date.
\newfontfamily\FA[
    Path=\@fontdir
]{Font-Awesome-4}
% Set the FontAwesome5 font to be up-to-date.
\newfontfamily\FAB[
    Path=\@fontdir,
]{Font-Awesome-5-Brands-Regular-400}
\newfontfamily\FAR[
    Path=\@fontdir,
]{Font-Awesome-5-Free-Regular-400}
\newfontfamily\FAS[
    Path=\@fontdir,
]{Font-Awesome-5-Free-Solid-900}
% Set font for header (default is Roboto)
\newfontfamily\headerfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Roboto}

\newfontfamily\headerfontlight[
  Path=\@fontdir,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Medium,
  BoldItalicFont=*-MediumItalic,
]{Roboto}

\newcommand*{\footerfont}{\sourcesanspro}
\newcommand*{\bodyfont}{\sourcesanspro}
\newcommand*{\bodyfontlight}{\sourcesansprolight}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
% Configure styles for each CV elements
% For fundamental structures
\newcommand*{\headerfirstnamestyle}[1]{{\fontsize{32pt}{1em}\headerfontlight\color{graytext} #1}}
\newcommand*{\headerlastnamestyle}[1]{{\fontsize{32pt}{1em}\headerfont\bfseries\color{text} #1}}
\newcommand*{\headerpositionstyle}[1]{{\fontsize{7.6pt}{1em}\bodyfont\scshape\color{awesome} #1}}
\newcommand*{\headeraddressstyle}[1]{{\fontsize{8pt}{1em}\headerfont\itshape\color{lighttext} #1}}
\newcommand*{\headerpersonalinfostyle}[1]{{\fontsize{9pt}{1em}\headerfont\color{lighttext} #1}}
\newcommand*{\headersocialstyle}[1]{{\fontsize{9pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\headerquotestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\itshape\color{darktext} #1}}
\newcommand*{\footerstyle}[1]{{\fontsize{8pt}{1em}\footerfont\scshape\color{lighttext} #1}}
\newcommand*{\sectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\subsectionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\scshape\textcolor{text}{#1}}}
\newcommand*{\paragraphstyle}{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text}}

% For elements of entry
\newcommand*{\entrytitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{8pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\entryhomepagestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{awesome}{\fontsize{6pt}{1em}\faAlternateExternalLink}~~#1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\upshape\color{text} #1}}

% For elements of subentry
\newcommand*{\subentrytitlestyle}[1]{{\fontsize{8pt}{1em}\bodyfont\mdseries\color{graytext} #1}}
\newcommand*{\subentrypositionstyle}[1]{{\fontsize{7pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\subentrydatestyle}[1]{{\fontsize{7pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\subentrylocationstyle}[1]{{\fontsize{7pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}
\newcommand*{\subdescriptionstyle}[1]{{\fontsize{8pt}{1em}\bodyfontlight\upshape\color{text} #1}}

% For elements of honor
\newcommand*{\honortitlestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorpositionstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\honordatestyle}[1]{{\fontsize{9pt}{1em}\bodyfont\color{graytext} #1}}
\newcommand*{\honorlocationstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{awesome} #1}}

% For elements of skill
\newcommand*{\skillstarstyle}[1]{{\fontsize{10pt}{1em}\color{awesome-gold} #1}}
\newcommand*{\skilltypestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\skillsetstyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\color{text} #1}}

% For elements of the cover letter
\newcommand*{\lettersectionstyle}[1]{{\fontsize{14pt}{1em}\bodyfont\bfseries\color{text}\@sectioncolor #1}}
\newcommand*{\recipientaddressstyle}[1]{{\fontsize{9pt}{1em}\bodyfont\scshape\color{graytext} #1}}
\newcommand*{\recipienttitlestyle}[1]{{\fontsize{11pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\lettertitlestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\bfseries\color{darktext} \underline{#1}}}
\newcommand*{\letterdatestyle}[1]{{\fontsize{9pt}{1em}\bodyfontlight\slshape\color{graytext} #1}}
\newcommand*{\lettertextstyle}{\fontsize{10pt}{1.4em}\bodyfontlight\upshape\color{graytext}}
\newcommand*{\letternamestyle}[1]{{\fontsize{10pt}{1em}\bodyfont\bfseries\color{darktext} #1}}
\newcommand*{\letterenclosurestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\slshape\color{lighttext} #1}}


%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define photo ID
% Usage: \photo[circle|rectangle,edge|noedge,left|right]{<path-to-image>}
\newcommand{\photo}[2][circle,edge,left]{%
  \def\@photo{#2}
  \@for\tmp:=#1\do{%
    \ifthenelse{\equal{\tmp}{circle} \or \equal{\tmp}{rectangle}}%
      {\let\@photoshape\tmp}{}%
    \ifthenelse{\equal{\tmp}{edge} \or \equal{\tmp}{noedge}}%
      {\let\@photoedge\tmp}{}%
    \ifthenelse{\equal{\tmp}{left} \or \equal{\tmp}{right}}%
      {\let\@photoalign\tmp}{}%
  }%
}
\def\@photoshape{circle}
\def\@photoedge{edge}
\def\@photoalign{left}

% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
% Usage: \firstname{<firstname>}
% Usage: \lastname{<lastname>}
% Usage: \familyname{<familyname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\familyname}[1]{\def\@lastname{#1}}
\def\@familyname{\@lastname}

% Define writer's address
% Usage: \address{<address>}
\newcommand*{\address}[1]{\def\@address{#1}}

% Define writer's position
% Usage: \name{<position>}
\newcommand*{\position}[1]{\def\@position{#1}}

% Defines writer's mobile (optional)
% Usage: \mobile{<mobile number>}
\newcommand*{\mobile}[1]{\def\@mobile{#1}}

% Defines writer's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}

% Defines writer's gitlab (optional)
% Usage: \gitlab{<gitlab-nick>}
\newcommand*{\gitlab}[1]{\def\@gitlab{#1}}

% Defines writer's stackoverflow profile (optional)
% Usage: \stackoverflow{<so userid>}{<so username>}
%   e.g.https://stackoverflow.com/users/123456/sam-smith
%       would be \stackoverflow{123456}{sam-smith}
\newcommand*{\stackoverflow}[2]{\def\@stackoverflowid{#1}\def\@stackoverflowname{#2}}

% Defines writer's linked-in (optional)
% Usage: \linkedin{<linked-in-nick>}
\newcommand*{\linkedin}[1]{\def\@linkedin{#1}}

% Defines writer's twitter (optional)
% Usage: \twitter{<twitter handle>}
\newcommand*{\twitter}[1]{\def\@twitter{#1}}

% Defines writer's skype (optional)
% Usage: \skype{<skype account>}
\newcommand*{\skype}[1]{\def\@skype{#1}}

% Defines writer's reddit (optional)
% Usage: \reddit{<reddit account>}
\newcommand*{\reddit}[1]{\def\@reddit{#1}}

% Defines writer's xing (optional)
% Usage: \xing{<xing name>}
\newcommand*{\xing}[1]{\def\@xing{#1}}

% Defines writer's medium profile (optional)
% Usage: \medium{<medium account>}
\newcommand*{\medium}[1]{\def\@medium{#1}}

% Defines writer's google scholar profile (optional)
% Usage: \googlescholar{<googlescholar userid>}{<googlescholar username>}
% e.g.https://scholar.google.co.uk/citations?user=wpZDx1cAAAAJ
% would be \googlescholar{wpZDx1cAAAAJ}{Name-to-display-next-icon}
% If 'googlescholar-name' is not provided than it defaults to
% '\firstname \lastname'
\newcommand*{\googlescholar}[2]{%
  \def\@googlescholarid{#1}%
  \ifthenelse{\equal{#2}{}}{%
    \def\@googlescholarname{\@firstname~\@lastname}%
  }{%
    \def\@googlescholarname{#2}%
  }%
}

% Defines writer's extra informations (optional)
% Usage: \extrainfo{<extra informations>}
\newcommand*{\extrainfo}[1]{\def\@extrainfo{#1}}

% Defines writer's quote (optional)
% Usage: \quote{<quote>}
\renewcommand*{\quote}[1]{\def\@quote{#1}}

% Defines recipient's information (cover letter only)
% Usage: \recipient{<recipient name>}{<recipient address>}
% Usage: \recipientname{<recipient name>}
% Usage: \recipientaddress{<recipient address>}
\newcommand*{\recipient}[2]{\def\@recipientname{#1}\def\@recipientaddress{#2}}
\newcommand*{\recipientname}[1]{\def\@recipientname{#1}}
\newcommand*{\recipientaddress}[1]{\def\@recipientaddress{#1}}

% Defines the title for letter (cover letter only, optional)
% Usage: \lettertitle{<title>}
\newcommand*{\lettertitle}[1]{\def\@lettertitle{#1}}

% Defines the date for letter (cover letter only)
% Usage: \letterdate{<date>}
\newcommand*{\letterdate}[1]{\def\@letterdate{#1}}

% Defines a message of opening for letter (cover letter only)
% Usage: \letteropening{<message>}
\newcommand*{\letteropening}[1]{\def\@letteropening{#1}}

% Defines a message of closing for letter (cover letter only)
% Usage: \letterclosing{<message>}
\newcommand*{\letterclosing}[1]{\def\@letterclosing{#1}}

% Defines an enclosure for letter (cover letter only, optional)
% Usage: \letterenclosure[<enclosure name>]{<enclosure>}
\newcommand*{\letterenclname}[1][Enclosure]{\def\@letterenclname{#1}}
\newcommand*{\letterenclosure}[2][]{%
  % if an optional argument is provided, use it to redefine \enclname
  \ifthenelse{\equal{#1}{}}{}{\def\@letterenclname{#1}}
  \def\@letterenclosure{#2}
}


%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
%% Define helper macros a user can change easily
% Header
\newcommand{\acvHeaderNameDelim}{\space}
\newcommand{\acvHeaderAfterNameSkip}{.4mm}
\newcommand{\acvHeaderAfterPositionSkip}{.4mm}
\newcommand{\acvHeaderAfterAddressSkip}{-.5mm}
\newcommand{\acvHeaderAfterPersonalInfoSkip}{.4mm}
\newcommand{\acvHeaderIconSep}{\space}
\newcommand{\acvHeaderSocialSep}{\quad\textbar\quad}
\newcommand{\acvHeaderAfterSocialSkip}{6mm}
\newcommand{\acvHeaderAfterQuoteSkip}{5mm}

% Others
\newcommand{\acvSectionTopSkip}{3mm}
\newcommand{\acvSkillStarTopSkip}{1mm}
\newcommand{\acvSectionContentTopSkip}{2.5mm}


%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
% Use to align an element of tabular table
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}p{#1}}

% Use to draw horizontal line with specific thickness
\def\vhrulefill#1{
    \ifbool{acvSectionVHRuleFill}
        {
            \leavevmode\leaders\hrule\@height#1\hfill \kern\z@
        }
        {}%
}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}

% ================================================================
% Prints tilde sign which works correctly within URL when copy
% and pasted from pdf into a browser
\newcommand{\urltilde}{\char`\~}

% Returns minipage width minus two times \fboxsep
% to keep padding included in width calculations
\newcommand{\mpwidth}{\linewidth-\fboxsep-\fboxsep}

% CUSTOM STRUT FOR EMPTY BOXES
\newcommand{\mystrut}{
    \rule[-.3\baselineskip]{0pt}{\baselineskip}
}
% Shortcut for 10 word lorem
\newcommand{\lorem}{
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec a diam lectus.
}
% To highlight parts that needs to be filled in
\newcommand{\fillme}[1][]{
    \fcolorbox{white}{awesome-skyblue}{
        {\fontsize{10pt}{1em}\bodyfontlight\bfseries\color{white}
            Fill me
            \ifempty{#1}%
			    {}
                {:~#1}%
        }
    }
}
% use to vertically center content
% credits to: http://tex.stackexchange.com/questions/7219/how-to-vertically-center-two-images-next-to-each-other
\newcommand*{\vcenteredhbox}[1]{
    \begingroup
    \setbox0=\hbox{#1}\parbox{\wd0}{\box0}
    \endgroup
}

% ================================================================

%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Define a header for CV
% Usage: \makecvheader
\newcommand*{\makecvheader}[1][C]{%
	\newcommand*{\drawphoto}{%
		\ifthenelse{\isundefined{\@photo}}{}{%
			\newlength{\photodim}
			\ifthenelse{\equal{\@photoshape}{circle}}%
			{\setlength{\photodim}{1.3cm}}%
			{\setlength{\photodim}{1.8cm}}%
			\ifthenelse{\equal{\@photoedge}{edge}}%
			{\def\@photoborder{darkgray}}%
			{\def\@photoborder{none}}%
			\begin{tikzpicture}%
				\node[\@photoshape, draw=\@photoborder, line width=0.3mm, inner sep=\photodim, fill overzoom image=\@photo] () {};
			\end{tikzpicture}
		}%
	}
	\newlength{\headertextwidth}
	\newlength{\headerphotowidth}
	\ifthenelse{\isundefined{\@photo}}{
		\setlength{\headertextwidth}{\textwidth}
		\setlength{\headerphotowidth}{0cm}
	}{%
		\setlength{\headertextwidth}{0.76\textwidth}
		\setlength{\headerphotowidth}{0.24\textwidth}
	}%
	\begin{minipage}[c]{\headerphotowidth}%
		\ifthenelse{\equal{\@photoalign}{left}}{\raggedright\drawphoto}{}
	\end{minipage}
	\begin{minipage}[c]{\headertextwidth}
		\ifthenelse{\equal{#1}{L}}{\raggedright}{\ifthenelse{\equal{#1}{R}}{\raggedleft}{\centering}}
		\headerfirstnamestyle{\@firstname}\headerlastnamestyle{{}\acvHeaderNameDelim\@lastname}\\[\acvHeaderAfterNameSkip]%
		\ifthenelse{\isundefined{\@position}}{}{\headerpositionstyle{\@position\\[\acvHeaderAfterPositionSkip]}}%
        \headerpersonalinfostyle{
            \newbool{isstart}%
            \setbool{isstart}{true}%
            \ifthenelse{\isundefined{\@address}}%
			{}%
			{%
				\faAlternateMapMarker\acvHeaderIconSep\@address%
				\setbool{isstart}{false}%
			}%
            \ifthenelse{\isundefined{\@mobile}}%
			{}%
			{%
                \ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\faAlternateMobile\acvHeaderIconSep\@mobile%
			}%
            \ifthenelse{\isundefined{\@email}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\href{mailto:\@email}{\faEnvelopeR\acvHeaderIconSep\@email}%
			}%
			\ifthenelse{\isundefined{\@homepage}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\href{http://\@homepage}{\faInternetExplorer\acvHeaderIconSep\@homepage}%
			}%
        }\\[\acvHeaderAfterPersonalInfoSkip]%
		\headersocialstyle{%
			\newbool{isstart}%
			\setbool{isstart}{true}%
			\ifthenelse{\isundefined{\@github}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\href{https://github.com/\@github}{\faGithubSquare\acvHeaderIconSep\@github}%
			}%
			\ifthenelse{\isundefined{\@gitlab}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\href{https://gitlab.com/\@gitlab}{\faGitlab\acvHeaderIconSep\@gitlab}%
			}%
			\ifthenelse{\isundefined{\@stackoverflowid}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\href{https://stackoverflow.com/users/\@stackoverflowid}{\faStackOverflow\acvHeaderIconSep\@stackoverflowname}%
			}%
			\ifthenelse{\isundefined{\@linkedin}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\href{https://www.linkedin.com/in/\@linkedin}{\faLinkedIn\acvHeaderIconSep\@linkedin}%
			}%
			\ifthenelse{\isundefined{\@medium}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\href{https://medium.com\\@\@medium}{\faMedium\acvHeaderIconSep\@medium}%
			}%
			\ifthenelse{\isundefined{\@googlescholarid}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\href{https://scholar.google.com/citations?user=\@googlescholarid}{\faGraduationCap\acvHeaderIconSep\@googlescholarname}%
			}%
			\ifthenelse{\isundefined{\@twitter}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\href{https://twitter.com/\@twitter}{\faTwitter\acvHeaderIconSep\@twitter}%
			}%
			\ifthenelse{\isundefined{\@skype}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\faSkype\acvHeaderIconSep\@skype%
			}%
			\ifthenelse{\isundefined{\@reddit}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\href{https://www.reddit.com/user/\@reddit}{\faReddit\acvHeaderIconSep\@reddit}%
			}%
			\ifthenelse{\isundefined{\@xing}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\href{https://www.xing.com/profile/\@xing}{\faXingSquare\acvHeaderIconSep\@xing}
			}%
			\ifthenelse{\isundefined{\@extrainfo}}%
			{}%
			{%
				\ifbool{isstart}{\setbool{isstart}{false}}{\acvHeaderSocialSep}%
				\@extrainfo%
			}%
		} \\[\acvHeaderAfterSocialSkip]%
		\ifthenelse{\isundefined{\@quote}}{}{\headerquotestyle{\@quote\\}\vspace{\acvHeaderAfterQuoteSkip}}%
	\end{minipage}%
	\begin{minipage}[c]{\headerphotowidth}%
		\ifthenelse{\equal{\@photoalign}{right}}{\raggedleft\drawphoto}{}
	\end{minipage}
}

% Define a footer for CV
% Usage: \makecvfooter{<left>}{<center>}{<right>}
\newcommand*{\makecvfooter}[3]{%
    \fancyfoot{}
    \fancyfoot[L]{\footerstyle{#1}}
    \fancyfoot[C]{\footerstyle{#2}}
    \fancyfoot[R]{\footerstyle{#3}}
}

% Define a section for CV
% Supports optional argument to change alignment(L: left, C: center, R: right)
% Usage: \cvsection[L|C|R]{<section-title>}
\newcommand{\cvsection}[2][L]{%
	\vspace{\acvSectionTopSkip}
	\ifthenelse{\equal{#1}{L}}
	{
		{\raggedright\sectionstyle{#2}{\color{gray}\vhrulefill{0.9pt}}}
	}
	{
		\ifthenelse{\equal{#1}{R}}
		{
			{\raggedleft{\color{gray}\vhrulefill{0.9pt}}\sectionstyle{#2}}
		}
		{
			{\centering{\color{gray}\vhrulefill{0.9pt}}\sectionstyle{#2}{\color{gray}\vhrulefill{0.9pt}}\par}
		}
	}
	\phantomsection
}

% Define a subsection for CV
% Usage: \cvsubsection{<subsection-title>}
\newcommand{\cvsubsection}[1]{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \subsectionstyle{#1}
  \phantomsection
}

% Define a paragraph for CV
\newenvironment{cvparagraph}{%
  \vspace{\acvSectionContentTopSkip}
  \vspace{-3mm}
  \paragraphstyle
}{%
  \par
  \vspace{2mm}
}

% Define an environment for cventry
\newenvironment{cventries}{%
  \vspace{\acvSectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
}
% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand*{\cventry}[5]{%
  \vspace{-1.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \ifempty{#2#3}
      {\entrypositionstyle{#1} & \entrydatestyle{#4} \\}
      {\entrytitlestyle{#2} & \entrylocationstyle{#3} \\
      \entrypositionstyle{#1} & \entrydatestyle{#4} \\}
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
  \end{tabular*}%
}
% Define a project entry of cv information
% Usage: \cvproject{<title>}{<homepage>}{<description>}
\newcommand*{\cvproject}[3]{%
    \vspace{-3.0mm}
    \begin{minipage}[t]{0.5\linewidth}
        \raggedright
        \entrytitlestyle{#1}
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.45\linewidth}
        \raggedleft
        \entryhomepagestyle{#2}
    \end{minipage}
    \begin{minipage}[t]{\linewidth}
        \descriptionstyle{#3}
    \end{minipage}
}
\newcommand*{\cvpublication}[3]{%
    \setlength\tabcolsep{0pt}
    \setlength{\extrarowheight}{0pt}
    \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 1cm} R{1cm}}
        \entrytitlestyle{#1} & \entrydatestyle{#2} \\
        \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#3}}
    \end{tabular*}%
}

% Define an environment for cvsubentry
\newenvironment{cvsubentries}{%
    \begin{center}
}{%
    \end{center}
}
% Define a subentry of cv information
% Usage: \cvsubentry{<position>}{<title>}{<date>}{<description>}
\newcommand*{\cvsubentry}[4]{%
	\setlength\tabcolsep{0pt}
	\setlength{\extrarowheight}{0pt}
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
		\setlength\leftskip{0.2cm}
		\subentrytitlestyle{#2} & \ifthenelse{\equal{#1}{}}
		{\subentrydatestyle{#3}}{}
		\ifthenelse{\equal{#1}{}}
		{}
		{\subentrypositionstyle{#1} & \subentrydatestyle{#3} \\}
		\ifthenelse{\equal{#4}{}}
		{}
		{\multicolumn{2}{L{17.0cm}}{\subdescriptionstyle{#4}} \\}
	\end{tabular*}
}

% Define an environment for cvhonor
\newenvironment{cvhonors}{%
    \vspace{\acvSectionContentTopSkip}
    \vspace{-2mm}
    \begin{center}
    	\setlength\tabcolsep{0pt}
    	\setlength{\extrarowheight}{0pt}
    	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} C{1cm} L{\textwidth - 4cm} R{3cm}}
    		}{%
    	\end{tabular*}
    \end{center}
}
% Define a line of cv information(honor, award or something else)
% Usage: \cvhonor{<Award>}{<Event>}{<Date/Location>}{<Logo>}
\newcommand*{\cvhonor}[4]{%
  \honordatestyle{#4} & \honorpositionstyle{#1}, \honortitlestyle{#2} & \honorlocationstyle{#3} \\
}

% Define an environment for cvskill
% Usage: \begin{cvskills}{<number-full-stars>}{<half-star>} ... \end{cvskills}
\newcounter{starCounter}
\newcounter{starHalfCounter}
\newenvironment{cvskills}[2]{%
	\begin{center}
        \ifnum#1=0
        {}
        \else
            % Create stars to indicate proficiency (out of 5 with 0.5 step)
            % First draw full stars, then half star (if present), then empty start
            \vspace{\acvSkillStarTopSkip}
    		\setcounter{starCounter}{0}
    		\setcounter{starHalfCounter}{0}
    		\whiledo {\value{starCounter} < 5}%
    		{%
    			\ifnum\value{starCounter} < #1
                    \skillstarstyle{\faStarS}
    			\else
                    \ifnum#2=1
                        \ifnum\value{starHalfCounter} < 1
                            \skillstarstyle{\faAlternateStarHalf}
                            \stepcounter{starHalfCounter}
                        \else
                            \skillstarstyle{\faStarR}
                        \fi
                    \else
                        \skillstarstyle{\faStarR}
                    \fi
    			\fi
    			\stepcounter{starCounter}%
    		}\\
        \fi
        \vspace{\acvSectionContentTopSkip}
		\setlength\tabcolsep{1ex}
		\setlength{\extrarowheight}{0pt}
		\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} r L{\textwidth * \real{0.9}}}
			}{%
		\end{tabular*}
	\end{center}
}

% Define a line of cv information(skill)
% Usage: \cvskill{<type>}{<icon>}{<skillset>}
\newcommand*{\cvskill}[3]{%
    \ifempty{#3}
        {\skilltypestyle{#2} & \skilltypestyle{#1} \\}
        {\skilltypestyle{#2} & \skilltypestyle{#1} \\
        \multicolumn{2}{L{\textwidth}}{\skillsetstyle{#3}} \\}
}

% Define an environment for cvitems(for cventry)
\newenvironment{cvitems}{%
	\vspace{-4.0mm}
	\begin{justify}
		\begin{itemize}[leftmargin=2ex, nosep, noitemsep]
			\setlength{\parskip}{0pt}
			\renewcommand{\labelitemi}{\bullet}
			}{%
		\end{itemize}
	\end{justify}
	\vspace{-4.0mm}
}


%-------------------------------------------------------------------------------
%                Commands for elements of Cover Letter
%-------------------------------------------------------------------------------
% Define an environment for cvletter
\newenvironment{cvletter}{%
        \lettertextstyle
    }{%
}

% Define a section for the cover letter
% Supports optional argument to change alignment(L: left, C: center, R: right)
% Usage: \lettersection[L|C|R]{<section-title>}
\newcommand{\lettersection}[2][L]{%
    \par\addvspace{2.5ex}
    \phantomsection{}
    \ifthenelse{\equal{#1}{L}}
	{
		{\raggedright\lettersectionstyle{#2}{\color{gray}\vhrulefill{0.9pt}}}
	}
	{
		\ifthenelse{\equal{#1}{R}}
		{
			{\raggedleft{\color{gray}\vhrulefill{0.9pt}}\lettersectionstyle{#2}}
		}
		{
			{\centering{\color{gray}\vhrulefill{0.9pt}}\lettersectionstyle{#2}{\color{gray}\vhrulefill{0.9pt}}}
		}
	}
    \par\nobreak\addvspace{0.4ex}
}

% Define an environment for lettermatchitem
% Usage:
% \begin{lettermatchitems}{<Column-name-1>}{<Column-name-2>}
%     \lettermatchitem{<R-1>}{<M-1>}
%     ...
%     \lettermatchitem{<R-n>}{<M-n>}
% \end{lettermatchitems}
\newenvironment{lettermatchitems}[2]{%
    \begin{center}
        \ifthenelse{\isempty{#1} \or \isempty{#2}}
            {}
            {
                \begin{minipage}[t]{0.47\linewidth} \centering\bfseries #1 \end{minipage}
                \hfill
                \begin{minipage}[t]{0.47\linewidth} \centering\bfseries #2 \end{minipage}
            }
        \setlength\tabcolsep{0pt}
        \setlength{\extrarowheight}{8pt}
        \begin{tabular*}{\linewidth}{@{\extracolsep{\fill}} L{0.47\linewidth} L{0.47\linewidth}}
            }{%
        \end{tabular*}
    \end{center}
}

% Define a required-matching qualification item for the cover letter
% Usage: \lettermatchitem{<required-qualification>}{<matching-qualification>}
\newcommand{\lettermatchitem}[2]{%
    \faQuestionCircle\hfill \begin{minipage}[t]{0.93\linewidth} #1 \end{minipage} &
    {\color{awesome-green}\faCheckCircle}\hfill \begin{minipage}[t]{0.93\linewidth} #2 \end{minipage}\\
}

% Define a title of the cover letter
% Usage: \makelettertitle
\newcommand*{\makelettertitle}{%
  \vspace{8.4mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}} L{\textwidth - 4.5cm} R{4.5cm}}
    \recipienttitlestyle{\@recipientname} & \letterdatestyle{\@letterdate}
  \end{tabular*}
  \begin{singlespace}
    \recipientaddressstyle{\@recipientaddress} \\\\
  \end{singlespace}
  \ifthenelse{\isundefined{\@lettertitle}}
    {}
    {\lettertitlestyle{\@lettertitle} \\}
  \lettertextstyle{\@letteropening}
}

% Define a closing of the cover letter
% Usage: \makeletterclosing
\newcommand*{\makeletterclosing}{%
  \vspace{3.4mm}
  \lettertextstyle{\@letterclosing} \\\\
  \letternamestyle{\@firstname\ \@lastname}
  \ifthenelse{\isundefined{\@letterenclosure}}
    {\\}
    {%
      \\\\\\
      \letterenclosurestyle{\@letterenclname: \@letterenclosure} \\
    }
}
