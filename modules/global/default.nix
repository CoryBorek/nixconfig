{ pkgs, config, lib, ... }:
with lib;
{

  options = {
    display.enable = mkEnableOption "Enables Display";
  };
  imports = [
    ./views/cinnamon.nix
    ./views/plasma.nix
  ];

  config = {
    services.plasma.enable = mkDefault false;
    services.cinnamon.enable = mkDefault false;
    display.enable = mkDefault false;
    virtualisation.docker.enable = mkDefault true;
  };
}
