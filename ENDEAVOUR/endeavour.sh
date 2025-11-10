#!/bin/bash
# 
# Author: Pedro Andrade - https://github.com/opedromandrade
# this is just a simple post-install script for EndeavourOS
#
# v01.2022
# updated on: 15/01/2022
#
# before starting:
#	1. make sure you have the fastest mirror selected, and also the Canonical Partners Repo enabled
#	2. comment lines out to disable stuff you don't want install/remove

### Let's roll!

## Let's update stuff
sudo pacman -Syyu

## Update mirrors and stuff
yay -Syu

## Install BlueTooth
sudo pacman -S blueberry

## Small things
# OpenJDK
sudo pacman -S jdk-openjdk

# Git
sudo pacman -S git

## Aditional formats for compression
sudo pacman -S sharutils uudeview arj cabextract unace unrar zip unzip p7zip

## Video players
# MPV - https://mpv.io
#yay -S mpv-build-git

# VLC
#sudo pacman -S vlc

## Audio players
# Rhythmbox
#sudo pacman -S install rhythmbox

# Quodlibet and exfalso
sudo pacman -S quodlibet

# EasyTAG
sudo pacman -S easytag

## Book stuff
# Calibre - https://calibre-ebook.com
sudo pacman -S calibre

# Sigil - http://sigil-ebook.comd
sudo pacman -S sigil

## Multimedia
## Image editing
# Mighty GIMP
sudo pacman -S gimp

## Photography
# Rapid Photo Downloader - culling them photos
sudo pacman -S rapid-photo-downloader

# Darktable
sudo pacman -S darktable

## Video and Audio creation
# Kdenlive
#sudo pacman -S kdenlive

# Shotcut
#sudo pacman -S shotcut

# Audacity
sudo pacman -S audacity

#Simple Screen Recorder
sudo pacman -S simplescreenrecorder

## Office tools
# LibreOffice
sudo pacman -S libreoffice libreoffice-breeze-icons
# LibreOffice Portuguese localization et all
yay -S hunspell-pt_pt hunspell-pt_pt-preao hyphen-pt_pt

## Internet Stuff
# Extra browser [Chromium or Opera]
sudo pacman -S chromium opera

# FTP support
#sudo pacman -S install filezilla

# p2p
# qBittorrent
sudo pacman -S qbittorrent
# transmission
#sudo pacman -S transmission-gtk

# Firewall
sudo pacman -S ufw

# Handy tools
sudo pacman -S net-tools-git

# VPN stuff
#yay -S qomui

## Battery Laptop Tweak
# Install the magic
sudo pacman -S tlp
# Make it happen
sudo tlp start

# Beautify tools
# NUMiX
#sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle

# Gotta reboot now:

echo $'\n'$"*** Follow the white rabbit & reboot ***"
exit
