#!/bin/bash
# 
# This script installs Zoom on a Debian system
# Author: pedro andrade - https://github.com/opedromandrade
# updated on: 11.2025
#

sudo apt get-install wget \

wget https://zoom.us/client/latest/zoom_amd64.deb

sudo apt install ./zoom_amd64.deb

# Gotta reboot now
echo $'\n'$"*** Where's everyone? ***"
exit