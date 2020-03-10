### Easy-to-\{Read | Take | Share\} Docs

* _Reproducible_ research assumes accurate and organized Docs
* You need to _document_ your:
    - _Hypotheses_: keep track of your ideas/line of thoughts
    - _Experiments_: details on how and why an experiment was run
        * including failed or ambiguous attempts.
    - _Initial analysis or interpretation_ of these experiments
        * was the outcome conform to the expectation or not?
        * does it (in)validate the hypothesis?
    * _Organization_: keep track of things to do/ x/test/improve
* _Stucture_:
    - General information about the document
    - _commonly used commands_ and how to set up experiments
    - Experiment results
        * by _date_ (`tags`)
        * by _experiment campaigns_ (`date/time`)

### Documentation Tools / Format

<!--
* _Wikis_ are encouraged to favor collaboration... **YET**
     - often depends on web access, non-`cat` wiki syntax

. . .

\vspace*{-1em}
-->

\exbegin{Recommandation}

* Plain-text with [Markdown](https://daringfireball.net/projects/markdown/syntax) syntax
     - Easy to _track over Git_ (`text` files, **not** Word/RFT etc.)
     - Easy to _export_ to any format using [`pandoc`](http://pandoc.org/) / [`multimarkdown`](http://michaelhyatt.com/multimarkdown.html)
     - _Supports online/offline_ Wikis / Blogging platforms

\exend

* **Focus on writing**, viewers for all platform
     - Mac OS:  [MOU](http://25.io/mou/), [Marked 2](http://marked2app.com/)
	 - Linux:   [Remarkable](https://remarkableapp.github.io/), [Retext](http://sourceforge.net/projects/retext/)
	 - Windows: [MarkdownPad](http://markdownpad.com/), [Remarkable](https://remarkableapp.github.io/)
* Git Based [Markdown](https://daringfireball.net/projects/markdown/syntax) Blogging
     - [Octopress](https://github.com/octopress/octopress), [Jekyll](https://jekyllrb.com/)

### Git-based [Markdown](https://daringfireball.net/projects/markdown/syntax) Wiki

* _Permits to work offline_
     - [Gollum](https://github.com/gollum/gollum/wiki), as embedded in GitLab
          * run `gollum` (from root directory) \hfill\myurl{http://localhost:4567}

\exbegin{Recommandation: MkDocs \hfill\myurl{http://www.mkdocs.org/}}

* Better for **Hierarchical structure** of the docs
     - fully configured by `mkdocs.yml` and files in `docs/`
     - local [interpreted] site: `mkdocs serve` (from root directory)\hfill\myurl{http://localhost:8000}
* compliant with [Read the Docs](https://readthedocs.org/)
     - trigger _automatic doc rebuild_ upon [git] push
     - cf <http://rr-tutorials.readthedocs.io/> \smiley{}

\exend

### Mkdocs Workflow

\command{mkdocs new \hfill\textit{\# initialize 'mkdocs.yml' and docs/ directory}}

. . .

~~~yaml
# mkdocs.yml -- MkDocs configuration, all *.md files relative to docs/
site_name: My Environment Documentation
pages:
- Home: 'index.md'
- Tools:
    - SSH: 'tools/ssh.md'
    - Git: 'tools/git.md'
- Configuration:
    - CA Certificates: 'config/certificates/README.md'
theme: readthedocs
~~~

. . .

\command{mkdocs serve \hfill\textit{\# Run LOCAL  builtin server \myurl{http://localhost:8000}}}

### Hands-On 1: [Markdown](https://daringfireball.net/projects/markdown/syntax)  \& [MkDocs](http://www.mkdocs.org/)

\wbegin{Your Turn! \hfill\myurl{http://rr-tutorials.readthedocs.io/en/latest/hands-on/docs/}}

* **\alert{Easy-to-\{Read | Take | Share\} Docs with MkDocs}**
    - installation of MkDocs \hfill{}\myurl{http://www.mkdocs.org/\#installation}
    - initialization \hfill{}`mkdocs new .`
    - Markdown basis
    - _Local_ serve \hfill{}`mkdocs serve`

\wend
