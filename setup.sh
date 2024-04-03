#!/usr/bin/env bash



echo "Setting up Hardware Configuration from default."


FLAKE=$1

if [ $# -eq 0 ]
then
    FLAKE=nixos-term
fi
if [ ! -f ~/.gitconfig ]
then
    git config --global user.name "NixOS user"
    git config --global user.email "user@example.com"
fi
git checkout -B build
#rm ./nixos/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix ./nixos/

#rm ./nixos/config-boot.nix
if [ -e /boot/EFI ]
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

sudo nixos-rebuild switch --flake .#$FLAKE
