#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : Install display manager and desktop
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
    xfce4
    openbox
    lightdm
    lightdm-slick-greeter
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

tput setaf 3;
echo "Enabling lightdm service";
tput sgr0;

sudo systemctl enable lightdm.service

tput setaf 2;
echo "Lightdm service enabled";
tput sgr0;