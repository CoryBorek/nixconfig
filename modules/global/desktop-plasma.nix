{ lib, ... }: {

  imports = [
    ./default.nix
  ];

  config.services.plasma.enable = true;
  config.display.enable = true;
}
