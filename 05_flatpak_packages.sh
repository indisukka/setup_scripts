#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : Install flatpaks from flathub
#*******************************************************************************

# List of programs to install
list=(
	com.github.tchx84.Flatseal
	io.github.giantpinkrobots.flatsweep
	com.github.zocker_160.SyncThingy
	md.obsidian.Obsidian
	com.notesnook.Notesnook
	org.gnome.baobab
	org.localsend.localsend_app
	org.onlyoffice.desktopeditors
	org.jdownloader.JDownloader
)

# Function to install the packages if not already installed
func_install() {
	if flatpak info $1 &>/dev/null; then
		tput setaf 2
		echo "The package " $1 "is already installed"
		echo ""
		tput sgr0

	else
		tput setaf 3
		echo "Installing package: "$1
		tput sgr0
		flatpak install flathub $1
		echo ""
	fi
}



for name in "${list[@]}"; do
	func_install "$name"
done

tput setaf 4
echo ""
echo "Packages have been installed"
echo ""
tput sgr0

# flatpak apps to checkout
#
# com.ranfdev.DistroShelf
# info.febvre.Komikku
# io.github.diegopvlk.Cine
# be.alexandervanhee.gradia
# com.bilingify.readest
# com.usebruno.Bruno
# xyz.z3ntu.razergenie
# io.github.prateekmedia.appimagepool
# org.nomacs.ImageLounge