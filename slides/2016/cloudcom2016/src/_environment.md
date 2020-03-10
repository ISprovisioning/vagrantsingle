### Environment Management

* RR assumes that you _Master your environment_
* Keep it _clean and automated_ by:
    - Using common building tools \hfill{make, cmake etc.}
    - Using a constrained environment
          * Sandboxed Ruby environment \hfill{}`bundler`, `Gemfile`
          * Sandboxed Python \hfill{}`pip freeze`, [`pyenv`](https://github.com/yyuu/pyenv), [`virtualenv`](https://virtualenv.pypa.io/en/latest/)
          * VMs or Containers \hfill{}[Vagrant](https://www.vagrantup.com), [Docker](https://www.docker.com/)
    - Automate its building through cross-platform recipes
    - Automatically test your recipes for Environment configuration


### Controlled Ruby Environment

* Consider using [RVM](https://rvm.io/), [rbenv](http://rbenv.org/) and more importantly  [Bundler](http://bundler.io/)
     - Bring the flexibility of `Rakefile` (`Makefile` + Ruby)
     - [Bundler](http://bundler.io/): _reproducible_ running environment **across** developpers
     - easy configuration through `Gemfile[.lock]` + `bundle` command
* [RVM](https://rvm.io/):  [sandboxed environment](https://hpc.uni.lu/blog/2014/create-a-sandboxed-python-slash-ruby-environment/) per project (**alternative**: [rbenv](http://rbenv.org/))
     - easy configuration through `.ruby-{version,gemset}` files

\pause

_Typical setup of a freshly cloned project:_

~~~bash
$> gem install bundler # assuming it is not yet available
$> bundle              # clone ruby deps/env as defined in Gemfile*
$> rake -T             # To list the available tasks
~~~

\pause
\vspace*{-1em}
\wbegin{Recommended Gems}\centering\small

`rake`, `bundler`, `falkorlib`

\wend

### Controlled Python Environment

* [`pip`](https://pypi.python.org/pypi/pip): Python package manager
      - "nice" python packages: `mkdocs`...
	  - Windows: install via [Chocolatey](https://chocolatey.org/)

\command{pip install <package> \hfill\textit{\# install <package>}}
\pause
\command{pip install -U pip \hfill\textit{\# upgrade on Linux/Mac OS}}
<!-- \command{python -m pip install -U pip \hfill\textit{\# upgrade on Windows}} -->
\pause

* Dump python environment to a requirements file

\command{pip freeze -l > requirements.txt \hfill\textit{\# as Ruby Gemfiles }}



### Pyenv / VirtualEnv / Autoenv

\cbegin{0.6\textwidth}

* [`pyenv`](https://github.com/yyuu/pyenv): $\simeq$ RVM/rbenv for Python
* [`virtualenv`](https://virtualenv.pypa.io/en/latest/) $\simeq$ RVM Gemset
* (optional) [`autoenv`](https://github.com/kennethreitz/autoenv)
    - Directory-based shell environments
	- easy config through `.env` file. _Ex_:

\column{0.4\textwidth}

\centering\includegraphics[height=0.4\textheight]{pyenv.png}

\cend


~~~bash
# (rootdir)/.env : autoenv configuration file
pyversion=`head .python-version`
pvenv=`head .python-virtualenv`

pyenv virtualenv --force --quiet ${pyversion} ${pvenv}-${pyversion}
# activate it
pyenv activate ${pvenv}-${pyversion}
~~~

### Constrained VM environment

* Let's see how to reproduce a simple yet practical example in a _constrained_ and _reproducible_ VM environment.

\vspace*{-1em}
\wbegin{Challenge 1: Reproduce the Build of these Slides}

* Several **tricky** issues illustrating previous best practices
     - grab the sources                 \hfill{}[`git`](https://git-scm.com/)
     - use of a constrained environment \hfill{}[Vagrant](https://www.vagrantup.com)
     - installing the prerequisite software environment \hfill{}`apt-get`
          * [un]common mix here: `make`, `latex-beamer`, `biber`, `pandoc`...
          * generally the _major challenge_ in reproducing computations...

\wend

. . .

\begin{tcolorbox}\centering\scriptsize
\url{http://rr-tutorials.readthedocs.io/en/latest/hands-on/vagrant/}
\end{tcolorbox}

\scriptsize
\hfill{}**\alert{IF NOT YET DONE:}** \myurl{http://rr-tutorials.readthedocs.io/en/latest/setup/}

### Grab the [Code/Data] Source

\begin{textblock}{0.15}(0.8,0.15)
  \imgw{}{logo_github.png}
\end{textblock}


* You should have now [Git](http://git-scm.com) installed
* Get the `RR-tutorials` repository from [Github](https://github.com/Falkor/RR-tutorials)

~~~bash
$> git clone https://github.com/Falkor/RR-tutorials.git
$> cd RR-tutorials
$> make setup  # OR git submodule init && git submodule update
~~~

* _Notable_ elements within this cloned repository:
    -  the \LaTeX\ slides sources \hfill{}`slides/2016/cloudcom2016/src/`
    - Documentation sources \hfill{}`mkdocs.yml` and `docs/`
    - [Vagrant](https://www.vagrantup.com) configuration for **this** project\hfill{}`Vagrantfile`
    - [Bats](https://github.com/sstephenson/bats) unit tests \hfill{}`tests/`
    - Continuous Integration settings through [Travis-CI](https://travis-ci.org/Falkor/RR-tutorials)\hfill{}`.travis.yml`
