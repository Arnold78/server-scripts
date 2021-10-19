#!/bin/bash

sudo apt update
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    software-properties-common \
    lsb-releases
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# wget --quiet --output-document=- https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo usermod --append --groups docker "$USER"
sudo systemctl enable docker
printf '\nDocker installed successfully\n\n'

printf 'Waiting for Docker to start...\n\n'
sleep 5



# Docker Compose
sudo wget --output-document=/usr/local/bin/docker-compose "https://github.com/docker/compose/releases/download/$(wget --quiet --output-document=- https://api.github.com/repos/docker/compose/releases/latest | grep --perl-regexp --only-matching '"tag_name": "\K.*?(?=")')/run.sh"

sudo chmod +x /usr/local/bin/docker-compose

sudo wget --output-document=/etc/bash_completion.d/docker-compose
"https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/bash/docker-compose"
printf '\nDocker Compose installed successfully\n\n'

# sudo nwgrp docker
docker-compose --version

# ##!/bin/sh
#  sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#  sudo chmod +x /usr/local/bin/docker-compose

##set -o errexit
##set -o nounset

##IFS=$(printf '\n\t')

# Docker
# sudo apt remove --yes docker docker-engine docker.io containerd runc || true
# sudo apt update
# sudo apt --yes --no-install-recommends install apt-transport-https ca-certificates
# wget --quiet --output-document=- https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository --yes "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release --codename --short) stable"
# sudo apt update
# sudo apt --yes --no-install-recommends install docker-ce docker-ce-cli containerd.io