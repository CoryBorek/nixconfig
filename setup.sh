#!/usr/bin/env bash

echo "Setting up Hardware Configuration from default."
rm ./nixos/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix ./nixos/

sudo nixos-rebuild switch --flake .#nixos-term
