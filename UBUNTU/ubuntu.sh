#!/bin/bash
# ==============================================================================
# 🦝 Ubuntu 26.04 LTS (Resolute Raccoon) Post-Setup Script
# Author: pedro andrade - https://github.com/opedromandrade                       
# Updated on: 07.2026                                                            
# Description: Automates the installation of essential packages on Ubuntu 26.04.
# Guidance: Run this script with sudo. Rebooting after completion is advised.
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

# --- Root Privilege Check ---
if [ "$EUID" -ne 0 ]; then
    log "error" "❌ Please run this script with sudo or as root."
    exit 1
fi

log "info" "🚀 Starting Ubuntu 26.04 LTS post-installation environment setup..."

# ==============================================================================
# 1. SYSTEM UPDATE & REPAIR
# ==============================================================================
log "info" "🔄 Updating package repositories and upgrading system components..."
apt clean
apt update
apt dist-upgrade -y
apt --fix-broken install -y

# ==============================================================================
# 2. FLATPAK FRAMEWORK SETUP (Prioritized Application Layer)
# ==============================================================================
log "info" "📦 Setting up Flatpak application framework..."
apt install -y flatpak

# Install the GNOME Software Flatpak plugin if it exists
if apt-cache show gnome-software-plugin-flatpak > /dev/null 2>&1; then
    apt install -y gnome-software-plugin-flatpak
fi

# Add the official Flathub repository universe
log "info" "🌐 Adding Flathub repository remote universe..."
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# ==============================================================================
# 3. HARDWARE & LAPTOP OPTIMIZATIONS (Optional / Commented out)
# ==============================================================================
# log "info" "🔧 Configuring hardware drivers and laptop tools..."
# apt install -y tlp tlp-rdw
# tlp start

# ==============================================================================
# 4. SOFTWARE INSTALLATION BLOCKS (APT Native)
# ==============================================================================

# Core System Utilities
CORE_UTILS=(
    bash-completion
    net-tools
    git
    wget
    gvfs
    htop
    fastfetch
    strace
)
log "info" "🛠️ Installing core system and terminal utilities..."
apt install -y "${CORE_UTILS[@]}"

# Archive & Compression Tools
COMPRESSION_TOOLS=(
    unace
    rar
    zip
    unzip
    p7zip-full
    p7zip-rar
    sharutils
    uudeview
    arj
    cabextract
)
log "info" "📦 Installing compression and archive formats..."
apt install -y "${COMPRESSION_TOOLS[@]}"

# Development Environments
log "info" "☕ Installing Java 25 Development environments..."
apt install -y openjdk-25-jre

# Office Suite & Portuguese Localization
OFFICE_APPS=(
    libreoffice
    myspell-pt
    hyphen-pt-pt
    libreoffice-l10n-pt
    mythes-pt-pt
    hunspell-pt-pt
    libreoffice-help-pt
)
log "info" "📝 Installing LibreOffice and Portuguese language dictionaries..."
apt install -y "${OFFICE_APPS[@]}"

# Typography & Fonts
log "info" "🔤 Accepting EULA and installing TrueType Microsoft Fonts..."
echo ttf-mscorefonts-installer msttcorefont/accepted-msteula select true | debconf-set-selections
DEBIAN_FRONTEND=noninteractive apt install -y ttf-mscorefonts-installer

# Audio Players & Tag Editors
AUDIO_SOFTWARE=(
    quodlibet
    exfalso
    easytag
)
log "info" "🎵 Installing audio playback, management, and tagging software..."
apt install -y "${AUDIO_SOFTWARE[@]}"

# Audio Editing & Production
log "info" "🎙️ Installing audio recording and wave editors..."
apt install -y audacity

# Digital Books & E-Pub Authoring
log "info" "📚 Installing EPUB authoring tools from repositories..."
apt install -y sigil

log "info" "🌐 Downloading and installing latest Calibre suite from upstream binaries..."
wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin

# Image Editing & Photography
IMAGE_EDITING=(
    gimp
    gimp-data-extras
    rapid-photo-downloader
    darktable
)
log "info" "📸 Installing graphic editors and photography processing tools..."
apt install -y "${IMAGE_EDITING[@]}"

# Video Creation & DVD Playback
VIDEO_SOFTWARE=(
    libdvdcss2
    shotcut
    simplescreenrecorder
)
log "info" "🎬 Installing video editing, screen recording, and DVD support codecs..."
apt install -y "${VIDEO_SOFTWARE[@]}"

# Security & Desktop Personalization
DESKTOP_POLISH=(
    gufw
    dmz-cursor-theme
)
log "info" "🎨 Installing desktop themes and local firewall security panels..."
apt install -y "${DESKTOP_POLISH[@]}"

# ==============================================================================
# 5. OPTIONAL NETWORKING & BROWSER SUITES (Uncomment to enable)
# ==============================================================================
# log "info" "🌐 Installing commented networking suites..."
# apt install -y chromium-browser filezilla qbittorrent
# apt install -y openvpn network-manager-openvpn wireguard
# apt install -y numix-gtk-theme numix-icon-theme numix-icon-theme-circle

# ==============================================================================
# 6. SYSTEM CLEANUP & WRAP UP
# ==============================================================================
log "info" "🧹 Optimizing disk space and removing residual installation caches..."
apt autoremove -y
apt autoclean -y

log "success" "🎉 All software packages processed successfully!"
echo ""

# ==============================================================================
# 7. INTERACTIVE REBOOT PROMPT
# ==============================================================================
read -p "🔄 Do you want to reboot the system now? (y/N): " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        log "warn" "🐇 *** Follow the white rabbit & reboot your machine now ***"
        echo ""
        sleep 2
        reboot
        ;;
    *)
        log "info" "Reboot skipped. Please remember to reboot later to apply all configurations (especially Flatpak paths)."
        echo ""
        ;;
esac