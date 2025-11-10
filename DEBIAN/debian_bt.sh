#!/bin/bash
# 
# This script installs and enables bluetooth ona fresh installed Debian system. After install, it's advised to reboot.
# Author: pedro andrade - https://github.com/opedromandrade
# updated on: 11.2025
#

sudo apt-get install blueman -y

sudo systemctl enable bluetooth \

sudo systemctl enable --now bluetooth

# Gotta reboot now
echo $'\n'$"*** Wireless all things ***"
exit
