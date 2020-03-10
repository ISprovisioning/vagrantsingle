
### Tutorial Pre-Requisites / Setup

\exbegin{}\centering

\myurl{http://RR-tutorials.readthedocs.io/en/latest/setup/}

\exend

* Create (if need) accounts for the **cloud services** we will use:
    -  [Github](https://github.com/), [Vagrant Cloud](https://vagrantcloud.com/) and [Docker Hub](https://hub.docker.com/)
* Install _mandatory software_, \textit{i.e.} (apart from [Git](https://git-scm.com/)):
    - [Virtual Box](https://www.virtualbox.org/) \hfill\myurl{https://www.virtualbox.org/}
    - [Vagrant](https://www.vagrantup.com)       \hfill\myurl{https://www.vagrantup.com}
    - [Docker](https://www.docker.com/)          \hfill\myurl{https://www.docker.com/}
* Check installed software and download the boxes we will use:

~~~bash
$> git clone https://github.com/Falkor/RR-tutorials.git
$> cd RR-tutorials
$> make setup
$> vagrant up &&  docker pull ubuntu:14.04  # might take some time...
~~~
