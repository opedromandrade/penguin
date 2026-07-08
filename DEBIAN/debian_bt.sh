#!/bin/bash
# ==============================================================================
# 🐧 Debian Bluetooth Install & Audio Setup Script
# Author: pedro andrade - https://github.com/opedromandrade
# Updated on: 07.2026
# Description: Installs Blueman, PipeWire/PulseAudio Bluetooth integrations,
#              and enables the system Bluetooth stack.
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

log "info" "🚀 Starting Debian Bluetooth & Audio configuration..."

# ==============================================================================
# 1. PACKAGE INSTALLATION (Bluetooth & Audio Drivers)
# ==============================================================================
log "info" "📦 Updating package listings..."
apt update

log "info" "📦 Installing Blueman Bluetooth manager..."
apt install -y blueman

log "info" "🎵 Installing PipeWire PulseAudio-compatibility layers and Bluetooth audio codecs..."
# Installs modern system audio paths and the plugins required for high-quality audio profiles (A2DP, HSP/HFP)
apt install -y pipewire-audio pipewire-pulse wireplumber

# ==============================================================================
# 2. SERVICE CONFIGURATION
# ==============================================================================
log "info" "🔄 Enabling and starting the Bluetooth system service..."
systemctl enable --now bluetooth

log "success" "🎉 Bluetooth hardware and wireless audio layers configured successfully!"
echo ""

# ==============================================================================
# 3. INTERACTIVE REBOOT PROMPT
# ==============================================================================
read -p "🔄 Do you want to reboot the system now? (y/N): " response
case "$response" in
    [yY][eE][sS]|[yY]) 
        log "warn" "📡 *** Wireless all things & rebooting your machine now ***"
        echo ""
        sleep 2
        reboot
        ;;
    *)
        log "info" "Reboot skipped. Please remember to reboot later to apply all Bluetooth and audio configurations."
        echo ""
        ;;
esac
