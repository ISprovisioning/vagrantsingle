-*- mode: markdown; mode: visual-line; fill-column: 80 -*-
`README.md`

Copyright (c) 2016 [Sebastien Varrette](mailto:<Sebastien.Varrette@uni.lu>)

        Time-stamp: <Sun 2016-12-11 00:40 svarrette>

------------------------------------------------------------------
# Slides for the Tutorial "Reproducible Research at the Cloud Era"

You will find here the slides used [tutorial "Reproducible Research at the Cloud Era"](https://cloudcom2016.gforge.uni.lu/conf/tutorials.html) given during the [IEEE CloudCom 2016](http://2016.cloudcom.org/) conference.

The layout of this directory is depicted below:

```bash
.
├── Makefile         # 'make'    to compile the sources within src/, 'make release' to release a PDF here
├── tutorial-RR-cloudcom2016.pdf  # the released PDF to avoid compiling the slides in src/
└── src/                # LaTeX Beamer sources of the slides
    ├── Makefile        # 'make' to compile the PDF
    ├── tutorial-RR.tex # Main LaTeX file
    ├── _*.md           # Markdown sources for slides included part
    ├── ...             # sub LaTeX/style/bibtex file
    └── images/               # images directory
        ├── Makefile          # 'make optim' to otimize JPG, PNG and PDF image size
        └── ...
```

## Slides Compilation

The slides sources can be find in `src/` and are based on [LaTeX Beamer](http://ctan.mackichan.com/macros/latex/contrib/beamer/doc/beameruserguide.pdf).
Their compilation relies on the following tools:

- [GNU Make](http://www.gnu.org/software/make/)
- A complete working LaTeX environment (including the `pdflatex` compiler).
- [Pandoc](http://pandoc.org/), a universal document converter. Indeed, since producing LaTeX Beamer slides can be heavily time consuming, one way found to deeply accelerate the production of slides is to get rid of the LaTeX syntax in favor of  [markdown](https://daringfireball.net/projects/markdown/syntax), an easy-to-read, easy-to-write plain text format (files with `.md` extension). In this case, [Pandoc](http://pandoc.org/) is used to convert `.md` files into LaTeX Beamer `.md.tex` ones.

### Pre-requisites installation for compilation

* On Mac OS X: install [MacTeX](https://tug.org/mactex/) and [pandoc](http://pandoc.org/) using [Homebrew](http://brew.sh/) and [Homebrew Cask](https://caskroom.github.io/):

  ```bash
  $> brew cask install mactex
  $> brew install pandoc
  ```

* On Linux, install the following packages using your package installer (`yum` or `apt-get`). _Ex_:

  ```bash
  $> apt-get install make latex-beamer biber texlive-fonts-recommended texlive-latex-extra 	texlive-science latex-make # See also .root/bin/ubuntu-bootstrap.sh
  ```

### Compilation

So to compile the LaTeX sources of the slides, simply run:

```bash
$> cd src/  # better to run 'make' within src/ to avoid confusion with the released PDF
$> make     # produce 'tutorial-RR.pdf'
```

Once you are satisfied with the slides and finished its developments, you can release a PDF of the sources as follows:

```bash
$> make release   # produce optimized 'tutorial-RR.pdf'
```
