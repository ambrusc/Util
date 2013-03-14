#!/bin/bash

function do_link {
    echo "linking $1 => $2"
    if [[ -L "$1" || -e "$1" ]]
        then
        rm "$1"
    fi
    ln -s "$2" "$1"
}


# SUBLIME

SUBLIME_CONFIG="Preferences.sublime-settings
Package Control.last-run
Package Control.sublime-settings
SublimeLinter.sublime-settings"
SUBLIME_CONFIG_FOLDER="$HOME/.config/sublime-text-2/Packages/User/"

IFS_OLD=$IFS
IFS=$(echo -en "\n\b")
for c in $SUBLIME_CONFIG
do
    do_link "$SUBLIME_CONFIG_FOLDER$c" "$( pwd )/$c"
done
IFS=$IFS_OLD

# HOME CONFIG
do_link "$HOME/.bashrc" "$( pwd )/bashrc"
do_link "$HOME/.hgrc" "$( pwd )/hgrc"

# PYTHON
sudo apt-get -y install python python-setuptools
easy_install pip

# HG
sudo apt-get -y install mercurial
