{ pkgs, config, lib, ... }:
with lib;

in {

  options = {
    config.display.enable = mkEnableOption "Enables Display"
  };
  imports = [
    ./views/cinnamon.nix
  ];

  config = {
    servives.cinnamon.enable = mkDefault false;
    display.enable = mkDefault false;
  };
}