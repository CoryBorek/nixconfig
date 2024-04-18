#!/bin/sh
sudo nix-collect-garbage -d
sudo nix-env --delete-generations
sudo /run/current-system/bin/switch-to-configuration boot
sudo nixos-rebuild boot
sudo nix-store --optimise
