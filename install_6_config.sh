#!/bin/zsh -xev

# Download ~/.config/autostart
cd "$HOME"/.config/autostart || exit
# Evolution.desktop is not needed as Evolution as bee installed as a Flatpak app
# sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/evolution.desktop
# Firefox .desktop is not needed as Firefox as bee installed as a Flatpak app
#sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/firefox.desktop
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/gedit.desktop
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/rclone.desktop
# standard_notes.desktop is not needed as standard_notes as bee installed as a Flatpak app
# sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/standard_notes.desktop
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/rclone_unencrypted.desktop
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/syncthing.desktop
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/dropbox.desktop
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/org.gnome.Evolution.desktop
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/org.gnome.Evolution-alarm-notify.desktop
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/org.standardnotes.standardnotes.desktop
sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/org.mozilla.Firefox.desktop
sudo wget sudo wget https://raw.githubusercontent.com/pardub/dotfiles_test/main/.config/autostart/org.keepassxc.KeePassXC.desktop
https://raw.githubusercontent.com/pardub/dotfiles/main/.config/autostart/vorta_flatpak.desktop
sudo chmod 755 org.gnome.Evolution.desktop
sudo chmod 755 org.gnome.Evolution-alarm-notify.desktop
sudo chmod 755 org.standardnotes.standardnotes.desktop
sudo chmod 755 org.mozilla.Firefox.desktop
sudo chmod 755 org.keepassxc.KeePassXC.desktop
sudo chmod 755 vorta_flatpak.desktop
cd || exit
