### Lighweight Constrained Env.:  [Docker](https://www.docker.com/)

\begin{textblock}{0.3}(0.68,0.25)
  \imgw{}{logo_docker.png}
\end{textblock}

\hfill\myurl{http://www.docker.com}

* Open-source engine
* Automates the deployment of any application
    - _lightweight_, _portable_, _self-sufficient_ container
    - will run virtually anywhere
* Tries to achieve deterministic builds by isolating your service
    - build done from a snapshotted OS and running imperative steps on top of it
* _Dependency hell_:
    - Docker works with images that consume minimal disk space
    - all images are _versioned_, _archivable_, and _shareable_\hfill{} [DockerHub](https://hub.docker.com/)
* `Dockerfiles`: resolving imprecise documentation

### VM vs. Containers

\cbegin{0.5\textwidth}

\imgw{}{docker_vm.png}

* _Virtual machines_
    - app + binaries + libraries
    - incl. an entire guest OS

\column{0.5\textwidth}

\imgw{}{docker.png}

* _Container_
    - app + binaries + libraries
    - kernel shared
    - run on __any__ computer

\cend


### Pulling and Running Images

\command{docker pull <name>:<tag>}

* Pull a _public_ image such as ubuntu or centos
     - if a tag is not specified, use "latest".

. . .

\command{docker run -it <name>}

. . .

\command{docker commit <ID> <name>}

. . .

\wbegin{Your Turn!}\centering

\myurl{http://rr-tutorials.readthedocs.io/en/latest/hands-on/docker/}

\wend
