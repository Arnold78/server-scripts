#!/bin/bash

# Setup script for git-config on new node
git config --global user.name  arnold78
git config --global user.email arnoldadame78@gmail.com
sudo git config --system core.editor nano

git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'
