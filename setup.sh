#!/usr/bin/env bash

echo "Setting up Hardware Configuration from default."
git config --global user.name "NixOS User"
git config --global user.email "user@example.com"

git checkout -B build
#rm ./nixos/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix ./nixos/

#rm ./nixos/config-boot.nix
if [ -f /boot/EFI ]
then
    if [ -f /boot/grub/grub.cfg ]
    then
	cp ./nixos/config-grub.nix ./nixos/config-boot.nix
    else
	cp ./nixos/config-efi.nix ./nixos/config-boot.nix
    fi
else
    cp ./nixos/config-vm.nix ./nixos/config-boot.nix
fi

git add -A
git commit -m "build"

sudo nixos-rebuild switch --flake .#nixos-term
