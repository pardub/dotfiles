#!/bin/bash -xev

# +---------+
# | Install |
# +---------+

# INSTALL JETBRAINS MONO FONTS IN ~/.local/share/fonts
mkdir -p "$HOME"/.local/share/fonts/nerd-fonts
cd /tmp
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
#sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/2.2.0-RC/JetBrainsMono.zip
sudo unzip /tmp/JetBrainsMono.zip -d ~/.local/share/fonts/nerd-fonts
fc-cache -v
cd || exit

# ADD EXTRA REPOS rpm fusion
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# ADD FLATPAK REPO
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Manage Flatpak permissions
sudo flatpak install -y flathub com.github.tchx84.Flatseal

# Metadata Cleaner - View and clean metadata in files
flatpak install -y flathub fr.romainvigier.MetadataCleaner

# Dotfiles management tool "chezmoi"
# sh -c "$(curl -fsLS chezmoi.io/get)"

### web console for Linux servers
#sudo dnf -y install cockpit

# NextDNS CLI client
# Config ==> https://github.com/nextdns/nextdns/wiki/RPM-Based-Distribution
#sudo curl -Ls https://repo.nextdns.io/nextdns.repo -o /etc/yum.repos.d/nextdns.repo
#sudo dnf -y install -y nextdns

# Man page with colors
sudo dnf -y install most

# Backup system
#sudo dnf -y install timeshift

# Shell script analysis tool
sudo dnf -y install ShellCheck

# Create containers
#sudo dnf -y install distrobox

# distributed version control system
sudo dnf -y install git

# Disk Usage User-friendly, colorful output
# https://github.com/muesli/duf
cd /opt || exit
sudo wget ttps://github.com/muesli/duf/releases/download/v0.8.1/duf_0.8.1_linux_amd64.rpm
sudo dnf install -y /opt/duf_0.8.1_linux_amd64.rpm
sudo rm -f duf_0.8.1_linux_amd64.rpm
cd || exit

# Log processing
sudo dnf -y install rsyslog

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
# sudo dnf -y install chromium-browser-privacy

sudo dnf -y groupinstall "Development Tools"
sudo dnf -y install gnome-tweaks
sudo dnf -y install gnome-extensions-app
sudo dnf -y install autoconf 
sudo dnf -y install automake
sudo dnf -y install ansible

# TeamViewer alternative
# https://github.com/rustdesk/rustdesk


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

# SFTP application
sudo dnf -y install filezilla

# Tools for configuring WireGuard
sudo dnf -y install wireguard-tools

# To enable the Wireguard connection
# sudo su
# cd /etc/wireguard# add Windscribe conf file here like Tokyo.conf
# exit sudo and back to user mode
# nmcli connection up Tokyo
# nmcli connection doww Tokyo

# A cat(1) clone with syntax highlighting and Git integration.
sudo dnf -y install bat

# A modern replacement for ls
sudo dnf -y install exa

# A command-line fuzzy finder
sudo dnf -y install fzf

# youtube -cli
sudo dnf -y install youtube-dl

# Text Calendar
sudo dnf -y install calcurse

# rsync for cloud storage
sudo dnf -y install rclone

# Gui for rclone
sudo dnf -y install rclone-browser

# Open Source Continuous File Synchronization
sudo dnf -y install syncthing

# audio editor and recorder
sudo dnf -y install audacity

#sudo dnf -y install dropbox
#sudo dnf -y install chrome-remote-desktop

sudo dnf -y install fuse

sudo dnf -y install pdfarranger

sudo dnf -y install bookworm

# flashcard program using spaced repetition
#sudo dnf -y install anki

# Anonymizing overlay network for TCP
sudo dnf -y install tor

# Tor browser launcher
sudo dnf -y install torbrowser-launcher

### Checksum verification tool
sudo dnf -y install gtkhash

# Gnome certificate manager and GUI for OpenPGP 
sudo dnf -y install seahorse

# Kde certificate manager and GUI for OpenPGP 
#sudo dnf -y install kleopatra

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

# Etesync repo && Etesync add-on for Evolution
sudo dnf -y copr enable daftaupe/etesync-rs
sudo dnf -y install evolution-etesync

# Password Manager
sudo dnf -y install pass

# Gui for Pass
sudo dnf -y install qtpass

# Password Manager
sudo dnf -y install keepassxc

# Redshift adjusts the color temperature of the screen
# sudo dnf -y install redshift

