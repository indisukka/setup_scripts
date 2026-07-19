#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/indisukka
# Use               : Create required folder and restore backup from chezmoi
#*******************************************************************************
GITHUB_USERNAME="indisukka"
func_echo() {
    tput setaf 2
    echo "$1"
    tput sgr0
}

func_echo "Creating the directories in home folder"

mkdir -p $HOME/Desktop $HOME/Downloads $HOME/Templates $HOME/Public $HOME/Documents $HOME/Music $HOME/Pictures $HOME/Videos

func_echo "Setting up chezmoi"
chezmoi init --apply $GITHUB_USERNAME