{ pkgs, config, lib, ... }:
with lib;
{

  options = {
    display.enable = mkEnableOption "Enables Display";
  };
  imports = [
    ./views/cinnamon.nix
  ];

  config = {
    services.cinnamon.enable = mkDefault false;
    display.enable = mkDefault false;
  };
}