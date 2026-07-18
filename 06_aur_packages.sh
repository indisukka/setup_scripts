#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : Install AUR packages
#*******************************************************************************

# Function to install the packages if not already installed
func_install() {
	if pacman -Qi $1 &>/dev/null; then
		tput setaf 2
		echo "The package " $1 "is already installed"
		echo ""
		tput sgr0

	else
		tput setaf 3
		echo "Installing package: "$1
		tput sgr0
		yay -S $1
		echo ""
	fi
}

# List of programs to install
list=(
	appimagelauncher
	megasync-bin
	sfwbar
	slimbookbattery
)

for name in "${list[@]}"; do
	func_install "$name"
done

tput setaf 4
echo ""
echo "Packages have been installed"
echo ""
tput sgr0

# removed packages
# vscode