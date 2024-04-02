{ lib, ... }: {

  imports = [
    ./views/cinnamon.nix
  ];

  config.services.cinnamon.enable = lib.mkDefault false;
}