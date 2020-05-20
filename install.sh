#!/bin/bash

rm -rdi ~/.bashrc             \
        ~/.bash_aliases       \
        ~/.bash_completion    \
        ~/.bash_completion.d  \
        ~/.profile         

ln -rs ./.bash_aliases        ~/.bash_aliases
ln -rs ./.bashrc              ~/.bashrc
ln -rs ./.bash_completion     ~/.bash_completion
ln -rs ./.profile             ~/.profile
ln -rs ./.bash_completion.d   ~/.bash_completion.d
