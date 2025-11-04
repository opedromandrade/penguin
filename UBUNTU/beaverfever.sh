#!/bin/bash
# this is just a simple script I made for Ubuntu 18.04 [minimal install] to get all the bits I need,
# to get shit up & running the fastest, the most effortlessly and complete way possible.
#
# Author:
#   Pedro Andrade - https://github.com/opedromandrade
#
# updated on: 18.09.2018
#
# Let's roll!

# Start by removing stuff
sudo apt purge gstreamer1.0-fluendo-mp3 -y && \
sudo snap remove gnome-characters gnome-calculator gnome-system-monitor && \
sudo apt install gnome-characters gnome-calculator gnome-system-monitor -y

# Let's update stuff
sudo apt update && sudo apt upgrade

# Restricted extras
sudo apt install ubuntu-restricted-extras

# OpenJDK and Git
sudo apt install openjdk-8-jre git

# Aditional formats for compression
sudo apt install unace rar zip unzip p7zip p7zip-full \
p7zip-rar sharutils uudeview arj cabextract

# VLC & Rhythmbox
sudo apt install vlc rhythmbox

# Extra browser [Chromium] & Flash support
sudo apt install chromium-browser pepperflashplugin-nonfree

# FTP support
sudo apt install filezilla -y

# p2p
sudo apt install filezilla transmission-gtk -y

# Firewall
sudo apt install gufw

# Mighty GIMP
sudo apt install gimp gimp-plugin-registry gimp-data-extras

# Darktable
sudo apt install darktable

# Beautify tools
sudo apt install chrome-gnome-shell gedit-plugin-text-size gnome-tweaks

# Clean some more [just for reinsurance]
sudo apt autoremove

# Gotta reboot now:

echo $'\n'$"*** Follow the white rabbit & reboot ***"
exit
