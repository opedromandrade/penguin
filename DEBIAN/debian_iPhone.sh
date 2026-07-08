#!/bin/bash
# ==============================================================================
# 🐧 Debian Fresh Install iPhone Integration Script
# Author: pedro andrade - https://github.com/opedromandrade
# Updated on: 07.2026
# Description: Installs iOS connection utilities, configures HEIC image support,
#              and handles safe interactive mount/unmount vectors.
# Reference: https://opensource.com/article/21/8/libimobiledevice-iphone-linux
# Guidance: Run this script with sudo. 
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

# Track the non-root user who called the script via sudo
REAL_USER="${SUDO_USER:-$USER}"
USER_HOME=$(eval echo "~$REAL_USER")
MOUNT_POINT="$USER_HOME/iPhone"

log "info" "🚀 Starting Debian iOS subsystem deployment..."

# ==============================================================================
# 1. CORE DRIVERS & HEIC PHOTO UTILITY DEPENDENCY INSTALLATION
# ==============================================================================
log "info" "📦 Updating package listings..."
apt update

log "info" "🔌 Installing USB multiplexing daemons and iOS filesystem bridges..."
apt install -y usbmuxd libimobiledevice-1.0-6 libimobiledevice6 libimobiledevice-utils ifuse

log "info" "📸 Installing HEIF/HEIC thumbnailers and native image viewer plugins..."
# Installs libraries so you can view, load, and preview iPhone photos directly in the file manager
apt install -y heif-gdk-pixbuf heif-thumbnailer libheif1

# Restart the backend daemons to ensure they pick up your phone instantly
log "info" "🔄 Initializing background communication protocols..."
systemctl restart usbmuxd

# ==============================================================================
# 2. LOCAL MOUNT DIRECTORY PROVISIONING
# ==============================================================================
log "info" "📁 Ensuring storage node points exist in home tree..."
sudo -u "$REAL_USER" mkdir -p "$MOUNT_POINT"

# ==============================================================================
# 3. MOUNTING & USER GUIDANCE
# ==============================================================================
echo ""
log "warn" "📱 Action Required:"
log "warn" "1. Connect your iPhone to a USB port."
log "warn" "2. Unlock your screen and select 'Trust This Computer' on the prompt."
echo ""

read -p "⌨️ Press [Enter] once your device is connected and trusted..." 

log "info" "🔗 Linking active iOS filesystem onto localized mount vector..."
# Mount point execution must run under user privileges so it displays inside standard file managers
sudo -u "$REAL_USER" ifuse "$MOUNT_POINT"

log "success" "🎉 All set! Your iPhone is linked to your desktop file explorer."
log "info" "📂 You can view your files and HEIC pictures inside the '$MOUNT_POINT' directory."
echo ""

# ==============================================================================
# 4. SAFE INTERACTIVE UNMOUNT / EJECT WRAPPER
# ==============================================================================
log "warn" "⚠️  CRITICAL: Do not pull out the USB cable while your files are open."
echo ""

read -p "🛑 Ready to unplug your device safely? Press [Enter] to EJECT/UNMOUNT the iPhone..."

log "info" "🔌 Safely dismantling file streams and unmounting device nodes..."
# Uses fusermount3 under standard user context to safely isolate and unmount the directory
sudo -u "$REAL_USER" fusermount3 -u "$MOUNT_POINT"

log "success" "✅ Device safely unmounted! You can now safely disconnect the USB cable."
echo ""
log "success" "*** All set! ***"
echo ""
