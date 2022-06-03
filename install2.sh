#!/bin/bash -xev

# Zsh
sudo dnf -y install zsh

# zsh default shell
# sudo chsh -s /bin/zsh marc ## replaced by the command below
sudo chsh -s $(which zsh) $USER
cd $HOME
if [ -e "$HOME"/.zshenv ]
then rm "$HOME"/.zshenv
fi

if [ ! -e "$HOME"/.cache/zsh/history ]
then 
mkdir -p "$HOME"/.cache/zsh || exit
touch"$HOME"/.cache/zsh/history
fi

# Download .zshenv
cd "$HOME" || exit
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.zshenv

# Download .zshrc
cd "$HOME"/.config/zsh || exit
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.zshrc

# Download .aliases
cd "$HOME"/.config/zsh || exit
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.aliases

# Downlaod zsh-functions
cd "$HOME"/.config/zsh || exit
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/zsh-functions

# Downlaod init.viv
cd "$HOME"/.config/nvim || exit
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/init.vim

sudo reboot
