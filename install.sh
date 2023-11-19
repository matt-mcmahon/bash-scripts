#!/bin/bash

mkdir -p ~/profile-backup

cp -u   ~/.bash_aliases        ~/profile-backup 2> /dev/null
cp -u   ~/.bash_completion     ~/profile-backup 2> /dev/null
cp -ur  ~/.bash_completion.d   ~/profile-backup 2> /dev/null
cp -u   ~/.bashrc              ~/profile-backup 2> /dev/null
cp -u   ~/.profile             ~/profile-backup 2> /dev/null

ln -frs ./.bash_aliases        ~/.bash_aliases
ln -frs ./.bash_completion     ~/.bash_completion
ln -frs ./.bash_completion.d   ~/.bash_completion.d
ln -frs ./.bashrc              ~/.bashrc
ln -frs ./.profile             ~/.profile

cp -u   ~/.gitconfig           ~/profile-backup 2> /dev/null

echo "[include]
    path = $PWD/.gitconfig-global" >> ~/.gitconfig