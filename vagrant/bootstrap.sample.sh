#! /bin/bash
################################################################################
# bootstrap.sh - Illustration of the provisioning of Vagrant box
################################################################################
#
# Upgrade the system
apt-get update --fix-missing
apt-get upgrade

# Hand-on 1: Reproduce the successful build of the tutorial slides
# You probably need to complete the below list
apt-get -yq --no-install-suggests --no-install-recommends --force-yes install \
        git make latex-beamer pandoc biber lmodern latex-make
