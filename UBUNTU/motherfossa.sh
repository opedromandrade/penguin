#!/bin/bash
# 
# Author: Pedro Andrade - https://github.com/opedromandrade
# this is just a simple script for Ubuntu
#
# v02.2021
# updated on: 07.2021
#
# before starting:
#	1. make sure you have the fastest mirror selected, and also the Canonical Partners Repo enabled
#	2. comment lines out to disable stuff you don't want install/remove

### Let's roll!

## Let's update stuff
sudo apt update && sudo apt upgrade -y

# Install Intel proprietary stuff
sudo apt-get install i965-va-driver-shaders intel-media-va-driver-non-free intel-gpu-tools

## Small things
# Open JDK
sudo apt-get install openjdk-11-jre

# Git
sudo apt-get install git 

# Synaptic
sudo apt-get install synaptic

## Some extra zing to Ubuntu
# Restricted extras (includes a bunch of cool stuff, codecs and fonts) - https://help.ubuntu.com/community/RestrictedFormats
sudo apt-get install ubuntu-restricted-extras
#sudo apt-get install kubuntu-restricted-extras
#sudo apt-get install xubuntu-restricted-extras
#sudo apt-get install lubuntu-restricted-extras

## Video players
# Gnome Videos (formerly known as totem) 
sudo apt-get install totem

# VLC
#sudo apt-get install vlc

## Audio files software
# Rhythmbox
#sudo apt-get install rhythmbox

# Quodlibet and exfalso
sudo apt-get install quodlibet exfalso

# EasyTAG
sudo apt-get install easytag

## Book stuff
# Calibre - https://calibre-ebook.com
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Sigil
sudo apt-get install sigil

## Aditional formats for compression
sudo apt-get install unace rar zip unzip p7zip p7zip-full p7zip-rar sharutils uudeview arj cabextract

## Multimedia
## Debian Multimedia
# Get that key
#wget http://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.8.1_all.deb
# Make magic
#sudo dpkg -i deb-multimedia-keyring_2016.8.1_all.deb

## Image editing
# Mighty GIMP
sudo apt-get install gimp gimp-plugin-registry gimp-data-extras

## Photography
# Rapid Photo Downloader - culling them photos
sudo apt-get install rapid-photo-downloader

# Darktable
sudo apt-get install darktable

## Video and Audio creation
# Kdenlive
# add the ppa:
sudo add-apt-repository ppa:kdenlive/kdenlive-stable && sudo apt update
# Intsall the mofo
sudo apt-get install kdenlive
# Remove KDE Connect
sudo apt remove kdeconnect

# Audacity
sudo apt-get install audacity

#Simple Screen Recorder
#sudo apt-get install simplescreenrecorder

## Office tools
# LibreOffice
sudo apt-get install libreoffice-gnome libreoffice
# LibreOffice Portuguese localization et all
sudo apt-get install myspell-pt-pt hyphen-pt-pt libreoffice-l10n-pt mythes-pt-pt libreoffice-help-pt

## Internet Stuff
# Extra browser [Chromium]
sudo apt-get install chromium-browser

# FTP support
#sudo apt-get install filezilla

# p2p
# qBittorrent
sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable && sudo apt-get update && sudo apt-get install qbittorrent

# Remove Transmission
sudo apt-get remove transmission-gtk

# Firewall
sudo apt-get install gufw

# Handy tools
sudo apt-get install net-tools

# VPN stuff
#sudo apt-get install wireguard

## Battery Laptop Tweak
# Install the magic
sudo apt-get install tlp tlp-rdw
# Make it happen
sudo tlp start

# Beautify tools
sudo apt-get install chrome-gnome-shell gedit-plugin-text-size gnome-tweak-tool

# NUMiX
sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle

# Clean some more [just for reinsurance]
sudo apt autoremove && sudo apt autoclean

# Gotta reboot now:

echo $'\n'$"*** Follow the white rabbit & reboot ***"
exit
