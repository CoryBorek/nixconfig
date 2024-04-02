#!/bin/bash

echo "Setting up Hardware Configuration from default."
rm ./nixos/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix .nixconfig/nixos/

sudo nixos-rebuild switch --flake .#nixos-term
