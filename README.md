# 🐧 Penguin

A humble collection of Linux configuration scripts built to make new desktop runs completely frictionless. Run them once, sit back, and chill. ☕

While this repository originally hosted just a few basic templates, it has grown to become the centralized hub for **ALL** my Linux deployment needs across multiple distributions.

> 💡 **Note:** These configurations strictly reflect my personal workflow, preferred software stacks, and hardware ecosystems. Feel free to fork, transform, distribute, or adapt any file here to match **YOUR** requirements. Suggestions and pull requests are always welcome!

---

## 🛠️ Prerequisites

> [!WARNING]
> **Look before you leap!** These scripts execute system-level changes. Always review the script contents before running them on your machine.

Make sure your system is updated and you have `git` and `unzip` installed:
* **Debian/Ubuntu:** `sudo apt update && sudo apt install git unzip -y`
* **EndeavourOS/Arch:** `sudo pacman -Syu git unzip`

---

## 🔍 Directory & Features Map

### 🌀 Debian
Tailored deployment frameworks specifically optimized for **Debian 13 (Trixie)**.
* 📄 `debian.sh` — The ultimate post-install routine. Installs core development toolchains, media codecs, and localization utilities.
* 📄 `debian_bt.sh` — Seeds missing Bluetooth profiles and software wrappers, optimized for minimal environments like [XFCE](https://xfce.org).
* 📄 `debian_iPhone.sh` — Mounts and establishes immediate local subsystem communication tools for accessing iPhone filesystems natively.
* 📄 `debian_zoom.sh` — Lightweight micro-script that cleanly pulls and wraps the official Zoom communications deb framework.
* 📂 `sources/` — Up-to-date repository configurations supporting both classic and modern **DEB822** standard profiles.

### 🦅 EndeavourOS
* 📄 `endeavour.sh` — Modernized, emoji-fied Arch-based automation file using `pacman` and `yay` to group core desktop dependencies cleanly.

### 🦝 Ubuntu
Comprehensive deployment resources optimized specifically for Canonical's **Ubuntu 26.04 LTS**.
* 📄 `ubuntu.sh` — Flagship post-install script. Rebuilt to set up an advanced, layered application architecture optimizing Flatpak runtimes over traditional system snaps.
* 📂 `sources/` — Pristine repository templates structured in both classic `sources.list` and modern DEB822 `.sources` formats.

---

## ℹ️ Setup: Getting the Scripts

Download the repository and open your terminal inside the project directory using one of the methods below.

### Method A: The Web Download Way
1. Click 👉 **[Download Repository ZIP Archive](https://github.com/opedromandrade/penguin/archive/master.zip)**.
2. Extract the archive using your file manager, or run:
   ```bash
   unzip penguin-master.zip
   ```
3. Navigate into the extracted folder.

### Method B: The Git Way (Recommended)
Clone the repository and enter the directory immediately by running:
```bash
git clone https://github.com/opedromandrade/penguin.git
cd penguin
```

---

## 🚀 How to Run the Scripts

1. Make the desired script executable:
   ```bash
   # Example for Ubuntu
   chmod +x ubuntu/ubuntu.sh
   ```
2. Execute the script with necessary permissions:
   ```bash
   ./ubuntu/ubuntu.sh
   ```
