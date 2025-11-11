# :penguin: Penguin
This repository is a collection of few Linux scripts, I've put up together along the years. I’ve made them to make my Linux usage a bit more carefree: set it up once and chill.
This repo used to host just a few scripts for Ubuntu and EndeavorOS, but I’ve decided to use for **ALL** my Linux needs, distro gnostic.

They reflect my personal needs and my Linux usage and also my systems. Please find bellow the list of folders with a short description.

Feel free to transform, distribute or adapt this script according to **YOUR** needs. Suggestions are very welcome.

## :mag: What's in here
**DEBIAN**  
This folder contains a set of scripts specifically for [Debian](https://www.debian.org):

1. debian.sh - A post-install script. It installs stuff automagically to meet my computer needs;
2. debian_bt.sh - This script adds Bluetooth support for Debian (when not present), particularly on Debian with [XFCE](https://xfce.org) desktop;
3. debian_iPhone.sh - A script to access and use iPhone on a Debian system;
4. debian_zoom.sh - Small script to install zoom;
5. sources - My source list for both stable and testing systems. 

**ENDEAVOUR**
1. My [EndeavourOS](https://github.com/endeavouros-team) post-install script. This script is **probably deprecated**, since I haven’t used EdeavourOS for quite some time.

**UBUNTU**  
This folder contains all of my [Ubuntu](https://ubuntu.com/) related scripts:

1. MotherFossa - this script was originally created for Ubuntu 20.04 release, and I quite enjoyed the pun between Focal Fossa and MotherF(word). This script is currently being kept up to date;
2. **(deprecated)** BeverFever - script for Ubuntu 18.04;
3. **(deprecated)** BuntuSources - my sources for Ubuntu: since the source’s mechanism was updated on Debian and Ubuntu followed, this is no longer valid.

## :information_source: How to use

1. [Download [zip]](https://github.com/opedromandrade/penguin/archive/master.zip)
2. Extract the desired script
3. Give permissions to run the file

   `$ chmod +x /path to/or/file`

4. Run it

    `$ sh ./myscript.sh`