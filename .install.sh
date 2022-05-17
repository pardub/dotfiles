#!/bin/bash -xev

sudo dnf -y update

# ADD EXTRA REPOS rpm fusion
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Fastest mirror and Delta RPM
sudo echo 'fastestmirror=True'             | sudo tee -a /etc/dnf/dnf.conf
sudo echo 'deltarpm=True'                  | sudo tee -a /etc/dnf/dnf.conf
sudo echo 'max_parallel_downloads=10'      | sudo tee -a /etc/dnf/dnf.conf
sudo sudo dnf clean all

# DISABLING SSH
sudo systemctl stop sshd
sudo systemctl disable sshd

# ADD FLATPAK REPO
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Manage Flatpak permissions
sudo flatpak install flathub com.github.tchx84.Flatseal

############## INSTALL SOFTWARES ##############

### web console for Linux servers
#sudo dnf -y install cockpit

# Backup system
sudo dnf -y install timeshift

# distributed version control system
sudo dnf -y install git

# Vim-fork
sudo dnf -y install neovim

# A simple, fast and user-friendly alternative to 'find'
sudo dnf -y install fd-find

#sudo dnf -y install visudo
#sudo dnf -y install --allowerasing vim-default-editor

# Gparted is the GNOME Partition Editor
sudo dnf -y install gparted

# Collection of Linux utilities
sudo dnf -y install util-linux-user

# Zsh
sudo dnf -y install zsh

# Terminal file manager
sudo dnf -y install nnn 

# Terminal file manager
sudo dnf -y install ranger 

# Browser
sudo dnf -y install chromium-browser-privacy

sudo dnf -y groupinstall "Development Tools"
sudo dnf -y install gnome-tweaks
sudo dnf -y install gnome-extensions-app
sudo dnf -y install autoconf 
sudo dnf -y install automake
sudo dnf -y install ansible

# Deduplicating backup program
sudo dnf -y install borgbackup

# Simple, configuration-driven backup software for servers and workstations.
sudo dnf -y install borgmatic

# Document viewer
sudo dnf -y install okular

# Collaborative cheatsheets for console commands
sudo dnf -y install tldr

# IRC client
sudo dnf -y install weechat

# FTP application
sudo dnf -y install filezilla

sudo dnf -y install wireguard-tools

# A cat(1) clone with syntax highlighting and Git integration.
sudo dnf -y install bat

# A modern replacement for ls
sudo dnf -y install exa

# A command-line fuzzy finder
sudo dnf -y install fzf

# youtube -cli
sudo dnf -y install youtube-dl

#Text Calendar
sudo dnf -y install calcurse

# rsync for cloud storage
sudo dnf -y install rclone

# Gui for rclone
sudo dnf -y install rclone-browser

# audio editor and recorder
sudo dnf -y install audacity-3.0.2

#sudo dnf -y install dropbox
sudo dnf -y install chrome-remote-desktop

sudo dnf -y install fuse

sudo dnf -y install pdfarranger

sudo dnf -y install bookworm

# flashcard program using spaced repetition
sudo dnf -y install anki

# Anonymizing overlay network for TCP
sudo dnf -y install tor

# Tor browser launcher
sudo dnf -y install torbrowser-launcher

### Checksum verification tool
sudo dnf -y install gtkhash

# Certificate manager and GUI for OpenPGP 
sudo dnf -y install kleopatra

# Collection of libraries and tools to process multimedia content such as audio, video, subtitles and related metadata.
sudo dnf -y install ffmpeg

# GnuPG Made Easy
sudo dnf -y install gpgme

# Mail Client Evolution
sudo dnf -y install evolution

# Lynis - Security auditing and hardening tool, for UNIX-based systems
sudo dnf -y install lynis

# Streaming with rclone
sudo dnf -y install mpv 

# save workspaces after reboot
sudo dnf -y install dconf-editor

# change MAC addres
sudo dnf -y install macchanger 

# Etesync repo
sudo dnf copr enable daftaupe/etesync-rs

# Etesync add-on for Evolution
sudo dnf -y install evolution-etesync

