%
% clavex.cls
%
% Classe LaTeX utile pour réaliser un CV.
%
% (C) 2011-2013 Guilhem Tiennot.
%
% This class is released under the terms of the GNU GPL version 2.
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

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{clavex}

% Options
\newcommand\@myptsize{}
\newcommand\@mypapersize{}
\newcommand\@haspicture{}
\newcommand\@cvcolor{}
\newcommand\@cvsubcolor{}
\DeclareOption{a4paper}
              {\renewcommand\@mypapersize{a4paper}}
\DeclareOption{10pt}
              {\renewcommand\@myptsize{10pt}}
\DeclareOption{11pt}
              {\renewcommand\@myptsize{11pt}}
\DeclareOption{12pt}
              {\renewcommand\@myptsize{12pt}}
\DeclareOption{sansserif}
              {\renewcommand\familydefault{\sfdefault}}
\DeclareOption{serif}
              {\renewcommand\familydefault{\rmdefault}}
\DeclareOption{nophoto}
              {\renewcommand\@haspicture{0}}
\DeclareOption{photo}
              {\renewcommand\@haspicture{1}}
\DeclareOption{color=blue}
              {\renewcommand\@cvcolor{\color[rgb]{0.3,0.3,1}}
               \renewcommand\@cvsubcolor{\color[rgb]{0.5,0.5,1}}}
\DeclareOption{color=green}
              {\renewcommand\@cvcolor{\color[rgb]{0.3,0.6,0.3}}
               \renewcommand\@cvsubcolor{\color[rgb]{0.4,0.9,0.4}}}
\DeclareOption{color=lightgreen}
              {\renewcommand\@cvcolor{\color[rgb]{0.3,1,0.3}}
               \renewcommand\@cvsubcolor{\color[rgb]{0.5,1,0.5}}}
\DeclareOption{color=yellow}
              {\renewcommand\@cvcolor{\color[rgb]{0.9,0.9,0}}
               \renewcommand\@cvsubcolor{\color[rgb]{0.9,0.9,0.3}}}
\DeclareOption{color=orange}
              {\renewcommand\@cvcolor{\color[rgb]{1,0.5,0.2}}
               \renewcommand\@cvsubcolor{\color[rgb]{1,0.6,0.3}}}
\DeclareOption{color=red}
              {\renewcommand\@cvcolor{\color[rgb]{1,0.3,0.3}}
               \renewcommand\@cvsubcolor{\color[rgb]{0.9,0.5,0.5}}}
\DeclareOption{color=no}
              {\renewcommand\@cvcolor{}
               \renewcommand\@cvsubcolor{\color[rgb]{0.3,0.3,0.3}}}
\ExecuteOptions{a4paper,10pt,sansserif,nophoto,color=blue}
\ProcessOptions

\LoadClass[\@mypapersize,\@myptsize]{article}

% packages
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{marvosym}
\RequirePackage{fancybox}
\RequirePackage[colorlinks=false,hidelinks]{hyperref}


%%%%% Définition de marges personnalisées %%%%%
%
% Suppression de l'entête, inutile ici
\setlength{\headheight}{0cm}
\setlength{\headsep}{0cm}
%
% Suppression de la marge à gauche sur les pages
% paires, puis impaires
\setlength{\oddsidemargin}{-0.5cm}
\setlength{\evensidemargin}{-0.5cm}
%
% Suppression de la marge supérieure
\setlength{\topmargin}{-1.5cm}
%
% Suppression des notes en marge à droite
\setlength{\marginparsep}{0cm}
\setlength{\marginparwidth}{0cm}
%
\setlength{\textwidth}{17cm}
\setlength{\textheight}{27.7cm}
% Suppression de l'indentation des paragraphes
\setlength{\parindent}{0cm}
%
% Largeur de la colonne années
\newlength{\yearwidth}
\setlength{\yearwidth}{1.9cm}
% Largeur de la colonne description
\newlength{\descriptionwidth}
\setlength{\descriptionwidth}{\textwidth}
\addtolength{\descriptionwidth}{-\yearwidth}
% Largeur pour les photos
\newlength{\@photowidth}
\setlength{\@photowidth}{3cm}
%
%
% --- Ces longueurs ne sont utilisés que pour les cv sans photo ---
% Largeur de la colonne nom/profession
\newlength{\@namewidth}
\setlength{\@namewidth}{8cm}
%%%%% Fin de la définition des marges %%%%%

