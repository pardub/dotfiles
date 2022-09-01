#!/bin/bash -xev

# +---------+
# | Install |
# +---------+

# Setup Visudo
echo "$USER ALL=(ALL:ALL) ALL" | sudo EDITOR='tee -a' visudo
echo "Defaults:$USER timestamp_timeout=60" | sudo EDITOR='tee -a' visudo


mkdir -p "$HOME"/.config/zsh
cd || exit
# Fastest mirror and Delta RPM
sudo echo 'fastestmirror=True'             | sudo tee -a /etc/dnf/dnf.conf
sudo echo 'deltarpm=True'                  | sudo tee -a /etc/dnf/dnf.conf
sudo echo 'max_parallel_downloads=10'      | sudo tee -a /etc/dnf/dnf.conf
sudo sudo dnf clean all
sudo dnf -y update

# sudo reboot
