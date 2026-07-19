#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/indisukka
# Use               : Create required folder and restore backup from chezmoi
# Note: used gemini to clean this script
#*******************************************************************************

# Exit immediately if a command exits with a non-zero status
set -e

GITHUB_USERNAME="indisukka"

# Cache terminal colors to avoid calling tput repeatedly in loops
if [ -t 1 ]; then
    GREEN=$(tput setaf 2)
    RESET=$(tput sgr0)
else
    GREEN=""
    RESET=""
fi

log_success() {
    echo "${GREEN}$1${RESET}"
}

# --- Base Home Directories ---
log_success "Creating standard home directories..."

mkdir -p "$HOME"/Desktop \
         "$HOME"/Downloads/to-sort \
         "$HOME"/Templates \
         "$HOME"/Public \
         "$HOME"/Documents \
         "$HOME"/Music \
         "$HOME"/Pictures \
         "$HOME"/Videos

# --- Custom Additional Folders ---
log_success "Setting up additional media and sync folders..."

# Array of relative paths to create under $HOME
SUB_DIRS=(
    "media/anime"
    "media/courses"
    "media/manga"
    "media/movies-tv"
    "media/audiobooks"
    "syncthing"
    "scripting-related/music-files/to-tag"
    "scripting-related/music-files/to-convert"
    ".local/share/projects"
)

# Prefix each element with $HOME/ and create them all in a single batch command
mkdir -p "${SUB_DIRS[@]/#/$HOME/}"
log_success "All directories created successfully!"

# --- External Tools (Optional) ---
log_success "Setting up chezmoi..."
chezmoi init --apply "$GITHUB_USERNAME"