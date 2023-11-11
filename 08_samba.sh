#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : Install samba software
#*******************************************************************************

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
    samba
    gvfs-smb
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

tput setaf 5;
echo "";echo "Give your username for samba";echo "";tput sgr0

read -p "What is your username? It will be used to add this user to smb: " choice
sudo smbpasswd -a $choice

tput setaf 6;echo "Enabling services";tput sgr0

sudo systemctl enable smb.service
# no need of nmvb for now
# sudo systemctl enable nmb.service

tput setaf 4;
echo "";
echo "User added and services are enabled";
echo "";
tput sgr0;