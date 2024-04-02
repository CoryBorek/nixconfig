{ lib, ... }: {

  imports = [
    ./default.nix
  ];

  config.services.cinnamon.enable = true;
  config.display.enable = true;
}