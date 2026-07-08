#!/bin/bash
# ==============================================================================
# 🐧 Debian Fresh Install Zoom Setup Script
# Author: pedro andrade - https://github.com/opedromandrade
# Updated on: 11.2025
# Description: Automatically downloads and configures Zoom Client for Linux.
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

log "info" "🚀 Starting Zoom deployment framework..."

# ==============================================================================
# 1. PREREQUISITE ENVIRONMENT VERIFICATION
# ==============================================================================
if ! command -v wget &> /dev/null; then
    log "info" "🛠️ wget not detected. Fetching tool utility package..."
    apt update
    apt install -y wget
fi

# ==============================================================================
# 2. DOWNLOAD & PACKAGE INSTALLATION
# ==============================================================================
log "info" "🌐 Pulling latest Zoom 64-bit architecture distribution binary..."
# Working directly inside /tmp keeps your system directories tidy
TEMP_DEB="/tmp/zoom_amd64.deb"
wget -O "$TEMP_DEB" https://zoom.us/client/latest/zoom_amd64.deb

log "info" "📦 Unpacking and resolving system structural dependencies..."
apt install -y "$TEMP_DEB"

log "info" "🧹 Clearing cached temporary installer binaries..."
rm -f "$TEMP_DEB"

log "success" "🎉 Zoom communications terminal integrated successfully!"
echo ""

# ==============================================================================
# 3. INTERACTIVE REBOOT PROMPT
# ==============================================================================
read -p "🔄 Do you want to reboot the system now? (y/N): " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        log "warn" "👥 *** Where's everyone? & rebooting your machine now ***"
        echo ""
        sleep 2
        reboot
        ;;
    *)
        log "info" "Reboot skipped. You are now free to launch Zoom directly from your desktop launcher environment."
        echo ""
        ;;
esac
