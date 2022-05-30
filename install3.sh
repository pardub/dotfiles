#!/bin/zsh -xev

# Install pluging zsh-syntax-highlighting
sudo mkdir -p "$ZDOTDIR"/plugins || exit
cd "$ZDOTDIR"/plugins || exit
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Install pluging zsh-autosuggestions
cd "$ZDOTDIR"/plugins || exit
sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git

sudo reboot
