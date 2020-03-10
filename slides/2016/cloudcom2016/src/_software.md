
### Software/Modules Management { .t }

* _Software Management Challenge_
    - Not so much standardization
         * every machine/app has a different software stack / installation procedure
         * Sites share unique hardware  among teams with very different requirements
         * _You_ want    to  experiment  with    many    exotic  architectures

* Software Flavor vs. Dependency nightmare vs Performance
    - _Ex_: 3 compilers + 3 MPI + $n$ software
    - Complex set of CLI options,
    - One of the main limits for RR

* Some  Tools can help you!
    - [Easybuild](http://easybuild.readthedocs.io/) \hfill\myurl{http://easybuild.readthedocs.io/}
    - [Spack](http://spack.readthedocs.io/) \hfill\myurl{http://spack.readthedocs.io/}
    - [CDE](http://www.pgbovine.net/cde.html)
    - [Kameleon](http://kameleon.imag.fr/) \hfill\myurl{http://kameleon.imag.fr/}

### EasyBuild \hfill\myurl{http://easybuild.readthedocs.io/}


* [Easybuild](http://hpcugent.github.io/easybuild/): open-source framework to \newline
    (automatically) build scientific software
* _Why?_: \textit{"Could you please install this software on the cluster?"}
    - Scientific software are often **painful** to build
        * non-standard build tools / incomplete build procedure
        * hardcoded parameters and/or poor/outdated documentation
     - EasyBuild helps to facilitate this task
        * consistent software build and installation framework
        * automatically generates LMod modulefiles

### EasyBuild Installation \hfill\myurl{http://easybuild.readthedocs.io/}

~~~bash
# pick an installation prefix to install EasyBuild to
export EASYBUILD_PREFIX=$HOME/.local/easybuild
# download script
curl -O goo.gl/RK3Gpf   # Get bootstrap_eb.py
# bootstrap EasyBuild
python bootstrap_eb.py $EASYBUILD_PREFIX
# update $MODULEPATH, and load the EasyBuild module
module use $EASYBUILD_PREFIX/modules/all
module load EasyBuild
~~~

### EasyBuild Usage \hfill\myurl{http://easybuild.readthedocs.io/}

~~~bash
# Load EasyBuild module
module load EasyBuild
# Check version
eb --version
# Look for HPL
eb -S HPL
# Check what needs to be built to compile HPL 2.1 with Intel compiler
HPL-2.1-intel-2016b.eb
# Check what needs to be built to compile HPL 2.1 with GCC/OpenMPI/...
eb HPL-2.1-foss-2016b.eb -Dr
# Build HPL and its dependencies
eb HPL-2.1-foss-2016b.eb -r
# See available HPL now
module avail HPL
# Amending an existing easyconfig
eb HPL-2.1-foss-2016b.eb --try-software-version=2.2
~~~

### Kameleon: Reproducible SW \footcite{ruizsanabria:hal-01064825}

* Uses \textsl{recipes} (high-level description)
    - Similar to cfengine, Puppet, Chef in the sysadmin world
* Persistent cache to allow re-generation without external resources
    - Linux distribution mirror $\leadsto$ self-contained archive
    - Supports LXC, Docker, VirtualBox, qemu, Kadeploy images, etc.

\centering\imgw{0.4}{cruiz-phd-39}

\courtesy{L. Nussbaum}
