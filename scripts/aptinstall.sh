#!/bin/bash

sudo apt update

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install ssh-askpass
install ca-certificates
install curl
install exfat-utils
install file
install git
install htop
install nmap
install openvpn
install tmux
install gnupg-agent
install qemu-guest-agent
install pip3
install smbclient
install nfs-utils
install cifs-utils
# install apt-

# Image processing
# install gimp
# install jpegoptim
# install optipng

# Fun stuff
# install figlet
# install lolcat