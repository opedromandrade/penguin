#!/bin/bash
# ==============================================================================
# 🦅 EndeavourOS Fresh Install Post-Setup Script
# Author: pedro andrade - https://github.com/opedromandrade                       
# Updated on: 07.2026                                                            
# Description: Automates the installation of essential packages on EndeavourOS.
# Guidance: Run this script as a NORMAL USER (not root). It will ask for sudo.
# ==============================================================================

# Exit immediately if a command exits with a non-zero status
set -e

# --- Colors for Terminal Output ---
NC='\033[0m' # No Color
echo -e "${NC}" # Reset terminal color defaults safely
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'

# --- Logging Function ---
log() {
    local type="$1"
    local message="$2"
    case "$type" in
        "info")    echo -e "${BLUE}[INFO]${NC} $message" ;;
        "success") echo -e "${GREEN}[SUCCESS]${NC} $message" ;;
        "warn")    echo -e "${YELLOW}[WARN]${NC} $message" ;;
        "error")   echo -e "${RED}[ERROR]${NC} $message" ;;
    esac
}

# --- Root Privilege Guard ---
if [ "$EUID" -eq 0 ]; then
    log "error" "❌ Please do NOT run this script as root or with sudo directly."
    log "error" "   AUR helpers like 'yay' cannot compile packages as root."
    exit 1
fi

log "info" "🚀 Starting EndeavourOS post-installation environment setup..."

# ==============================================================================
# 1. SYSTEM UPDATE & REPAIR
# ==============================================================================
log "info" "🔄 Updating package repositories and upgrading system components..."
sudo pacman -Syyu --noconfirm
yay -Syu --noconfirm

# ==============================================================================
# 2. HARDWARE & LAPTOP OPTIMIZATIONS (Optional / Commented out)
# ==============================================================================
# log "info" "🔧 Configuring hardware drivers and battery management..."
# sudo pacman -S --noconfirm tlp blueberry
# sudo tlp start

# ==============================================================================
# 3. SOFTWARE INSTALLATION BLOCKS (Pacman Native)
# ==============================================================================

# Core System Utilities
CORE_UTILS=(
    bash-completion
    net-tools
    git
    wget
    gvfs
    htop
    neofetch
    strace
)
log "info" "🛠️ Installing core system and terminal utilities..."
sudo pacman -S --noconfirm "${CORE_UTILS[@]}"

# Archive & Compression Tools
COMPRESSION_TOOLS=(
    unace
    unrar
    zip
    unzip
    p7zip
    sharutils
    uudeview
    arj
    cabextract
)
log "info" "📦 Installing compression and archive formats..."
sudo pacman -S --noconfirm "${COMPRESSION_TOOLS[@]}"

# Development Environments
log "info" "☕ Installing Java Development environments..."
sudo pacman -S --noconfirm jdk-openjdk

# Office Suite & Portuguese Localization
OFFICE_APPS=(
    libreoffice-fresh
    libreoffice-breeze-icons
)
log "info" "📝 Installing LibreOffice..."
sudo pacman -S --noconfirm "${OFFICE_APPS[@]}"

# Audio Players & Tag Editors
AUDIO_SOFTWARE=(
    quodlibet
    easytag
)
log "info" "🎵 Installing audio playback, management, and tagging software..."
sudo pacman -S --noconfirm "${AUDIO_SOFTWARE[@]}"

# Audio Editing & Production
log "info" "🎙️ Installing audio recording and multi-track wave editors..."
sudo pacman -S --noconfirm audacity

# Digital Books & E-Pub Authoring (Calibre is natively cutting-edge on Arch)
BOOK_TOOLS=(
    sigil
    calibre
)
log "info" "📚 Installing EPUB authoring tools and Calibre suite..."
sudo pacman -S --noconfirm "${BOOK_TOOLS[@]}"

# Image Editing & Photography
IMAGE_EDITING=(
    gimp
    gimp-data-extras
    rapid-photo-downloader
    darktable
)
log "info" "📸 Installing graphic editors and photography processing tools..."
sudo pacman -S --noconfirm "${IMAGE_EDITING[@]}"

# Video Creation & System Polish
VIDEO_SOFTWARE=(
    shotcut
    simplescreenrecorder
    gufw
    xcursor-dmz
)
log "info" "🎬 Installing video tools, firewall GUI, and cursor enhancements..."
sudo pacman -S --noconfirm "${VIDEO_SOFTWARE[@]}"

# ==============================================================================
# 4. AUR SOFTWARE & LOCALIZATIONS (via Yay)
# ==============================================================================
log "info" "🌟 Installing packages from the Arch User Repository (AUR)..."

# TrueType Microsoft Fonts & Portuguese Dictionaries
AUR_PACKAGES=(
    ttf-ms-fonts
    hunspell-pt-pt
    hyphen-pt
)
yay -S --noconfirm "${AUR_PACKAGES[@]}"

# ==============================================================================
# 5. THIRD-PARTY REPOSITORY FRAMEWORKS (Flatpak Setup)
# ==============================================================================
log "info" "📦 Setting up Flatpak application framework..."
sudo pacman -S --noconfirm flatpak

log "info" "🌐 Adding Flathub repository remote universe..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# ==============================================================================
# 6. OPTIONAL NETWORKING & BROWSER SUITES (Uncomment to enable)
# ==============================================================================
# log "info" "🌐 Installing commented networking suites..."
# sudo pacman -S --noconfirm chromium opera filezilla qbittorrent transmission-gtk openvpn networkmanager-openvpn wireguard-tools
# yay -S --noconfirm numix-gtk-theme numix-circle-icon-theme-git

# ==============================================================================
# 7. SYSTEM CLEANUP & WRAP UP
# ==============================================================================
log "info" "🧹 Optimizing disk space and removing residual build caches..."
sudo pacman -Rns $(pacman -Qtdq) --noconfirm || log "info" "No orphan packages to remove."
yay -Sc --noconfirm

log "success" "🎉 All software packages processed successfully!"
echo ""

# ==============================================================================
# 8. INTERACTIVE REBOOT PROMPT
# ==============================================================================
read -p "🔄 Do you want to reboot the system now? (y/N): " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        log "warn" "🐇 *** Follow the white rabbit & reboot your machine now ***"
        echo ""
        sleep 5
        sudo reboot
        ;;
    *)
        log "info" "Reboot skipped. Please remember to reboot later to apply all configurations."
        echo ""
        ;;
esac