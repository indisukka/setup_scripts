#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : Install arch repo packages
#*******************************************************************************

# Function to install the packages if not already installed
func_install() {
    if pacman -Qi $1 &> /dev/null; then
        tput setaf 2;echo "The package " $1 "is already installed";echo ""
        tput sgr0

    else
        tput setaf 3;echo "Installing package: "$1;tput sgr0
        sudo pacman -S --noconfirm --needed $1;
        echo ""
    fi
}

# List of programs to install
list=(
    alacritty
    android-tools
    arandr
    autorandr
    bat
    bitwarden
    eza
    feh
    firefox
    fish
    flameshot
    flatpak
    font-manager
    gthumb
    gvfs
    hexchat
    htop
    kvantum-theme-materia
    kvantum-theme-orchis-git
    libreoffice-fresh
    lxappearance-obconf-gtk3
    lz4
    materia-gtk-theme
    mediainfo-gui
    megasync-bin
    meld
    mpv
    ncspot
    neovim
    p7zip
    papirus-icon-theme
    pavucontrol
    pcmanfm-gtk3
    peek
    picard
    ranger
    ripgrep
    samba
    starship
    terminus-font
    thunar-archive-plugin
    thunar-shares-plugin
    thunar-volman
    tldr
    ttf-liberation
    ttf-nerd-fonts-symbols
    ttf-nerd-fonts-symbols-common
    unrar
    unzip
    xarchiver
    yt-dlp
    zathura
    zathura-pdf-poppler
)

count=0
for name in "${list[@]}" ; do
    count=$[count+1]
    tput setaf 6;
    echo "Installing package nr.  "$count " :: " $name;
    tput sgr0;
    func_install $name
done

tput setaf 4;echo "";echo "Packages have been installed";tput sgr0