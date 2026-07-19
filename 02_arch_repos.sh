#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : Install all needed packages needed for running system
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
	age
	android-tools
	bat
	blueman
	bluez
	bluez-libs
	bluez-utils
	brightnessctl
	chezmoi
	chromium
	code
	copyq
	doas
	downgrade
	eza
	feh
	firefox
	fish
	flameshot
	flatpak
	font-manager
	git
	grim
	gsimplecal
	gthumb
	gtklock
	gvfs-mtp
	kanshi
	kitty
	kvantum-theme-materia
	kvantum-theme-orchis-git
	labwc
	libreoffice-fresh
	lz4
	mako
	materia-gtk-theme
	mediainfo-gui
	meld
	most
	mpv
	nano
	ncspot
	neovim
	network-manager-applet
	noto-fonts
	noto-fonts-cjk
	nwg-look
	p7zip
	papirus-icon-theme
	pavucontrol
	pcmanfm
	pfetch-rs
	picard
	picard
	pipewire
	pipewire-alsa
	pipewire-jack
	pipewire-pulse
	proton-vpn-gtk-app
	qbittorrent
	qt5ct
	qt5-wayland
	qt6ct
	qt6-wayland
	ranger
	reflector
	ripgrep
	ristretto
	rofi
	samba
	sayonara-player
	sddm
	shfmt
	slurp
	starship
	swaybg
	telegram-desktop
	thunar-archive-plugin
	thunar-shares-plugin
	thunar-volman
	tldr
	trash-cli
	ttf-liberation
	ttf-nerd-fonts-symbols
	ttf-nerd-fonts-symbols-common
	ttf-opensans
	unrar
	unzip
	waybar
	wf-recorder
	wireplumber
	wlogout
	wpaperd
	xarchiver
	xdg-desktop-portal-gtk
	xdg-desktop-portal-wlr
	xdg-user-dirs-gtk
	xfce4
	xfce4-battery-plugin
	xfce4-clipman-plugin
	xfce4-notifyd
	xfce4-pulseaudio-plugin
	xfce4-whiskermenu-plugin
	xorg-xwayland
	xz
	yt-dlp
)

for name in "${list[@]}"; do
	func_install "$name"
done

tput setaf 4
echo ""
echo "Packages have been installed"
echo ""
tput sgr0