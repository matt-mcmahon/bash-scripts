#!/bin/bash

mkdir -p $HOME/profile-backup

cp -u   $HOME/.bash_aliases        $HOME/profile-backup 2> /dev/null
cp -u   $HOME/.bash_completion     $HOME/profile-backup 2> /dev/null
cp -ur  $HOME/.bash_completion.d   $HOME/profile-backup 2> /dev/null
cp -u   $HOME/.bashrc              $HOME/profile-backup 2> /dev/null
cp -u   $HOME/.profile             $HOME/profile-backup 2> /dev/null

ln -frs ./.bash_aliases        $HOME/.bash_aliases
ln -frs ./.bash_completion     $HOME/.bash_completion
ln -frs ./.bash_completion.d   $HOME/.bash_completion.d
ln -frs ./.bashrc              $HOME/.bashrc
ln -frs ./.profile             $HOME/.profile

cp -u   $HOME/.gitconfig           $HOME/profile-backup 2> /dev/null

echo "[include]
    path = $PWD/.gitconfig-global" >> $HOME/.gitconfig