# Download Vorta backup
sudo dnf -y copr enable luminoso/vorta
sudo dnf -y install vorta

# Download Jami Voip client
sudo dnf -y config-manager --add-repo https://dl.jami.net/nightly/fedora_34/jami-nightly.repo
sudo dnf -y install jami


# UNINSTALL
sudo dnf -y remove totem
sudo dnf -y remove gnome-weather


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

# +----------------+
# | Virtualization |
# +----------------+

sudo dnf -y install @virtualization
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo dnf -y install gnome-boxes

# +-------------------------------+
# | Manual install - Intellj Idea |
# +-------------------------------+

# https://www.jetbrains.com/toolbox-app/
# https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.24.12080.tar.gz
# cd /opt/
# sudo tar -xvzf ~/Downloads/jetbrains-toolbox-1.20.8804.tar.gz
# sudo mv jetbrains-toolbox-1.20.8804 jetbrains


# Install pluging zsh-syntax-highlighting
#sudo mkdir -p /usr/share/zsh/plugins
#sudo cd /usr/share/zsh/plugins/
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# sudo echo "# Load zsh-syntax-highlighting; should be last." >> $ZDOTDIR/.zshrc
#sudo echo '# Load zsh-syntax-highlighting; should be last.'   | sudo tee -a  $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null" | sudo tee -a  $ZDOTDIR/.zshrc


# Install pluging zsh-autosuggestions
#sudo cd /usr/share/zsh/plugins/ || exit
#git clone https://github.com/zsh-users/zsh-autosuggestions.git
#sudo echo "# Load zsh-autosuggestions; should be last." >> $ZDOTDIR/.zshrc
#sudo echo "# Load zsh-syntax-autosuggestions; should be last." | sudo tee -a  $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null" | sudo tee -a  $ZDOTDIR/.zshrc


# Install pluging zsh-abbr
#sudo cd /usr/share/zsh/plugins/ || exit
#git clone https://github.com/olets/zsh-abbr
#sudo echo "source /usr/share/zsh/plugins/zsh-abbr/zsh-abbr.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-abbr/zsh-abbr.zsh 2>/dev/null" | sudo tee -a  $ZDOTDIR/.zshr

# Install zsh git-completion
#mkdir -p ~/config/zsh
#cd ~/zsh || exit
#curl -LJO https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
##echo "zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh" >> $HOME/config/zsh/.zshrc
##echo 'fpath=(~/.zsh $fpath)'  >> $HOME/config/zsh/.zshrc
#rm $HOME/config/zsh/.zcompdump
#cd || exit


# +---------------+
# | Configuration |
# +---------------+

### SET UP VS CODE TO USE NEW FONTS
### RECOMMENDED SETTINGS FOR THE FONT
### Size: 13
### Line spacing: 1.2

# need to list the keys to create the .gnupg directory
gpg --list-keys

# Create gpg-agent.conf file and caches the password for 1 week
sudo touch $HOME/.gnupg/gpg-agent.conf
sudo echo 'default-cache-ttl 604800'             | sudo tee -a $HOME/.gnupg/gpg-agent.conf
sudo echo 'max-cache-ttl 604800'                 | sudo tee -a $HOME/.gnupg/gpg-agent.conf

# CHANGE HOSTNAME
sudo hostnamectl set-hostname fedora

# DISABLING SSH
sudo systemctl stop sshd
sudo systemctl disable sshd

# Disable Firewalld and Setup iptables ####
cd
sudo systemctl stop firewalld
sudo systemctl disable firewalld
sudo systemctl mask firewalld
sudo dnf -y install iptables-services
sudo touch /etc/sysconfig/iptables
sudo systemctl enable iptables
sudo systemctl start iptables
wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/firewall.sh
chmod a+x firewall.sh
sudo ./firewall.sh
sudo service iptables save


# FIREWALL SET UP OPEN/CLOSED PORTS

# VS CODE INSTALL EXTENSIONS
#code --install-extension ginfuru.ginfuru-better-solarized-dark-theme
#code --install-extension ms-azuretools.vscode-docker	
#code --install-extension dbaeumer.vscode-eslint
#code --install-extension redhat.vscode-yaml

# Create Neovim config file
mkdir -p $HOME/.config/nvim/ || exit
touch init.vim $HOME/.config/nvim/ || exit

# SET UP GNOME TERMINAL
# https://ncona.com/2019/11/configuring-gnome-terminal-programmatically/
# We will need this value later, so let’s save it in a variable:

