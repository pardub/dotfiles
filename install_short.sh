#!/bin/bash -xev

# +---------+
# | Install |
# +---------+

sudo mkdir -p "$HOME"/.config/zsh
cd || exit

# Fastest mirror and Delta RPM
sudo echo 'fastestmirror=True'             | sudo tee -a /etc/dnf/dnf.conf
sudo echo 'deltarpm=True'                  | sudo tee -a /etc/dnf/dnf.conf
sudo echo 'max_parallel_downloads=10'      | sudo tee -a /etc/dnf/dnf.conf
sudo sudo dnf clean all
sudo dnf -y update

# INSTALL JETBRAINS MONO FONTS IN ~/.local/share/fonts
sudo mkdir -p "$HOME"/.local/share/fonts/nerd-fonts
cd /tmp
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
sudo unzip /tmp/JetBrainsMono.zip -d ~/.local/share/fonts/nerd-fonts
fc-cache -f -v
cd || exit

# ADD EXTRA REPOS rpm fusion
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Shell script analysis tool
sudo dnf -y install ShellCheck

# Vim-fork
sudo dnf -y install neovim

# A simple, fast and user-friendly alternative to 'find'
sudo dnf -y install fd-find

#sudo dnf -y install visudo
#sudo dnf -y install --allowerasing vim-default-editor

# Collection of Linux utilities
sudo dnf -y install util-linux-user

sudo dnf -y install gnome-tweaks
sudo dnf -y install gnome-extensions-app
sudo dnf -y install autoconf 
sudo dnf -y install automake

# A modern replacement for ls
sudo dnf -y install exa

# save workspaces after reboot
sudo dnf -y install dconf-editor

# Rclone
sudo dnf -y install rclone

# UNINSTALL
sudo dnf -y remove totem

# +---------------+
# | Configuration |
# +---------------+

### SET UP VS CODE TO USE NEW FONTS
### RECOMMENDED SETTINGS FOR THE FONT
### Size: 13
### Line spacing: 1.2

# Add dns from https://dns.watch/
echo 'nameserver='84.200.69.80' | sudo tee -a /etc/hosts
echo 'nameserver='84.200.70.40' | sudo tee -a /etc/hosts

# CHANGE HOSTNAME
sudo hostnamectl set-hostname fedora

## Setup Visudo
echo "$USER ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo
echo "Defaults:$USER timestamp_timeout=60" | sudo EDITOR='tee -a' visudo

# DISABLING SSH
sudo systemctl stop sshd
sudo systemctl disable sshd

# Create Neovim config file
sudo mkdir -p $HOME/.config/nvim/ || exit
sudo touch init.vim $HOME/.config/nvim/ || exit

# SET UP GNOME TERMINAL
# https://ncona.com/2019/11/configuring-gnome-terminal-programmatically/
# We will need this value later, so let’s save it in a variable:

# set up minimize/maximize  window
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"

GNOME_TERMINAL_PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default | awk -F \' '{print $2}')
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font 'Monospace 10'
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font 'MesloLGS NF 10'
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font 'JetBrainsMono NF 10'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font "JetBrainsMonoMedium Nerd Font 10"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ audible-bell false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ use-theme-colors false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ background-color '#000000'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ foreground-color '#AFAFAF'
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ cursor-shape 'I-Beam'

# Install pluging zsh-syntax-highlighting
sudo mkdir -p "$ZDOTDIR"/plugins || exit
sudo cd "$ZDOTDIR"/plugins || exit
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Install pluging zsh-autosuggestions
sudo cd "$ZDOTDIR"/plugins || exit
git clone https://github.com/zsh-users/zsh-autosuggestions.git
cd || exit


