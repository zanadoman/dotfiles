#!/usr/bin/env bash

set -eou pipefail
sudo cp -r etc/. /etc
cat pacman.txt | sudo pacman -Syu -
git clone https://aur.archlinux.org/yay ~/.yay
cd ~/.yay
makepkg -is
cd -
cat aur.txt | yay -Syu -
stow -t ~ --no-folding -R --adopt claude i3 php shell x11
git restore .
sudo -u postgres initdb -D /var/lib/postgres/data
sudo systemctl start postgresql.service
sudo -u postgres createuser --interactive
mkdir -p ~/Desktop
mkdir -p ~/Documents
mkdir -p ~/Downloads
mkdir -p ~/Music
mkdir -p ~/Pictures
mkdir -p ~/Projects
mkdir -p ~/Public
mkdir -p ~/Repos
mkdir -p ~/Templates
mkdir -p ~/Videos
