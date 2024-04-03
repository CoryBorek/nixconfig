#!/usr/bin/env bash



echo "Setting up Hardware Configuration from default."


USERNAME=git config --global user.name
EMAIL=git config --global user.email
NUSER="NixOS User"
NEMAIL="user@example.com"

[[ "$($USERNAME)" =~ $NUSER ]] && $USERNAME $NUSER
[[ "$($EMAIL)" =~ $NEMAIL ]] && $EMAIL $NEMAIL

git checkout -B build
#rm ./nixos/hardware-configuration.nix
cp /etc/nixos/hardware-configuration.nix ./nixos/

#rm ./nixos/config-boot.nix
if [ -f /boot/EFI ]
   the
   n
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

sudo nixos-rebuild switch --flake .#$1
