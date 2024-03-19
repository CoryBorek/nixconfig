{ lib, ... }: {

  imports = [

    ./views/cinnamon.nix
  ];

  config.services.cinnamon.enable = true;
}