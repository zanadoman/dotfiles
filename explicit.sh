#!/bin/bash

cat pacman.txt | while read package; do
    echo -e n\n | sudo pacman -Rns $package
done 2>&1 | grep -Po ':: removing \K[^ ]+'
