#!/bin/bash
#########################################################################################
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : Installing qemu and virt manager
#########################################################################################

# Removing iptables
sudo pacman -Rdd iptables --noconfirm
sudo pacman -S --noconfirm --needed qemu iptables-nft libvirt virt-manager edk2-ovmf

# Enabling libvirt service
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

# Adding user to kvm and libvirt group
echo "User needs to be added to libvirt and kvm group"
read -p "Enter your user id :: " choice

sudo gpasswd -a "$choice" libvirt
sudo gpasswd -a "$choice" kvm

echo "Added user to libvirt and kvm groups"

echo "REBOOT SYSTEM NOW"