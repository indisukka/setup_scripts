#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : Install packages from chaotic-aur, assumes repo added
#*******************************************************************************

# Function to install the packages if not already installed
func_install() {
	if pacman -Qi "$1" &>/dev/null; then
		tput setaf 2
		echo "The package " "$1" "is already installed"
		echo "****************************************"
		tput sgr0

	else
		tput setaf 3
		echo "Installing package: ""$1"
		tput sgr0
		sudo pacman -S --noconfirm --needed "$1"
		tput setaf 5
		echo "****************************************"
		tput setaf 0
	fi
}

# List of programs to install
list=(
	downgrade
	kvantum-theme-orchis-git
	papirus-folders
	peazip
	reflector-simple
	sayonara-player
	sublime-text-4
	wlogout
	yay
	zen-browser-bin
)

for name in "${list[@]}"; do
	func_install "$name"
done

tput setaf 4
echo ""
echo "Packages have been installed"
echo ""
tput sgr0
