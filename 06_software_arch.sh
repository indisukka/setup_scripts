#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : Install arch repo packages
#*******************************************************************************

# Function to install the packages if not already installed
func_install() {
    if pacman -Qi $1 &> /dev/null; then
        tput setaf 2
        echo "The package " $1 "is already installed"
        echo ""
        tput sgr0

    else
        tput setaf 3
        echo "Installing package: "$1
        tput sgr0
        sudo pacman -S --noconfirm --needed $1
        echo "" 
    fi
}

# List of programs to install
list=(
    alacritty
    firefox
    flameshot
    picom
    tint2
    lxappearance-obconf
    feh
    arandr
    autorandr
    eza
    android-tools
    bat
    bitwarden
    fish
    galculator
    hexchat
    materia-gtk-theme
    mediainfo-gui
    mpv
    ranger
    rofi
    ueberzug
    yt-dlp
    zathura
    zathura-pdf-poppler
    megasync-bin
    qbittorrent
    xarchiver
    unrar
    p7zip
    peek
    libreoffice-fresh
    meld
)

count=0
for name in "${list[@]}" ; do
    count=$[count+1]
    tput setaf 6;
    echo "Installing package nr.  "$count " :: " $name;
    tput sgr0;
    func_install $name
done

tput setaf 4;
echo "************************************************************"
echo "**********     Packages have been installed     ************"
tput sgr0
