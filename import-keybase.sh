#!/bin/bash

if [ -z ${GPG_TTY+x} ]; then
    echo '# Required for keybase GPG implementation'
    echo 'export GPG_TTY=$(tty)' >> ~/.bashrc
    GPG_TTY=$(tty)
else
    echo "GPG_TTY is $GPG_TTY"
fi

# Import the public key
keybase.exe pgp export | gpg --import

# Import the private key
keybase.exe pgp export -s | gpg --allow-secret-key-import --import
