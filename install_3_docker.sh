#!/bin/zsh -xev

sudo dnf -y remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo systemctl start docker
sudo systemctl enable docker

# Docker-compose install
sudo dnf -y install docker-compose

# Add USER to docker group
sudo usermod -aG docker ${USER}

# To activate Docker completion
sudo mv /usr/share/zsh/vendor-completions/_docker /usr/share/zsh/site-functions

# Delete .zcompdump
rm -f "$HOME"/.config/zsh/.zcompdump


