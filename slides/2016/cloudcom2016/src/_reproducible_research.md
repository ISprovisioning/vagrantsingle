### Reproducible Research Movement

<!-- Courtesy L. Nussbaum -->

\begin{textblock}{0.2}(0.750,0.47)
  \imgw{}{Descartes_Discours_de_la_Methode.jpg}
\end{textblock}


\bbegin{}

* Originated mainly in _Computational Sciences_
     - Computational biology, data-intensive physics, etc.
* Explores methods and tools to enhance experimental practices
     - Enable others to reproduce and build upon one’s work

\bend

* _Nothing New_
     - Fundamental basis of the scientific method
     - K. Poppler, 1934: \textit{non-reproducible single\newline occurrences are of no significance to science}


### Replicability vs. Reproducibility

\begin{textblock}{0.6}(0.3,0.46)\tiny
\hfill\tiny \textit{\structure{Courtesy} of Andrew Davison "Automatic Tracking of computational experiments using Sumatra" (AMP Workshop on Reproducible research) CC-by-NC-SA, 2011}
\end{textblock}


* Terminology varies\footcite{Feitelson15}
     - _Replicability_ $\sim$ same result
     - _Reproducibity_ $\sim$ same scientific conclusions

\imgw{}{sumatra_amp2011.pdf}


### Reproducibility in Practice

\bbegin{Reproducibility (Wikipedia)}

* the ability of an entire experiment or study to be _reproduced_,
     - either by the researcher
     - or by someone else working independently.
* One of the main principles of the scientific method.

\bend


* For an experiment involving software, reproducibility means:
     - _open access_ to the scientific article describing it
     - _open data_   sets used in the experiment
     - _source code_ of all the components
     - _environment_ of execution
     - _stable references_ between all this


### The Research Pipeline

\transientimg{1}{width=\linewidth,subfig=1}{images/author_reader_rr/author_reader_rr.fig}
\transientimg{2}{width=\linewidth,subfig=2}{images/author_reader_rr/author_reader_rr.fig}
\transientimg{3}{width=\linewidth,subfig=3}{images/author_reader_rr/author_reader_rr.fig}
\transientimg{4}{width=\linewidth,subfig=4}{images/author_reader_rr/author_reader_rr.fig}
\transientimg{5}{width=\linewidth}{images/author_reader_rr/author_reader_rr_analysis.fig}

\just{5}{\begin{textblock}{0.7}(0.35,0.75)\small
  \alert{Analysis is generally not very domain-specific}
\end{textblock}
}

\courtesy{A. Legrand, inspired by Roger D. Peng's lecture on reproducible research, May 2014}


### Reproducible Research Challenges

* The _Distributed/Cloud Computing point-of-view_:
     - _Experiments_ remains **the HARD part** and is very domain-specific
         * Rely on large, distributed, hybrid, prototype hardware/software
         * Measure execution times (makespans, traces, \ldots{})
         * Many parameters, very costly and hard to _\alert{reproduce}_

\centering\imgw{0.9}{phdcomic.pdf}

### Environment Management

\bbegin{Controlling/Providing your Environment}

* An _environment_ is a \alert{set of tools and materials} that permits a \alert{complete
reproducibility} of \textit{part/whole} experiment process.

\bend

. . .

\wbegin{}\centering

**Q1**: \alert{How to describe/provide the software environment used?}

\wend

> "I used [OpenFOAM](http://www.openfoam.com/) with [OpenMPI](https://www.open-mpi.org/) on [Debian](https://www.debian.org/)"

* Obvious solution: _Virtual Machines_
     - Easy way to [automatically] test recipes \hfill{}
     - **Yet** provides **only** the final result, _not the logic behind_



### RR: Trying to Bridge the Gap

\exbegin{}

* Accurate, organized and _easy-to\{read|take|share\} Docs_
    - [ Markdown](https://guides.github.com/features/mastering-markdown/), [mkdocs](http://www.mkdocs.org/), [org-mode](http://doc.norang.ca/org-mode.html), [Read the Docs](https://readthedocs.org/)...

. . .

* _Sharing Code and Data_
    - [`git`](https://git-scm.com/), [Github](https://github.com/), [Bitbucket](https://bitbucket.org/), [Gitlab](https://about.gitlab.com/)...

. . .

* _Mastering your environment clean and automated_ by:
    - Using common building tools \hfill{make, cmake etc.}
    - Using a constrained environment
          * Sandboxed Ruby/Python,[Vagrant](https://www.vagrantup.com), [Docker](https://www.docker.com/)
    - Automate its building through cross-platform recipes
    - Automatically test your recipes for Environment configuration

\exend

\just{4}{
  \begin{textblock}{0.7}(0.2,0.2)
  \begin{turn}{45}
  \begin{tcolorbox}\Large\centering\alert{\textbf{All covered in this tutorial!}}\end{tcolorbox}
  \end{turn}
\end{textblock}
}