# Password Manager
sudo dnf -y install pass

# Gui for Pass
sudo dnf -y install qtpass

# Redshift adjusts the color temperature of the screen
sudo dnf -y install redshift

# Download Vorta backup
sudo dnf -y copr enable luminoso/vorta
sudo dnf -y install vorta

# Download Jami Voip client
sudo dnf -y config-manager --add-repo https://dl.jami.net/nightly/fedora_34/jami-nightly.repo
sudo dnf -y install jami

# UNINSTALL
sudo dnf -y remove totem

# SERVICES ACTIVATION

# CODECS
sudo dnf -y install x264
sudo dnf -y groupupdate Multimedia
sudo dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf -y install lame\* --exclude=lame-devel
sudo dnf -y group upgrade --with-optional Multimedia

# Download Visual Studio Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf -y check-update && sudo dnf -y  install code

### VS CODE INSTALL EXTENSIONS
code --install-extension ginfuru.ginfuru-better-solarized-dark-theme
code --install-extension ms-azuretools.vscode-docker	
code --install-extension dbaeumer.vscode-eslint
code --install-extension redhat.vscode-yaml

## Setup Visudo
echo 'marc ALL=(ALL:ALL) ALL' | sudo EDITOR='tee -a' visudo
echo 'Defaults:marc timestamp_timeout=60' | sudo EDITOR='tee -a' visudo

# ADD https://dns.watch/
echo 'nameserver='84.200.69.80' | sudo tee -a /etc/hosts
echo 'nameserver='84.200.70.40' | sudo tee -a /etc/hosts

# CHANGE HOSTNAME
sudo hostnamectl set-hostname fedora

# Disable Firewalld and Setup iptables ####

sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo systemctl mask firewalld
sudo dnf -y install iptables-services
sudo touch /etc/sysconfig/iptables
sudo systemctl enable iptables

# INSTALL JETBRAINS MONO FONTS IN ~/.local/share/fonts
mkdir -p ~/.local/share/fonts/nerd-fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -v

### SET UP VS CODE TO USE NEW FONTS
### RECOMMENDED SETTINGS FOR THE FONT
### Size: 13
### Line spacing: 1.2

### FIREWALL SET UP OPEN/CLOSED PORTS

##### SET UP GNOME TERMINAL
# https://ncona.com/2019/11/configuring-gnome-terminal-programmatically/
# We will need this value later, so let’s save it in a variable:

GNOME_TERMINAL_PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}')
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font 'Monospace 10'
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font 'MesloLGS NF 10'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font 'JetBrainsMono NF'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ audible-bell false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ use-theme-colors false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ background-color '#000000'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ foreground-color '#AFAFAF'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$GNOME_TERMINAL_PROFILE/ cursor-shape 'I-Beam'

# set up minimize/maximize  window
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

# OPENSNITCH
cd /usr/share
sudo mkdir -p opensnitch
cd /usr/share/opensnitch
wget https://github.com/evilsocket/opensnitch/releases/download/v1.5.0/opensnitch-1.5.0-1.x86_64.rpm
wget https://github.com/evilsocket/opensnitch/releases/download/v1.5.0/opensnitch-ui-1.5.0-1.noarch.f29.rpm
sudo dnf -y localinstall opensnitch-1*.rpm; sudo dnf -y localinstall opensnitch-ui*.rpm
sudo systemctl enable --now opensnitch
sudo systemctl start opensnitch
cd

# Install pluging zsh-syntax-highlighting
cd /usr/share/zsh/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "# Load zsh-syntax-highlighting; should be last." >> $ZDOTDIR/.zshrc
echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc

# Install pluging zsh-autosuggestions
cd /usr/share/zsh/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions.git
echo "# Load zsh-autosuggestions; should be last." >> $ZDOTDIR/.zshrc
echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc

# Install pluging zsh-abbr
cd /usr/share/zsh/plugins/
git clone https://github.com/olets/zsh-abbr
echo "source /usr/share/zsh/plugins/zsh-abbr/zsh-abbr.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc


