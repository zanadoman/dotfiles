#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

sudo cp -r "$SCRIPT_DIR/system/." /
mkdir -p "$HOME"/{Desktop,Documents,Downloads,Music,Pictures,Projects,Public,Repos,Templates,Videos}

sudo pacman -Syu --needed --noconfirm git base-devel
rm -rf "$HOME/Repos/yay-bin"
git clone https://aur.archlinux.org/yay-bin.git "$HOME/Repos/yay-bin"
(cd "$HOME/Repos/yay-bin" && makepkg -si --noconfirm)
xargs yay -S --needed --noconfirm < "$SCRIPT_DIR/pkgs.txt"
pacman -Qdtq | sudo pacman -Rns - || true
pacman -Qq > "$SCRIPT_DIR/pkgs.lock"

cp -r "$SCRIPT_DIR/user/." "$HOME"
git config --global user.signingkey "$HOME/.ssh/id_ed25519"
chsh -s "$(command -v fish)"
