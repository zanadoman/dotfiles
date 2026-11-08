#!/usr/bin/env bash
set -euo pipefail
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

while IFS= read -r package; do
    printf 'n\n' | sudo pacman -Rns $package
done < "$SCRIPT_DIR/pkgs.txt" 2>&1 | grep -Po ':: removing \K[^ ]+'
