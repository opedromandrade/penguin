# 🐧 Penguin

This repository is a curated collection of Linux configuration scripts I've pieced together over the years. I built them to make my desktop transitions completely frictionless: run them once, sit back, and chill. ☕

While this repo originally hosted just a few basic templates, it has grown to become the centralized hub for **ALL** my Linux deployment needs across multiple distributions. 

> 💡 **Note:** These configurations strictly reflect my personal workflow, preferred software stacks, and hardware ecosystems. Feel free to fork, transform, distribute, or adapt any file here to match **YOUR** personal daily requirements. Suggestions and pull requests are always welcome!

---

## 🔍 Directory & Features Map

### 🌀 DEBIAN
This folder houses robust, modern deployment frameworks tailored specifically for [Debian](https://www.debian.org):
* 📄 `debian.sh` — The ultimate post-install routine. Automagically installs core development toolchains, media codecs, and localization utilities.
* 📄 `debian_bt.sh` — Seeds missing Bluetooth profiles and software wrappers, optimized specifically for minimal environments like [XFCE](https://xfce.org).
* 📄 `debian_iPhone.sh` — Mounts and establishes immediate local subsystem communication tools for accessing iPhone filesystems natively.
* 📄 `debian_zoom.sh` — Lightweight micro-script that cleanly pulls and wraps the official Zoom communications deb framework.
* 📂 `sources/` — Up-to-date repository configurations (supporting both classic and modern **DEB822** standard profiles) for **Debian 13 (Trixie) Stable**.

### 🦅 ENDEAVOUR
* 📄 `endeavour.sh` — A modernized, emoji-fied Arch-based automation file using `pacman` and `yay` to group core desktop dependencies cleanly.

### 🦝 UBUNTU
Comprehensive deployment resources optimized specifically for Canonical's latest releases:
* 📄 `ubuntu.sh` — The flagship script rebuilt explicitly for **Ubuntu 26.04 LTS**. It sets up an advanced, layered application architecture optimizing Flatpak runtimes over traditional system snaps.
* 📂 `sources/` — Pristine repository templates for **Ubuntu 26.04 LTS** structured both in the classic `sources.list` format and the mandatory modern DEB822 `.sources` format.

---

## ℹ️ Setup: Getting the Scripts

Before running anything, download the repository and open your terminal inside the project directory.

### Method A: The Web Download Way
1. Click 👉 **[Download Repository ZIP Archive](https://github.com/opedromandrade/penguin/archive/master.zip)**.
2. Extract the `.zip` file using your file manager or run `unzip penguin-master.zip` in your terminal.
3. Open your terminal and navigate to the extracted folder.
4. Yo run ot go to the folder
   `cd debian/`
`chmod +x debian.sh`
`sudo ./debian.sh`

### Method B: The Git Way
Run the following block to clone the repository and enter it immediately:
```bash
git clone [https://github.com/opedromandrade/penguin.git](https://github.com/opedromandrade/penguin.git)
cd penguin
