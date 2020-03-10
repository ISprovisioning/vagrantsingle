-*- mode: markdown; mode: visual-line; fill-column: 80 -*-

[![By svarrette](https://img.shields.io/badge/by-svarrette-blue.svg)](https://varrette.gforge.uni.lu) [![Licence](https://img.shields.io/badge/license-GPL--3.0-blue.svg)](http://www.gnu.org/licenses/gpl-3.0.html) [![GitHub issues](https://img.shields.io/github/issues/Falkor/RR-tutorials.svg)](https://github.com/Falkor/RR-tutorials/issues/) [![Documentation Status](https://readthedocs.org/projects/rr-tutorials/badge/?version=latest)](http://rr-tutorials.readthedocs.io/en/latest/?badge=latest) [![Build Status](https://travis-ci.org/Falkor/RR-tutorials.svg?branch=master)](https://travis-ci.org/Falkor/RR-tutorials) [![](https://img.shields.io/badge/webinars-Reproducible_Research-green.svg?style=flat-square)](https://github.com/alegrand/RR_webinars)


       Time-stamp: <Sat 2016-12-10 21:57 svarrette>

         _____                          _            _ _     _        _____                              _
        |  __ \                        | |          (_) |   | |      |  __ \                            | |
        | |__) |___ _ __  _ __ ___   __| |_   _  ___ _| |__ | | ___  | |__) |___ ___  ___  __ _ _ __ ___| |__
        |  _  // _ \ '_ \| '__/ _ \ / _` | | | |/ __| | '_ \| |/ _ \ |  _  // _ \ __|/ _ \/ _` | '__/ __| '_ \
        | | \ \  __/ |_) | | | (_) | (_| | |_| | (__| | |_) | |  __/ | | \ \  __\__ \  __/ (_| | | | (__| | | |
        |_|  \_\___| .__/|_|  \___/ \__,_|\__,_|\___|_|_.__/|_|\___| |_|  \_\___|___/\___|\__,_|_|  \___|_| |_|
                   | |
                   |_|

# Tutorial "Reproducible Research at the Cloud Era"

This repository hosts documents, material and information related to the tutorial "Reproducible Research at the Cloud Era" given during the [IEEE CloudCom 2016](http://2016.cloudcom.org/) conference.

[![](https://github.com/Falkor/RR-tutorials/raw/master/slides/2016/cloudcom2016/cover_slides.png)](https://github.com/Falkor/RR-tutorials/raw/master/slides/2016/cloudcom2016/tutorial-RR.pdf)

## Installation / Repository Setup

This repository is hosted on [Github](https://github.com/Falkor/rr-tutorials).

* To clone this repository, proceed as follows (adapt accordingly):

        $> mkdir -p ~/git/github.com/svarrette
        $> cd ~/git/github.com/svarrette
        $> git clone https://github.com/Falkor/RR-tutorials.git

**`/!\ IMPORTANT`**: Once cloned, initiate your local copy of the repository by running:

    $> cd rr-tutorials
    $> make setup

This will initiate the [Git submodules of this repository](.gitmodules) and setup the [git flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) layout for this repository.

Later on, you can upgrade the [Git submodules](.gitmodules) to the latest version by running:

    $> make upgrade

If upon pulling the repository, you end in a state where another collaborator have upgraded the Git submodules for this repository, you'll end in a dirty state (as reported by modifications within the `.submodules/` directory). In that case, just after the pull, you **have to run** the following to ensure consistency with regards the Git submodules:

    $> make update


## Tutorial Slides and Instructions

The latest version of the tutorial is available online:

<http://RR-tutorials.readthedocs.io>

As for the slides used during the "Reproducible Research at the Cloud Era" tutorial given during the [IEEE CloudCom 2016](http://2016.cloudcom.org/) conference., you will find them in `slides/2016/cloudcom2016`

* These slides are based on [LaTeX Beamer](http://ctan.mackichan.com/macros/latex/contrib/beamer/doc/beameruserguide.pdf)
* LaTeX Sources are located in `slides/2016/cloudcom2016/src`
* LaTeX Sources compilation relies on the following tools:
     - [GNU Make](http://www.gnu.org/software/make/)
     - A complete working LaTeX environment (including the `pdflatex` compiler).

       ~~~bash
       $> brew cask install mactex   # Mac OS with HomeBrew -- see brew.sh
       $> apt-get install latex-beamer texlive-latex-extra   # Debian/Ubuntu
       ~~~

     - [Pandoc](http://pandoc.org/), a universal document converter. Indeed, since producing LaTeX Beamer slides can be heavily time consuming, one way found to deeply accelerate the production of slides is to get rid of the LaTeX syntax in favor of  [markdown](https://daringfireball.net/projects/markdown/syntax), an easy-to-read, easy-to-write plain text format (files with `.md` extension). In this case, [Pandoc](http://pandoc.org/) is used to convert `.md` files into LaTeX Beamer `.md.tex` ones.





## Issues / Feature request

You can submit bug / issues / feature request using the [`svarrette/rr-tutorials` Project Tracker](https://github.com/Falkor/rr-tutorials/issues)

## Licence

This project is released under the terms of the [GPL-3.0](LICENCE) licence.

[![Licence](https://www.gnu.org/graphics/gplv3-88x31.png)](http://www.gnu.org/licenses/gpl-3.0.html)

## Contributing

That's quite simple:

1. [Fork](https://help.github.com/articles/fork-a-repo/) it
2. Create your own feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new [Pull Request](https://help.github.com/articles/using-pull-requests/)

## Resources / Links

Your __primary__ source of information if you are interested to know more about _Reproducible Research_ is the excellent [__Series of Webinars on Reproducible Research__](https://github.com/alegrand/RR_webinars) organized by [Arnaud Legrand](http://mescal.imag.fr/membres/arnaud.legrand/) and his colleagues from CNRS, Inria, University of Grenoble, ENS etc.:

[![](https://img.shields.io/badge/webinars-Reproducible_Research-green.svg?style=flat-square)](https://github.com/alegrand/RR_webinars)


Actually, part of the material proposed on this repository comes from this source, and I would like to thank again Arnaud for allowing me to do it.

Other resources you might be interested to check:

* [Reproducible Builds](https://reproducible-builds.org)
* [Figshare: simplifying your research workflow](https://figshare.com/)
* [Validation: the Science Exchange Network](http://validation.scienceexchange.com/)
