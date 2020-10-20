# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Required for keybase GPG implementation
export GPG_TTY=$(tty)

# Using bash-scripts/bin
BASH_SCRIPTS_BIN="$HOME/bash-scripts/bin/"
if [ -d "$BASH_SCRIPTS_BIN" ]; then
	PATH="$BASH_SCRIPTS_BIN:$PATH"; export PATH
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Homebrew for Linux
if [ -d "/home/linuxbrew" ]; then
    PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

# Node Support
if [ -f "$HOME/bash-scripts/.bash_node_support" ]; then
	. "$HOME/bash-scripts/.bash_node_support"
fi

# Rust Support
RUST="$HOME/.cargo"
if [ -d "$RUST" ]; then
    export PATH="$RUST/bin:$PATH"
fi
