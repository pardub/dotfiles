#!/bin/bash -xev

# +---------+
# | Install |
# +---------+

# Fastest mirror and Delta RPM
sudo echo 'fastestmirror=True'             | sudo tee -a /etc/dnf/dnf.conf
sudo echo 'deltarpm=True'                  | sudo tee -a /etc/dnf/dnf.conf
sudo echo 'max_parallel_downloads=10'      | sudo tee -a /etc/dnf/dnf.conf
sudo sudo dnf clean all
sudo dnf -y update

# INSTALL JETBRAINS MONO FONTS IN ~/.local/share/fonts
mkdir -p "$HOME"/.local/share/fonts/nerd-fonts
cd "$HOME"/.local/share/fonts || exit
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -v
cd || exit

# ADD EXTRA REPOS rpm fusion
sudo dnf -y install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Dotfiles management tool "chezmoi"
sh -c "$(curl -fsLS chezmoi.io/get)"

# Man page with colors
sudo dnf -y install most

# Backup system
sudo dnf -y install timeshift

# Shell script analysis tool
sudo dnf -y install ShellCheck

# distributed version control system
sudo dnf -y install git

# Vim-fork
sudo dnf -y install neovim

# A simple, fast and user-friendly alternative to 'find'
sudo dnf -y install fd-find

#sudo dnf -y install visudo
#sudo dnf -y install --allowerasing vim-default-editor

# Collection of Linux utilities
sudo dnf -y install util-linux-user

# Zsh
sudo dnf -y install zsh

sudo dnf -y install gnome-tweaks
sudo dnf -y install gnome-extensions-app
sudo dnf -y install autoconf 
sudo dnf -y install automake


# A modern replacement for ls
sudo dnf -y install exa


# save workspaces after reboot
sudo dnf -y install dconf-editor


# UNINSTALL
sudo dnf -y remove totem

# CODECS
sudo dnf -y install x264
sudo dnf -y groupupdate Multimedia
sudo dnf -y install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf -y install lame\* --exclude=lame-devel
sudo dnf -y group upgrade --with-optional Multimedia

# Install pluging zsh-syntax-highlighting
#sudo mkdir -p /usr/share/zsh/plugins
#sudo cd /usr/share/zsh/plugins/
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
# sudo echo "# Load zsh-syntax-highlighting; should be last." >> $ZDOTDIR/.zshrc
#sudo echo '# Load zsh-syntax-highlighting; should be last.'   | sudo tee -a  $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null" | sudo tee -a  $ZDOTDIR/.zshrc

# Install pluging zsh-syntax-highlighting
sudo mkdir -p "$ZDOTDIR"/plugins || exit
sudo cd "$ZDOTDIR"/plugins || exit
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Install pluging zsh-autosuggestions
#sudo cd /usr/share/zsh/plugins/ || exit
#git clone https://github.com/zsh-users/zsh-autosuggestions.git
#sudo echo "# Load zsh-autosuggestions; should be last." >> $ZDOTDIR/.zshrc
#sudo echo "# Load zsh-syntax-autosuggestions; should be last." | sudo tee -a  $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc
#sudo echo "source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null" | sudo tee -a  $ZDOTDIR/.zshrc

# Install pluging zsh-autosuggestions
sudo cd "$ZDOTDIR"/plugins || exit
git clone https://github.com/zsh-users/zsh-autosuggestions.git
cd || exit

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
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ font 'JetBrainsMonoMedium Nerd Font 10'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ audible-bell false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ use-theme-colors false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ background-color '#000000'
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ foreground-color '#AFAFAF'
#gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:"$GNOME_TERMINAL_PROFILE"/ cursor-shape 'I-Beam'

# zsh default shell
# sudo chsh -s /bin/zsh marc ## replaced by the command below
sudo chsh -s $(which zsh) $USER
cd $HOME
if [ -e "$HOME"/.zshenv ]
then rm "$HOME"/.zshenv
fi

# Download .zshenv
cd "$HOME"/.config/zsh || exit
curl -LJO https://raw.githubusercontent.com/pardub/dotfiles_test/main/.zshenv

# Download .zshrc
mkdir -p "$HOME"/.config/zsh || exit
cd "$HOME"/.config/zsh || exit
curl -LJO https://raw.githubusercontent.com/pardub/dotfiles_test/main/.zshrc

# Download .aliases
cd "$HOME"/.config/zsh || exit
curl -LJO https://raw.githubusercontent.com/pardub/dotfiles_test/main/.aliases

# Downlaod zsh-functions
cd "$HOME"/.config/zsh || exit
curl -LJO https://raw.githubusercontent.com/pardub/dotfiles_test/main/zsh-functions
