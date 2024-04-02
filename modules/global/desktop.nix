{ lib, ... }: {

  imports = [
    ./views/cinnamon.nix
  ];

  services.cinnamon.enable = true;
}