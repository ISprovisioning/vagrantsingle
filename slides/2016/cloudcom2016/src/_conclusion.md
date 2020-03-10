
### The Research Pipeline

\transientimg{1}{width=\linewidth}{images/author_reader_rr/author_reader_rr_analysis.fig}


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



### Sharing Code and Data

\bbegin{}

* Is this enough?
     1. Use a work ow that _documents both data and process_
     2. Use the machine readable _CSV format_
     3. Provide _raw_ data and _meta_ data, not just statistical outputs
     4. _Never_ do data manipulation and statistical tests _by hand_
     5. Use R, Python or another free software to read and process raw data
          - ideally to produce complete reports with code, results and prose

\bend
