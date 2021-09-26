#!/bin/bash
# SETUP NEW REPO FROM CLI

echo "# desktop-tutorial" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M master
git remote add origin https://github.com/Arnold78/desktop-tutorial.git
git push -u origin master