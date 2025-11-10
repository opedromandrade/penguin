#!/bin/bash
# 
# This script installs the tools needed to access your iPhone on a Debian system. Reference article: https://opensource.com/article/21/8/libimobiledevice-iphone-linux
# Author: pedro andrade - https://github.com/opedromandrade
# updated on: 11.2025
#

sudo apt install usbmuxd libimobiledevice-1.0-6 libimobiledevice6 libimobiledevice-utils -y \

# Creates folder on home directory
mkdir ~/iPhone \

# Tells system where to mount iPhone
ifuse ~/iPhone

# All set! Just connect your iPhone and use it
echo $'\n'$"*** All set! ***"
exit