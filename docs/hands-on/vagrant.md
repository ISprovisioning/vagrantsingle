
# Objective: Reproduce Slides Building in Vagrant

The objective of this first exercise is to familiarize you with [Vagrant](https://www.vagrantup.com) and see how it can be used to bundle an environment out of a recipe.

In this context, we will:

1. grab the sources of the slides
2. try to _reproduce_ an environment that permits to **build the slides** used for this tutorial **within a Vagrant Box**, knowing that this relies on a _complex set of software_: [LaTeX](https://www.latex-project.org/), [Beamer](http://www.ctan.org/pkg/beamer), [Biber](http://biblatex-biber.sourceforge.net/), [Pandoc](http://pandoc.org/) etc.)
2. create a _recipe_ that would be used to _provision_ an empty box automatically
3. commit and repackage the modified box for further sharing on [Vagrant Cloud](https://vagrantcloud.com/)

## Step 0: Pre-requisites

You **should** have finalized the setup steps before going further -- see [setup instructions](/setup/).

## Step 1: Grab the sources

Clone the [tutorial repository](https://github.com/Falkor/RR-tutorials) from a Terminal (Powershell as `administrator` under windows  to ensure the proper symbolic links managements within Vagrant upon deployment):

~~~bash
$> git clone https://github.com/Falkor/RR-tutorials.git
$> cd RR-tutorials
$> make setup    # Under Mac OS / Linux
~~~

The `make setup` step permits to grab the [Git submodules of this repository](https://git-scm.com/book/en/v2/Git-Tools-Submodules). If for some reason, you cannot run this step on your system, initiate the git submodules as follow:

~~~bash
$> git submodule init
$> git submodule update
~~~

## Step 2: Pulling and running an existing Vagrant box

In this case, you should have a `Vagrantfile` at the root of the cloned repository.
Take a look at it

~~~bash
$> cat Vagrantfile
~~~

To run (and pull eventually the latest version of) the configured Vagrant box from [Vagrant Cloud](http://vagrantcloud.com)

~~~bash
$> vagrant up
~~~

When you run this command:

* The base box(es) (configured in the `Vagrantfile`) is downloaded and stored locally in `~/.vagrant.d/boxes/`
* A new Virtual Machine VM is created and configured with the base box as template
* The VM is booted and (eventually) provisioned to install every dependency that your project needs, and to set up any networking or synced folders, so you can continue working from the comfort of your own machine.

After running the above command, you will have a fully running VM in VirtualBox running Ubuntu  14.04 LTS (Trusty Tahr) 64-bit.
You can now SSH into this machine with:

~~~bash
$> vagrant ssh
~~~

This command will drop you into a full-fledged SSH session. Go ahead and interact with the machine as follows:

~~~bash
(vagrant)$> whoami                       # current user (should be 'vagrant')
(vagrant)$> lsb_release -a               # current OS details
(vagrant)$> ls -l /vagrant/              # what do you notice?
(vagrant)$> figlet                       # should fail
The program 'figlet' can be found in the following packages:
(vagrant)$> sudo apt-get install figlet  # install a missing package package
(vagrant)$> figlet 'I like this Tutorial'
~~~

`/!\ IMPORTANT:` Although it may be tempting, be careful about `rm -rf /`, since Vagrant shares a directory `/vagrant/` with the directory on the host containing your `Vagrantfile`, and this can delete all those files.

The SSH session can be terminated (as usual) with `CTRL+D` or the `logout` command.

~~~bash
(vagrant)$> logout
Connection to 127.0.0.1 closed.
~~~

Now that you're back on your machine, check the status of the box:

~~~bash
$> vagrant status
Current machine states:

default                   running (virtualbox)
~~~

No perform a __graceful__ shutdown of the running Vagrant bax  and check back the status

~~~bash
$> vagrant halt
$> vagrant status
~~~

At this level, we have made some changes to the initial box (_i.e._ installing the `figlet` package).
We can check that they are still effective and recall the last run command (with `up arrow`):

~~~bash
$> vagrant up
$> vagrant ssh
# Now press the 'up' arrow to get the last run command, or 'CTRL-R' to search for a pattern ('fig' for instance)
(vagrant)$> figlet I like this Tutorial
(vagrant)$> logout
~~~

Now imagine that in your (reproducible) attempts, you messed up the VM, you can terminate it with

~~~bash
$> vagrant destroy
~~~

This command stops the running machine Vagrant is managing and destroys all resources that were created during the machine creation process. After running this command, your computer should be left at a clean state, as if you never created the guest machine in the first place.

Check that the last changes we performed (_i.e._ installing the `figlet` package) do not exist anymore:

~~~bash
$> vagrant up
$> vagrant ssh
(vagrant)$> figlet
The program 'figlet' can be found in the following packages:
...
~~~

So you can always rollback to a stable configuration by destroying (with `vagrant destroy`) a messed up VM.


## Step 3: A first attempt to reproduce the slides

So let's configure the Vagrant box to make it able to compile the slides used in this tutorial!

Make a first try -- it __should fail__:

~~~bash
$> vagrant up
$> vagrant ssh
(vagrant)$> cd /vagrant/slides/2016/cloudcom2016/src
(vagrant)$> make
~~~

So you will need to install the prerequisite software environment necessary to build these slides

## Step 4: Install the missing software to build the slides

It's time to face the reality of reproducibility: install the **missing packages** to permit a successful building of these slides.

* __Hint 1__ ask the author _i.e._ me how he did it -- _That might help.... or not_

> "I use LaTeX Beamer with Pandoc"

* __Hint 2__: find a `README.md` with some info

If you miss a file or configuration file (for instance a LaTeX style `*.sty`), check the missing ones on <http://packages.ubuntu.com/> (in `Search the contents of packages` for Distribution 'Trusty')

## Step 5: Simple [Inline] Provisioning

Now you have a working  _procedure_ to setup an **environment able to build the slides**, it's time to _bundle it_ for provisioning the box upon boot.

We will start with the default **inline** shell provisioning where you just list the commands to run.

Adapt the `Vagrantfile` and the below configuration to test your procedure:

~~~ruby
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # [...]
  # TODO: Complete the below list ;)
  config.vm.provision "shell", inline: <<-SHELL
    sudo apt-get update --fix-missing
    sudo apt-get upgrade
    sudo apt-get -yq --no-install-suggests --no-install-recommends --force-yes install \
         git make latex-beamer biber lmodern latex-make [...]
  SHELL
end
~~~

Test _in live_ your provisioning configuration by running:

~~~bash
$> vagrant provision
~~~

Once you have tested your inline provisioning and you consider it complete, test it from scratch on the default (untouched) VM to ensure a **reproducible** execution for your colleagues:

~~~bash
$> vagrant destroy
$> vagrant up
$> vagrant ssh
(vagrant)$> make -C make -C /vagrant/slides/2016/cloudcom2016/src/
~~~

## Step 6: Simple [Shell] Provisioning

While an **inline** provisioning is fine for the most simple cases, you might want to perform some advanced bootstrapping procedure by embedding your command in a dedicated script using your favorite scripting language (`bash`, `python`, `ruby`, `perl`...)

Prepare a script to install the missing packages (_i.e._ the instructions you previously placed in the **inline** form) in a separate script `vagrant/bootstrap.sh`. A sample one is proposed in `vagrant/bootstrap.sample.sh`

~~~bash
$> cp vagrant/bootstrap.sample.sh vagrant/bootstrap.sh
~~~

Adapt the `Vagrantfile` and the below configuration to test your bootstrapping script:

~~~ruby
VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # [...]
  config.vm.provision "shell", path: "vagrant/bootstrap.sh"
end
~~~

Test _in live_ your provisioning configuration by running `vagrant provision`

Once you have tested your provisioning script, test it from scratch on the default (untouched) VM to ensure a **reproducible** execution for your colleagues.

~~~bash
$> vagrant destroy
$> vagrant up
$> vagrant ssh
(vagrant)$> make -C make -C /vagrant/slides/2016/cloudcom2016/src/
~~~

## Step 7: Package a new box

At some moment, you probably wants to broadcast a custom box (reflecting the **precise** environment used for your project run at the time of writing etc.).

Before actually packaging the VM, you need to perform some cleanup

* List the _biggest_ packages installed and  consider removing the useless ones (for instance all the LaTeX  `*-doc` ones)

~~~bash
(vagrant)$> dpkg-query -Wf '${Installed-Size}\t${Package}\n' | sort -n
(vagrant)$> aptitude purge <package>
~~~

* Make you final customization: Update `/etc/motd` to embed your name and adapt the information

~~~bash
(vagrant)$> vim /etc/motd    # :wq to write and quit... OR use nano
~~~

* Ensure your environment is still working: try to compile your slides

~~~bash
(vagrant)$> make -C make -C /vagrant/slides/2016/cloudcom2016/src/
~~~

* Check the proposed purge script (`vagrant/purge.sh`) and execute it

~~~bash
(vagrant)$> cd
(vagrant)$> cat vagrant/purge.sh
(vagrant)$> sudo bash  vagrant/purge.sh    # that takes some time
~~~

* Install the [vbguest](https://github.com/dotless-de/vagrant-vbguest) plugin for vagrant to ensure an **Up-to-date Virtualbox Guest additions**

~~~bash
$> vagrant plugin install vagrant-vbguest
$> vagrant vbguest --status
GuestAdditions versions on your host (5.1.8) and guest (4.3.36) do not match.
# Upgrade the GuestAdditions
$> vagrant vbguest --do install --auto-reboot
~~~

Now you are ready to package your VM!

* Locate the internal name (probably something like `RR-tutorials_default_<id>`) of the running VM :

~~~bash
$> VBoxManage list runningvms
"RR-tutorials_default_<id>" {...}
~~~

* ... and make out a new box!

~~~bash
$> vagrant package \
   --base RR-tutorials_default_<id> --output <os>-<version>-<arch>.box
~~~

## Step 8: Upload your box on [Vagrant Cloud](http://vagrantcloud.com)


* Now you can upload the generated box `<os>-<version>-<arch>.box` on [Vagrant Cloud](http://vagrantcloud.com)
    - login and go on <https://atlas.hashicorp.com/vagrant>
    - select **'New Box'**
        * Enter the appropriate name `RR-tutorials`
        * Fill the description: `Official Ubuntu Server 14.04 LTS for the Reproducible Research Tutorial of IEEE CloudCom 2016`
    - select **'New version**
        * Enter the [new] version number: `0.1`
    - select **'New Box Provider'**
        * Provider: `Virtualbox`
        * `Upload` the generated box
        * Select `Finish`
     - Upon successful upload:  **release** the uploaded box
        * by default it is unreleased

Now people can use the `<yourlogin>/RR-tutorial` box to collect **your** box.

Check it in another empty project

~~~bash
$> mkdir /tmp/myRR-project
$> cd /tmp/myRR-project
$> vagrant init <login>/RR-tutorials    # Adapt <login> to your login
$> vagrant up
~~~

The good point is that if you release a new version of your environment, your collaborators will be automatically notified (the next time they perform a `vagrant up`) of a pending update
