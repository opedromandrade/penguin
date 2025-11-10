#!/bin/bash
# 
# Author: pedro andrade - https://github.com/opedromandrade
# this is just a simple script for Ubuntu
#
# v11.2025
#
# before starting:
#	1. make sure you have the fastest mirror selected, and also the Canonical Partners Repo enabled
#	2. comment lines out to disable stuff you don't want install/remove

### Let's roll!

## Let's update stuff
sudo apt update && sudo apt upgrade -y

# Install Intel proprietary stuff
#sudo apt-get install i965-va-driver-shaders intel-media-va-driver-non-free intel-gpu-tools

## Small things
# Open JDK - open source implementation of the Java Platform - openjdk-21 is the most recent stable version of open Java Platform
sudo apt-get install openjdk-21-jre

# GIT - open source-code management tool
sudo apt-get install git wget

# Synaptic package manager - a graphical package management program for apt
sudo apt-get install synaptic

## Some extra zing to Ubuntu
# Restricted extras (includes a bunch of cool stuff, codecs and fonts) - https://help.ubuntu.com/community/RestrictedFormats
sudo apt-get install ubuntu-restricted-extras
#sudo apt-get install kubuntu-restricted-extras
#sudo apt-get install xubuntu-restricted-extras
#sudo apt-get install lubuntu-restricted-extras

## Video players
# mpv media player - mpv is a free (as in freedom) media player
sudo apt-get install mpv

# Gnome Videos (formerly known as totem) 
#sudo apt-get install totem

## Audio files software
# Quodlibet and exfalso - a cross-platform audio/music management program
sudo apt-get install quodlibet exfalso

# EasyTAG - an utility for viewing, editing and writing meta info of different audio files
sudo apt-get install easytag

## Book stuff
# Calibre - the one stop solution for all  e-book needs - https://calibre-ebook.com
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# Sigil - EPUB Editor
sudo apt-get install sigil

## Aditional formats for compression
sudo apt-get install unace rar zip unzip p7zip p7zip-full p7zip-rar sharutils uudeview arj cabextract

## Image editing
# GIMP - the GNU Image Manipulation Program
#sudo apt-get install gimp gimp-plugin-registry gimp-data-extras

## Photography
# Rapid Photo Downloader is a Linux desktop application that imports photos and video - for culling them photos
sudo apt-get install rapid-photo-downloader

# Darktable - darktable is an open source photography workflow application and raw developer
#sudo apt-get install darktable

# Audacity
sudo apt-get install audacity

#Simple Screen Recorder
#sudo apt-get install simplescreenrecorder

## Office tools
# LibreOffice
sudo apt-get install libreoffice-gnome libreoffice
# LibreOffice European Portuguese localization et all
sudo apt-get install myspell-pt hyphen-pt-pt libreoffice-l10n-pt mythes-pt-pt libreoffice-help-pt

## Internet Stuff
# Extra browser [Chromium] - Chromium is an open-source browser project that aims to build a safer, faster, and more stable way for all users to experience the web
#sudo apt-get install chromium-browser

# FTP support
# FileZilla - the free FTP solution
#sudo apt-get install filezilla

# p2p
# qBittorrent - a cross-platform free and open-source BitTorrent client
#sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable && sudo apt-get update && sudo apt-get install qbittorrent

# Transmission - a fast, easy, and free BitTorrent client
sudo apt-get install transmission-gtk

# Firewall
# GUFW - A graphical user interface for Ubuntu's Uncomplicated Firewall
sudo apt-get install ufw gufw

# Handy tools
# net-tools - a package of legacy Linux command-line utilities for network administration
sudo apt-get install net-tools

# VPN stuff
# Wireguard - an extremely simple yet fast and modern VPN
#sudo apt-get install wireguard

## Battery Laptop Tweak
# TLP - is a feature-rich command line utility for Linux, saving laptop battery power without the need to delve deeper into technical details
sudo apt-get install tlp tlp-rdw
# Make it happen
sudo tlp start

# Beautify tools
#sudo apt-get install chrome-gnome-shell gnome-tweak-tool

# NUMiX - themes and icons for linux
sudo apt-get install numix-gtk-theme numix-icon-theme numix-icon-theme-circle

# Clean some more [just for reinsurance]
sudo apt autoremove && sudo apt autoclean

# Gotta reboot now:

echo $'\n'$"*** Follow the white rabbit & reboot ***"
exit