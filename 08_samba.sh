#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : Install samba software
#*******************************************************************************

sudo pacman -S samba gvfs-smb

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