# set up minimize/maximize  window
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

GNOME_TERMINAL_PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}')
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font 'Monospace 10'
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font 'MesloLGS NF 10'
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font 'JetBrainsMono NF 10'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font "JetBrainsMonoMedium Nerd Font 12"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ audible-bell false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ use-theme-colors false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ background-color '#000000'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ foreground-color '#AFAFAF'
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ cursor-shape 'I-Beam'


# Disable updates and upgrades in GNOME Software
gsettings set org.gnome.software allow-updates false

# Disable automatically download and install updates
gsettings set org.gnome.software download-updates false

# Disable notifications about software updated in the background
gsettings set  org.gnome.software download-updates-notify false

# Disable check of the very first run of GNOME Software
gsettings set org.gnome.software first-run false

# Disable Remember recent files
gsettings set org.gnome.desktop.privacy remember-recent-files false

# Disable audible bell
gsettings set org.gnome.desktop.wm.preferences audible-bell false

# Show weekday on Gnome
gsettings set org.gnome.desktop.interface clock-show-weekday true


# OPENSNITCH
sudo mkdir -p /opt/opensnitch || exit
cd /opt/opensnitch || exit
#sudo wget https://github.com/evilsocket/opensnitch/releases/download/v1.5.0/opensnitch-1.5.0-1.x86_64.rpm
#sudo wget https://github.com/evilsocket/opensnitch/releases/download/v1.5.0/opensnitch-ui-1.5.0-1.noarch.f29.rpm
sudo wget https://github.com/evilsocket/opensnitch/releases/download/v1.5.1/opensnitch-1.5.1-1.x86_64.rpm
sudo wget https://github.com/evilsocket/opensnitch/releases/download/v1.5.1/opensnitch-ui-1.5.1-1.noarch.f29.rpm
sudo dnf -y localinstall opensnitch-1*.rpm; sudo dnf -y localinstall opensnitch-ui*.rpm
sudo systemctl enable --now opensnitch || exit
sudo systemctl start opensnitch || exit
cd || exit

# Opensnitch dark mode
pip3 install grpcio-tools
pip3 install unicode_slugify
#python3 -m pip install qt-material
pip3 install qt-material


# +-------------------+
# | Firefox hardening |
# +-------------------+

firefox -CreateProfile Arkenfox
cd $HOME/.mozilla/firefox
cd *.Arkenfox
wget https://raw.githubusercontent.com/arkenfox/user.js/master/updater.sh
wget https://raw.githubusercontent.com/arkenfox/user.js/master/prefsCleaner.sh
touch user-overrides.js
chmod a+x updater.sh
chmod a+x prefsCleaner.sh
# cd $HOME/.mozilla/firefox/*.Arkenfox/
./updater.sh  -s

# +--------+
# | Rclone |
# +---------+

sudo mkdir -p /mnt/rclone
sudo mkdir -p /mnt/rclone_unencrypted
sudo chown $USER:$USER /mnt/rclone
sudo chown $USER:$USER /mnt/rclone_unencrypted


# +-------------------+
# | Wireguard Config |
# +-------------------+

# 1- Download config file
# 2- Rename config file to Tokyo.conf
# 3- Move file to root/etc/wireguard
 # sudo cp $HOME/Downloads/*.conf /etc/wireguard
# 5- Activate Wireguard tunnel
 # sudo wg-quick up /etc/wireguard/Tokyo.conf
# 6- Autostart Wireguard using Systemd after reboot
 # sudo systemctl enable wg-quick@Tokyo
# 7- to switch betwween tunnels
 # wgswitch Tokyo London
 ## See wgswitch function in zsh-functions

# Firefox extensions to be installed

# https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/
# https://addons.mozilla.org/en-US/firefox/addon/i-dont-care-about-cookies/
# https://addons.mozilla.org/en-US/firefox/addon/gnome-shell-integration/
# https://addons.mozilla.org/en-US/firefox/addon/skip-redirect/
# https://addons.mozilla.org/en-US/firefox/addon/traduzir-paginas-web/
# https://addons.mozilla.org/en-US/firefox/addon/keepassxc-browser/
# https://addons.mozilla.org/en-US/firefox/addon/keepa/

# Folder for sharing content between the laptop and the mobile phone
mkdir -p "$HOME"/Documents/share_laptop_android

# Enabling Selinux enforcing
sudo sed -i 's/SELINUX=disabled/SELINUX=enforcing/' /etc/selinux/config

# sudo reboot

