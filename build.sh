#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Install Homebrew
cat <<EOT >> ~/.profile
#Linuxbrew
test -d ~/.linuxbrew && eval \$(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval \$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \\\$(\$(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \\\$(\$(brew --prefix)/bin/brew shellenv)" >>~/.profile

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
rpm-ostree install screen

# this would install a package from rpmfusion
rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket
