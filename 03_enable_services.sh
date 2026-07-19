#!/bin/bash
#*******************************************************************************
# Author            : Indi
# Github            : https://github.com/IndiSukka
# Use               : enable systemd services
#*******************************************************************************

# Function to enable a systemd service
enable_service() {
    local service_name="$1"

    tput setaf 3
    echo "Enabling ${service_name} service"
    tput sgr0

    sudo systemctl enable "${service_name}.service"

    tput setaf 2
    echo "${service_name} service enabled"
    tput sgr0
}

# Service to enable
enable_service "sddm"
enable_service "bluetooth"
systemctl reboot