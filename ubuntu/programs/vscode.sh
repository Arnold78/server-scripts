#!/bin/bash

# Visual Studio Code
# https://code.visualstudio.com/docs/setup/linux
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code
rm microsoft.gpg
ln -s $(pwd)/../../vscode/vsc_settings.json $HOME/.config/Code/User/settings.json
function install {
  name="${1}"
  code --install-extension ${name} --force
}
install emmanuelbeziat.vscode-great-icons
install HookyQR.beautify
install jolaleye.horizon-theme-vscode
install ms-python.python
install ms-vscode-remote.remote-containers
install ms-vscode.Go
install vscode-icons-team.vscode-icons
install ms-azuretools.vscode-docker
install ritwickdey.LiveServer