#!/bin/bash
#*******************************************************************************
# Author            : IndiSukka
# Use               : Script to uninstall unwanted programs from base ArcoD install
#*******************************************************************************

# Function to install the packages if not already installed
func_uninstall() {
    if pacman -Qi "$1" &> /dev/null; then
        tput setaf 2;echo "The package " "$1" "is installed uninstalling"tput sgr0
        sudo pacman -Rns --noconfirm "$1"

    else
        tput setaf 1;echo "Package is not installed: ""$1";echo "";tput sgr0
    fi
}

# List of programs to install
list=(
    adobe-source-han-sans-cn-fonts
    adobe-source-han-sans-jp-fonts
    adobe-source-han-sans-kr-fonts
    arcolinux-alacritty-git
    arcolinux-neofetch-git
    arcolinux-paru-git
    arcolinux-sddm-simplicity-git
    noto-fonts
    urxvt-fullscreen
    urxvt-perls
    urxvt-resize-font-git
    rxvt-unicode
    rxvt-unicode-terminfo
    sardi-icons
    surfn-icons-git
    ttf-hack
    vim
    micro
)

count=0

for name in "${list[@]}" ; do
    count=$((count+1))
    tput setaf 3;echo "Uninstalling package no."$count "::" "$name";tput sgr0;
    func_uninstall "$name"
done

tput setaf 5;echo "";echo "Software has been un-installed";tput sgr0
