VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  #config.vm.box      = 'ubuntu/trusty64'
  config.vm.box      = 'svarrette/RR-tutorials'
  config.vm.hostname = 'vagrant.RR-tutorial'
  config.vm.post_up_message = "Thanks for following the Reproducible Research Tutorial!\nMore instructions: http://rr-tutorials.rtfd.io/"
  config.ssh.insert_key = false
  # MOTD
  config.vm.provision "shell", inline: "touch /etc/motd && chown vagrant: /etc/motd"
  config.vm.provision "file",  source: "vagrant/motd", destination: "/etc/motd"
  # Purge VM utility
  config.vm.provision "file",  source: "vagrant/purge.sh", destination: "utilities/purge.sh"

  # See http://rr-tutorials.rtfd.io -- Hands-on 1
  # TODO Step 5: Complete the below list ;)
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update --fix-missing
  #   sudo apt-get upgrade
  #   sudo apt-get -yq --no-install-suggests --no-install-recommends --force-yes install \
  #        git make latex-beamer biber lmodern latex-make
  # SHELL

  # TODO Step 6:
  #config.vm.provision "shell", path: "vagrant/bootstrap.sh"
end
