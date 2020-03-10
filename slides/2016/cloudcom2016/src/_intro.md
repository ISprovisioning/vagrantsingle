### Validation in (Computer) Science { .t }
<!-- Courtesy L.Nussbaum -->

\begin{textblock}{0.25}(0.7,0.2)
  \imgw{}{BigBangTheory.jpg}

  \imgw{}{The-Large-Hadron-Collider.jpg}
\end{textblock}


* Two classical approaches for validation:
    - _Formal_: equations, proofs, etc.
    - _Experimental_, on a scientific instrument
* Often a mix of both:
    - In Physics
    - In Computer Science
* Quite a lot of _formal_ work in Computer Science
* But also quite a lot of experimental validation
    - Distributed computing, networking
         * testbeds: [IoT-LAB](https://www.iot-lab.info/), [Grid'5000](https://www.grid5000.fr)...
    - Language/image processing $\leadsto$ evaluations using large corpuses

. . .

\wbegin{}\centering

\alert{How good are we at performing experiments?}

\wend

\courtesy{L. Nussbaum}

### (Poor) State of Experimentation in CS

* _1994_: survey of 400 papers\footcite{Lukowicz94}
    - among published CS articles in ACM journals
    - _40\%-50\%_ of those **\alert{requiring}** an experimental validation **\alert{had none}**
* _1998_: survey of 612 papers\footcite{zelk98}
    - too many papers have **no experimental validation at all**
    - too many papers use an informal (assertion) form of validation
    - 2009 update: situation is improving\footcite{zelk09}

### (Poor) State of Experimentation in CS

* Most papers _do not use_ even basic statistical tools
    - Papers published at the Europar conference\footnote{Study carried out by E. Jeannot.}

\scriptsize

|          Year | #Papers | With error bars | Percentage |
|---------------|---------|-----------------|------------|
|          2007 |      89 |               5 |       5.6% |
|          2008 |      89 |               3 |       3.4% |
|          2009 |      86 |               2 |       2.4% |
|          2010 |      90 |               6 |       6.7% |
|          2011 |      81 |               7 |       8.6% |
|---------------|---------|-----------------|------------|
| **2007-2001** | **435** |          **23** |   **5.3%** |


### (Poor) State of Experimentation in CS

* _2007_: [Survey](http://www.comp.brad.ac.uk/het-net/tutorials/P37.pdf) of simulators used in P2P research\footcite{Naicken:2007:SPS:1232919.1232932}
     - 287 papers surveyed on P2P networking subject
     - _141_ of these papers _reports the use of a simulator_
          * 30% use a custom tool
          * 50% don't report the used tool!

\centering
\piechart{0.4}{
  30.5/Custom,
  50.4/Unspecified,
  5.6/NS-2,
  5/Chord (SFS),
  8.5/Others
}

### (Poor) State of Experimentation in CS ###

\begin{textblock}{0.6}(0.4,0.31)
  \imgw{}{Collberg_Total.png}
\end{textblock}

* _2015_: **\alert{601 papers}** from ACM conferences and journals analysed
\footcite{Collberg:Repeatability2015}
    - _Obj._:  attempt to locate any source code that backed up the published results;
    _if found, try to build the code_.
    - EM$^\text{no}$ (__146 papers!__): code cannot be provided!
    - Original study: _80% of non reproducible work_


\piechart{0.4}{% total: 601
  32.2/OK,
  24.3/EM$^\text{no}$,
  3.8/OK$^\text{Authors}$,
  33.1/Excluded,
  5/Authors don't answer,
  1.6/Build Fails
}

### And in Other Sciences? ###

\begin{textblock}{0.3}(0.65,0.01)
\piechart{0.4}{
  9.8/Plagiarism,
  21.3/Error,
  43.4/Fraud,
  14.2/Self-Plagiarism,
  11.3/Others
}
\end{textblock}


* _Biology_: Increase in _retracted papers_\footcite{Steen10},
    - **Fraud** (data fabrication or falsification)
    - **Error** (plagiarism, scientific mistake, ethical problems)
         * see also [Reproducibility: A tragedy of errors](http://www.nature.com/news/reproducibility-a-tragedy-of-errors-1.19264)\footcite{Nature_Reproducibility16}
         * cf.[Duke University scandal](http://www.nytimes.com/2011/07/08/health/research/08genes.html) with  scientific misconduct on lung cancer

    - High number of _failing clinical trials_
         * [Do We Really Know What Makes Us Healthy?](http://mescal.imag.fr/membres/arnaud.legrand/teaching/2011/EP_epidemiology.pdf), 2007
         * [Lies, Damned Lies, and Medical Science](http://mescal.imag.fr/membres/arnaud.legrand/teaching/2011/EP_lies.pdf), 2010

* _Psychology_:
    - [unreplicable study](https://en.wikipedia.org/wiki/Daryl_Bem#.22Feeling_the_Future.22_controversy) about extrasensory perception (ESP)

* _Machine Learning_: [Trouble at the lab](http://www.economist.com/news/briefing/21588057-scientists-think-science-self-correcting-alarming-degree-it-not-trouble), The Economist, 2013

\vspace*{-1em}
\tiny

> According to some estimates, three-quarters of published scientific papers in the field \newline of machine learning are bunk because of this "overfitting".
>     _Sandy Pentlan, MIT_


### And in Other Sciences? ###

* _Medicine_: Study shows lower fertility for mices exposed to transgenic maize ([AFSSA report](https://www.anses.fr/en/system/files/BIOT2008sa0361EN.pdf)\footnote{Opinion of the French Food Safety Agency (Afssa) on the study by Velimirov et al.})
    - Several calculation errors have been identified
    - led to a false statistical analysis \& interpretation

. . .

* _Physics_: CERN / OPERA Experiment (2011)
    - [_faster-than-light neutrinos_](https://en.wikipedia.org/wiki/Faster-than-light_neutrino_anomaly)
        * People started gossiping about relativity violation...
    - caused by timing system failure in 2012

. . .

\vspace*{-1em}
\exbegin{}

* \alert{\frownie}: Not everything is perfect
* \smiley: But some errors are properly identified
    - Stronger experimental culture in other (older?) sciences?
    - Long history of costly experiments, scandals, \ldots

\exend

\just{2}{
\begin{textblock}{0.2}(0.77,0.35)
  \imgw{}{Faster-than-light-neutrino-anomaly.png}
\end{textblock}
}


### What About You (as Rewiever) ?
<!-- Courtesy A.Legrand -->

\bbegin{}

> "This may be an interesting contribution but..."

\bend

* This _average value_ must hide something
* As usual, there is no _confidence interval_,
     - I wonder about the variability and whether the difference is _significant_ or not

. . .

* Why is this graph in _logscale_?  How would it looks like otherwise?
* That can't be true, I'm sure they _removed some points_
* The authors decided to show only a subset of the data.
     - I wonder what the rest looks like

. . .

* There is no label/legend/... What is the _meaning of this graph_?
     - If only I could access the generation script

\courtesy{A. Legrand}

### What About You (as Author) ?

\bbegin{}

* I thought I used the \textit{same parameters}...
     - but I'm _getting different results_!

\bend

. . .

* The new student wants to compare with my _last year' method_
* My advisor asked me whether I took care of setting this or this...
      - but _I can't remember_
* The damned fourth reviewer asked for a major revision...
      - he wants me to _change figure 3_ \frownie

. . .

\exbegin{}

* _Which code / data set_ did I use to generate this figure?
* It _worked yesterday_!
* 6 months later: just _why_ did I do that?

\exend

\courtesy{A. Legrand}

### Why is it Hard to Reproduce? \hfill{\tiny (any Scientific Work)}


* _Human error_:
    - Experimenter _bias_ \hfill{}[\textit{crowdsourced research?}](http://www.nature.com/news/crowdsourced-research-many-hands-make-tight-work-1.18508)
    - Programming _errors_ or data manipulation _mistakes_
    - Poorly selected statistical test

* There is just _no real incentive in doing so_:
    - Legal barriers, _copyright_ \hfill{}[\textit{Many ongoing discussions in US}](http://web.stanford.edu/~vcs/talks/SC15-Nov182015-STODDEN.pdf)
    - _Competition_ issue \hfill \textit{researchware, bibliometry, ...}
    - Publication _bias_  \hfill \textit{only the idea matters, not the gory details...}
    - Rewards for _positive/novel results_, not for \textit{consolidating} results

. . .

\wbegin{}

* _Technical difficulty_:
    - ~~Hardware and software evolve too quickly. It's not worth it~~
    - ~~No resources for storing so much data/information~~
    - ~~Lack of easy-to-use tools~~

\wend

\courtesy{A. Legrand}
