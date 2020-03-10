### Use a Constrained Environment

\hfill\myurl{http://vagrantup.com/}

\imgw{}{screenshot_vagrant}

### What is [Vagrant](http://vagrantup.com/) ?

\wbegin{}

\centering Create and configure _lightweight_, _reproducible_, and _portable_ development environments

\wend

* _Command line_ tool \hfill{}`vagrant [...]`
* Easy and Automatic per-project VM management
    - Supports many hypervisors: [VirtualBox](https://www.virtualbox.org/), [VMWare](http://www.vmware.com/)...
    - Easy text-based configuration (Ruby syntax) \hfill{}`Vagrantfile`
* Supports _provisioning_ through configuration management tools
    - Shell
	- [Puppet](https://puppet.com/)    \hfill\myurl{https://puppet.com/}
    - [Salt](https://saltstack.com/)...\hfill\myurl{https://saltstack.com/}

\exbegin{}\centering

_Cross-platform_: runs on Linux, Windows, MacOS

\exend


### Installation Notes

\begin{textblock}{0.3}(0.67,0.14)
  \imgw{0.5}{screenshot_vagrant_manager.png}
  \imgw{0.5}{screenshot_vagrant_manager2.png}
\end{textblock}

\myurl{http://rr-tutorials.readthedocs.io/en/latest/setup/}

* _Mac OS X_:
    - best done using [Homebrew](http://brew.sh/) and [Cask](http://sourabhbajaj.com/mac-setup/Homebrew/Cask.html)

~~~bash
$> brew install caskroom/cask/brew-cask
$> brew cask install virtualbox    # install virtualbox
$> brew cask install vagrant
$> brew cask install vagrant-manager # cf http://vagrantmanager.com/
~~~


* _Windows / Linux_:
    - install [Oracle Virtualbox](https://www.virtualbox.org/) and the Extension Pack
    - install [Vagrant](https://www.vagrantup.com/downloads.html)


### Why use Vagrant?

* Create new VMs quickly and easily: only one command!
     - `vagrant up`
* Keep the number of VMs under control
     - All configuration in `VagrantFile`
* _Reproducibility_
     - Identical environment in development and production
* _Portability_
     - _avoid_ sharing 4 GB VM disks images
	 - [Vagrant Cloud](https://vagrantcloud.com/) to share your images
* _Collaboration made easy_:
\begin{cmdline}
\cmdlineentry{git clone ...}\\
\cmdlineentry{vagrant up}\\
\end{cmdline}

### Minimal default setup

\command{vagrant init [-m] <user>/<name>\hfill\textit{\# setup vagrant cloud image}}

* A `Vagrantfile` is configured for box `<user>/<name>`
     - Find existing box: [Vagrant Cloud](https://vagrantcloud.com/) \hfill\myurl{https://vagrantcloud.com/}
     - You can have multiple (named) box within the **same** `Vagrantfile`
           * See [`ULHPC/puppet-sysadmins/Vagrantfile`](https://github.com/ULHPC/puppet-sysadmins/blob/devel/Vagrantfile)

\cbegin{0.52\textwidth}

~~~ruby
Vagrant.configure(2) do |config|
   config.vm.box = '<user>/<name>'
   config.ssh.insert_key = false
end
~~~

\column{0.48\textwidth}\tiny

| Box name                  | Description               |
|---------------------------|---------------------------|
| `ubuntu/trusty64`         | Ubuntu Server 14.04 LTS   |
| `debian/contrib-jessie64` | Vanilla Debian 8 "Jessie" |
| `centos/7`                | CentOS Linux 7 x86_64     |
| `svarrette/RR-tutorials`  | IEEE CloudCom 2016 Tuto   |

\cend





### Pulling and Running a Vagrant Box

\command{vagrant up \hfill\textit{\# boot the box(es) set in the Vagrantfile}}

* Base box is downloaded and stored locally \hfill{}`~/.vagrant.d/boxes/`
* A new VM is created and configured with the base box as template
     - The VM is booted and (eventually) provisioned
     -  Once within the box: `/vagrant` = directory hosting `Vagrantfile`

. . .

\command{vagrant status \hfill\textit{\# State of the vagrant box(es)}}

. . .

\command{vagrant ssh \hfill\textit{\# connect inside it, CTRL-D to exit}}



### Stopping Vagrant Box

\command{vagrant \{ destroy | halt \} \hfill\textit{\# destroy / halt}}

* Once you have finished your work within a \textit{running} box
     - save the state for later with `vagrant halt`
	 - reset changes / tests / errors with `vagrant destroy`
	 - commit changes by generating a new version of the box


### Back to Hands-on 1

\wbegin{Your Turn! \hfill\myurl{http://rr-tutorials.readthedocs.io/en/latest/hands-on/vagrant/}}

* **\alert{Steps [1-4]}** to cover the following elements:
    - _Basic Usage of Vagrant_
    - _Build these Slides_
           * find the prerequisite software environment \hfill{}`apt-get`
           * [un]common mix here: `make`, `latex-beamer`, `biber`, `pandoc`...

\wend

* _Hints_:
     - if a package is missing, find the appropriate one `apt-cache search`
     - [Ubuntu Package Search](http://packages.ubuntu.com/) for a missing `*.sty` \hfill{}\myurl{http://packages.ubuntu.com/}
          * `Search the contents of packages` for Distribution `Trusty`

<!-- - design a provisioning script -->
<!-- - commit / package the updated box (for incremental share) -->

### Vagrant Box \just{2-}{Inline }Provisioning

* Now you have \textit{hopefully} a working _documented procedure_
     - it's time to _bundle it_ for provisioning the box upon boot
     - key for sustainable reproducible environment

* Simple case: **\alert{inline}** provisioning _i.e._ list commands to run

. . .

~~~ruby
config.vm.provision "shell", inline: <<-SHELL
  sudo apt-get update --fix-missing
  sudo apt-get upgrade
  # Complete the below list of missing packages
  apt-get -yq --no-install-suggests --no-install-recommends install \
        git make latex-beamer biber latex-make [...]
SHELL
~~~

. . .

\command{vagrant provision \hfill\textit{\# test your provisioning config}}


###  Vagrant Box Inline Provisioning

\wbegin{Your Turn! \hfill\myurl{http://rr-tutorials.readthedocs.io/en/latest/hands-on/vagrant/}}

* **\alert{Steps 5}**:
    - adapt the `Vagrantfile` to embed your commands
    - recall that relative paths are expanded relative to the location of the root `Vagrantfile`
    - inline command are run as the `vagrant` user, **not** `root`

\wend

* __\alert{IMPORTANT}__:
     - all your commands should run **in a non-interactive** way

~~~bash
apt-get install -y <package>   # Debian / Ubuntu
yum     install -y <package>   # CentOS/ Redhat
~~~

### Vagrant Box Shell Provisioning

* Embed your inline commands in a _Shell/Python/Ruby_ script
     - see sample script `vagrant/bootstrap.sample.sh`

~~~ruby
config.vm.provision "shell", path: "<script>.{sh|py|rb}"
~~~

\wbegin{Your Turn! \hfill\myurl{http://rr-tutorials.readthedocs.io/en/latest/hands-on/vagrant/}}

* **\alert{Steps 6}**: copy and adapt `vagrant/bootstrap.sample.sh`
    - adapt the `Vagrantfile` to provision the VM with your script
    - test a reproducible provisioning from scratch

\wend

~~~bash
$> vagrant destroy && vagrant up && vagrant ssh
$> make -C make -C /vagrant/slides/2016/cloudcom2016/src/
~~~


### Vagrant Box Packaging

* At some moment, you probably want to diffuse your custom box!
     - _Ex_: [`svarrette/RR-tutorials`](https://atlas.hashicorp.com/svarrette/boxes/RR-tutorials) used for this tutorial
     - use [Vagrant Cloud](https://vagrantcloud.com) as a global storage media
     - `VBoxManage list runningvms` to get the real box name

\command{vagrant package ---base <real-box-name> ---output <name>.box}

. . .

\wbegin{}

* __\alert{BEFORE packaging your box}__:
     - Use official [insecure SSH key](https://github.com/mitchellh/vagrant/tree/master/keys) \hfill{}`config.ssh.insert_key=false`
     - _Purge_ the VM to reduce its size \hfill{}see [`vagrant/purge.sh`](https://github.com/Falkor/RR-tutorials/blob/master/vagrant/purge.sh)
          * remove useless [big] packages \hfill{}`aptitude purge [...]`
          * Empty logs/history etc.
          * Zero out the free space \hfill{}`dd if=/dev/zero of=/EMPTY bs=1M`
     -  _Up-to-date_ Virtualbox _Guest additions_ \hfill{}`vagrant vbguest`

\wend

### Detailed Pre-Packaging Steps (1/2)

* Ensure you **DO NOT** reset the default [(insecure) SSH key](https://github.com/mitchellh/vagrant/tree/master/keys)
      - default _expected_ setting to SSH your box
      - **before** `vagrant up`, ensure replacement of SSH keys **is not done**

        ~~~ruby
        config.ssh.insert_key = false   # in Vagrantfile
        ~~~

* _Purge_ the VM, in particular to _Zero out the free space_
    - see [`vagrant/purge.sh`](https://github.com/Falkor/RR-tutorials/blob/master/vagrant/purge.sh)

~~~bash
# Remove APT cache
apt-get clean -y   && apt-get autoclean -y && apt-get autoremove -y
# Remove bash history
unset HISTFILE
rm -f /root/.bash_history && rm -f /home/vagrant/.bash_history
# Zero out free space to aid VM compression
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
~~~

### Detailed Pre-Packaging Steps (2/2)

* Ensure an _Up-to-date Virtualbox Guest additions_
    - ensure optimized usage of the box
    - simplified management with the  [vbguest](https://github.com/dotless-de/vagrant-vbguest) plugin

~~~bash
# Install the 'vbguest' plugin
$> vagrant plugin install vagrant-vbguest
$> vagrant vbguest --status
GuestAdditions versions on your host (5.1.8) and guest (4.3.36)
do not match.
# Upgrade the GuestAdditions
$> vagrant vbguest --do install --auto-reboot [--force]
~~~

* If you want the _manual_ way:
     - copy \texttt{\tiny/Applications/VirtualBox.app/Contents/MacOS/\alert{\textbf{VBoxGuestAdditions.iso}}}
     - mount in **within** the VM
     - execute `VBoxLinuxAdditions.run`

### Vagrant Box Packaging

~~~bash
# Locate the internal name of the running VM and repackage it
$> VBoxManage list runningvms
"RR-tutorials_default_1481463725786_57301" {...}
$> vagrant package \
    --base vagrant-vms_default_1431034026308_70455 \
	--output <os>-<version>-<arch>.box
~~~

. . .

* Now you can upload the generated box on [Vagrant Cloud](http://vagrantcloud.com).
    - select '`New version`', enter the new version number
	- add a new box provider (`Virtualbox`)
    - upload the generated box

. . .

* Upon successful upload:  **release** the uploaded box
    - by default it is unreleased
    - Now people using the `<user>/<name>` box will be notified of a pending update

### Vagrant Box Packaging

\wbegin{Your Turn! \hfill\myurl{http://rr-tutorials.readthedocs.io/en/latest/hands-on/vagrant/}}

* **\alert{Steps 7-8}**: Package your box and diffuse it on [Vagrant Cloud](https://vagrantcloud.com)
    - Make preliminary checks
    - Purge the VM
    - Package it and Upload to [Vagrant Cloud](https://vagrantcloud.com)

\wend

### Vagrant Box Generation

* You might rely on [Falkor/vagrant-vms](https://github.com/Falkor/vagrant-vms)
     - use it at your own risks
	 - based on [packer](http://www.packer.io/) and [veewee](https://github.com/jedi4ever/veewee)

~~~bash
$> git clone https://github.com/Falkor/vagrant-vms.git
$> cd vagrant-vms
$> gem install bundler && bundle install
$> rake setup
~~~

\pause

~~~bash
# initiate a template for a given Operating System:
$> rake packer:{Debian,CentOS,openSUSE,scientificlinux,ubuntu}:init
# Build a Vagrant box
$> rake packer:{Debian,CentOS,openSUSE,scientificlinux,ubuntu}:build
# If things goes fine:
$> vagrant box add packer/<os>-<version>-<arch>/<os>-<version>-<arch>.box
~~~


### Advanced Provisioning: Puppet

\begin{textblock}{0.2}(0.78,0.07)
  \imgw{}{logo_puppet.png}
\end{textblock}

* Shell provisioning is a reasonable good basis but **not sufficient**
    - _hard to be cross-platform_ \hfill{}`apt-get` vs. `yum`
* You quickly something more _consistent_
    - [Puppet](https://puppet.com/)    \hfill\myurl{https://puppet.com/}
    - [Salt](https://saltstack.com/)...\hfill\myurl{https://saltstack.com/}

. . .

\vspace*{-1em}
\bbegin{Puppet: Reproducible/Cross-Platform IT Environment}

* Advanced configuration management and _IT Automation_
    - cross-platform w. Puppet's Resource Abstraction Layer ([RAL](https://docs.puppetlabs.com/puppet/latest/reference/lang_summary.html))
    - Git-based workflow
* Embed environment management in **manifests** and **modules**
    - _nodes manifests_: nodes definitions
    - _modules_: (reusable) set of recipe to configure a given service
         * Large Community Recipes / Modules \hfill{}\myurl{https://forge.puppet.com/}

\bend

### Puppet Operational modes

* _Masterless_ - apply Puppet manifests directly on the target system.
    - No need of a complete client-server infrastructure.
    - Have to distribute manifests and modules to the managed nodes.

\command{puppet apply ---modulepath /modules/ /manifests/file.pp}

. . .

\vspace*{-0.5em}

* _Master / Client_ Setup
    - server (running as `puppet`) listening on 8140 on the Puppet Master
    - client (running as `root`) on each managed node.
        * Run as a service (default), via cron (with random delays), manually or via MCollective
    - Client and Server have to share SSL certificates
        *  certificates must be signed by the Master CA

\command{puppet agent ---test [---noop] [---environment <environment>]}


### Puppet DSL

* A Declarative Domain Specific Language (DSL)
    - defines _STATES_ (and **not** procedures)
* Puppet code is written in _manifests_ \hfill{}`<file>.pp`
    - _declare resources_ that affect elements of the system
        * each resource has a type (`package`, `service`, `file`, `user`, `exec` ...)
        * each resource has a **uniq** title
    - resources are grouped in _classes_
* Classes and configuration files are organized in _modules_
* _Example_ of resources types:

\cbegin{0.33\textwidth}

~~~ruby
file { '/etc/motd':
  content => "Toto"
}
~~~

\column{0.33\textwidth}

~~~ruby
package { 'openssh':
  ensure => present,
}
~~~

\column{0.33\textwidth}

~~~ruby
service { 'httpd':
  ensure => running,
  enable => true,
}
~~~

\cend


### Puppet Classes

* _Containers_ of different resources
    - Can have parameters since Puppet 2.6

~~~ruby
class mysql (
  $root_password = 'default_value',
  $port          = '3306',
) {
  package { 'mysql-server':
    ensure => present,
  }
  service { 'mysql':
    ensure    => running,
  }
  [...]
}
~~~

### Puppet Classes Declaration

* To use a class previously defined, we **declare** it
* "Old style" class declaration, without parameters:

~~~ruby
include mysql
~~~

* "New style" (from Puppet 2.6) with explicit parameters:

~~~ruby
class { 'mysql':
  root_password => 'my_value',
  port          => '3307',
}
~~~

* A class is **uniq** to a given node


### Puppet Defines

* Similar to parametrized classes ...
     - ... but can be used multiple times (with different titles).



~~~ruby
# Definition of a define
define apache::virtualhost (
  $ensure   = present,
  $template = 'apache/virtualhost.conf.erb' ,
  [...] ) {
  file { "ApacheVirtualHost_${name}":
    ensure  => $ensure,
    content => template("${template}"),
  }
}
# Declaration of a define:
apache::virtualhost { 'www.uni.lu':
  template => 'site/apache/www.uni.lu-erb'
}
~~~

### Puppet Variables and Facts

* Can be defined in different places and by different actors:
    - by client nodes as facts
    - defined by users in Puppet code, on Hiera on in the ENC
    - built-in and be provided directly by Puppet
* Facts using `facter`:
    - runs on clients and collects facts that the server can use as variables

\vspace*{-1em}
\cbegin{0.5\textwidth}

~~~bash
$> facter
architecture => x86_64
fqdn => toto.uni.lu
kernel => Linux
memorytotal => 16.00 GB
operatingsystem => Centos
operatingsystemrelease => 6.3
osfamily => RedHat
virtual => physical
[...]
~~~

\column{0.5\textwidth}

* Can be used outside Puppet
* Good tool to _abstract_ your environment
    - permits _reproducible_ and cross-platform developments

\cend




### Puppet User Variables

* In Puppet manifests:

~~~ruby
$role = 'mail'
$package = $::operatingsystem ? {
    /(?i:Ubuntu|Debian|Mint)/ => 'apache2',
    default                   => 'httpd',
}
~~~

* In an External Node Classifier (ENC)
     - Common ENC: Puppet DashBoard, the Foreman, Puppet Enterprise.
* In an Hiera backend

~~~ruby
$syslog_server = hiera(syslog_server)
~~~

### Puppet Nodes

* A **node**/system is identified  by its **certname**
     - defaults to the node's fqdn

\vspace*{-1em}
\cbegin{0.5\textwidth}

~~~ruby
node 'web01' {
  include apache
}
~~~

\column{0.5\textwidth}

~~~ruby
node /^www\d+$/ {
  include apache
}
~~~

\cend

* Nodes classification can be done by External Node Classifier (ENC)
    -  Puppet DashBoard, The Foreman and Puppet Enterprise

* Nodes classification can be done also by Hiera
    - In `/etc/puppet/manifests/site.pp`

    ~~~ruby
    hiera_include('classes')
    ~~~

### Vagrant Puppet Provisionning

* Operate in _masterless_ mode
* Embed your manifests and modules in your repository
      - grab community modules with [`librarian-puppet`](http://librarian-puppet.com/), [`r10K`](https://github.com/puppetlabs/r10k)

~~~ruby
config.vm.provision :puppet  do |puppet|
    puppet.hiera_config_path = 'hieradata/hiera.yaml'
    puppet.working_directory = '/vagrant'
    puppet.manifests_path    = "manifests"
    puppet.module_path       = "modules"
    puppet.manifest_file     = "init.pp"
    puppet.options = [ '-v','--report','--show_diff','--pluginsync' ]
end
~~~

. . .

\vspace*{-1em}
\toyou{\just{3}{\textbf{\alert{... Or not \smiley (no time)}}}}
