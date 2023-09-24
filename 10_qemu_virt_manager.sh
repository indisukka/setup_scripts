#!/bin/bash
#########################################################################################
# Author            : Indi
# Copied from       : Erik Dubois (https://www.erikdubois.be)
# Github            : https://github.com/IndiSukka
# Use               : Installing qemu and virt manager
#########################################################################################

# Removing iptables
sudo pacman -Rdd iptables --noconfirm
sudo pacman -S --noconfirm --needed qemu iptables-nft libvirt  bridge-utils virt-viewer spice-vdagent virt-manager xf86-video-qxl vde2 dnsmasq dmidecode
sudo pacman -S --noconfirm --needed  ebtables 

# Enabling libvirt service
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

# Adding user to kvm and libvirt group
echo "User needs to be added to libvirt and kvm group"
read -p "Enter your user id :: " choice

sudo gpasswd -a $choice libvirt
sudo gpasswd -a $choice kvm

echo "added user to libvirt and kvm groups"

echo "Reboot System Now"