% suppression des numéros de page
\pagestyle{empty}




% commandes

% On rend toutes les commandes optionnelles (sauf l'adresse)
\newcommand{\@profession}{}
\newcommand{\@telephone}{}
\newcommand{\@portable}{}
\newcommand{\@fax}{}
\newcommand{\@email}{}
\newcommand{\@website}{}
\newcommand{\@autre}{}

% Couleur du groupe coordonnées
\newcommand\@coordcolor{\color[rgb]{0.4,0.4,0.4}}


% Commande pour ajouter un séparateur entre les coordonnées, mais
% pas en fin de ligne
\newsavebox\@ANDbox
\newcommand{\@AND}{%
\savebox\@ANDbox{\textbullet}%
\unskip
\quad
\cleaders\copy\@ANDbox\hskip\wd\@ANDbox
\quad
\ignorespaces}


% Bloc des coordonnées

\newcommand{\makecoords}{%
	\begin{minipage}{\textwidth}
		\if\@haspicture0
			\begin{center}
				{\Huge \@cvcolor{} \bfseries \@nom}
				\par
				\vspace{0.2cm}

				\@coordcolor
				\@profession
				\par
				\vspace{0.2cm}
		\else
				\newlength{\@coordswidth}
				\setlength{\@coordswidth}{\textwidth}
				\addtolength{\@coordswidth}{-\@photowidth}
				\parbox{\@coordswidth}{%
				\begin{flushleft}
					{\Large \@cvcolor{} \bfseries \@nom}
					\par
					\vspace{0.2cm}

					\@coordcolor
					\@profession
					\par
					\vspace{0.2cm}
		\fi

				\large
				\@adresse\par
				\@telephone
				\@portable
				\@fax
				\@email
				\@website\\
				\@autre
		\if\@haspicture0
			\end{center}
		\else
			\end{flushleft}}
			\@photo
		\fi
	\end{minipage}
}

\newcommand{\nom}[1]{\newcommand{\@nom}{#1}}
\newcommand{\profession}[1]{\renewcommand{\@profession}{{\Large#1}}}
\newcommand{\adresse}[1]{\newcommand{\@adresse}{#1}}
\newcommand{\telephone}[1]{\renewcommand{\@telephone}{\Telefon~#1\@AND}}
\newcommand{\portable}[1]{\renewcommand{\@portable}{\Mobilefone~#1\@AND}}
\renewcommand{\fax}[1]{\renewcommand{\@fax}{\Faxmachine~#1\@AND}}
\newcommand{\email}[1]{\renewcommand{\@email}{\href{mailto:#1}{\Writinghand~#1}\@AND}}
\newcommand{\website}[1]{\renewcommand{\@website}{\href{#1}{\ComputerMouse~#1}}}
\newcommand{\autre}[1]{\renewcommand{\@autre}{#1}}
\newcommand{\photo}[1]{%
  \newcommand{\@photo}{%
    {\setlength{\@photowidth}{0.9\@photowidth}
    \parbox{\@photowidth}{\includegraphics[width=\@photowidth]{#1}}
	}
  }
}

%%% Catégorie où classer des compétences

\renewcommand{\section}[1]
{%
	{%
		\@cvcolor{}
		\Large\bfseries #1
		\par
		\rule[0.45em]{\textwidth}{0.4pt}\ignorespaces
	}%
	\normalsize%
}

%%% paragraphe décrivant une compétence

\newcommand{\competence}[4]{%
  \parbox[t]{\yearwidth}{\textit{#1}}%
  \parbox[t]{\descriptionwidth}{%
    \if#2%
    \else%
      \textbf{\@cvcolor{}#2}
      \emph{\@cvsubcolor{}#3}
      \par
    \fi%
    #4
    \par\vspace{0.2cm}
  }%
}

%%% Définition d'un tag

\newenvironment{tags}
{\begin{center}%
\vspace{-1em}}
{\end{center}%
\vspace{-0.5em}}
\newcommand{\tag}[1]{\bfseries\@cvcolor#1\@AND}

%%% Au cas où le cv comporterait un titre

\renewcommand\maketitle{%
  \begin{center}
    {\Huge \bfseries \@cvcolor{} \@title}
  \end{center}%
}

\endinput
