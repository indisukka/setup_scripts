#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : Install geenral packages, non crtical
#*******************************************************************************

# Function to install the packages if not already installed
func_install() {
    if pacman -Qi "$1" &> /dev/null; then
        tput setaf 2;echo "The package " "$1" "is already installed";echo ""
        tput sgr0

    else
        tput setaf 3;echo "Installing package: ""$1";tput sgr0
        sudo pacman -S --noconfirm --needed "$1";
        echo ""
    fi
}

# List of programs to install
list=(
    android-tools
    autorandr
    bat
    bitwarden
    doas
    eza
    feh
    fish
    flameshot
    flatpak
    font-manager
    gthumb
    hexchat
    kanshi
    kvantum-theme-materia
    kvantum-theme-orchis-git
    libreoffice-fresh
    mako
    materia-gtk-theme
    mediainfo-gui
    megasync-bin
    meld
    mpv
    ncspot
    papirus-icon-theme
    picard
    ranger
    ripgrep
    rofi
    samba
    starship
    telegram-desktop
    terminus-font
    thunar-archive-plugin
    thunar-shares-plugin
    thunar-volman
    trash-cli
    tldr
    ttf-liberation
    ttf-nerd-fonts-symbols
    ttf-nerd-fonts-symbols-common
    wpaperd
    xarchiver
    xfce4-battery-plugin
    xfce4-clipman-plugin
    xfce4-notifyd
    xfce4-pulseaudio-plugin
    xfce4-wavelan-plugin
    xfce4-whiskermenu-plugin
    yt-dlp

)

count=0
for name in "${list[@]}" ; do
    count=$((count+1))
    tput setaf 6;
    echo "Installing package no. $count :: " "$name";
    tput sgr0;
    func_install "$name"
done

tput setaf 4;echo "";echo "Packages have been installed";tput sgr0