{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.programs.starship;

in {
  options.programs.starship = {
    enable = mkEnableOption "Enable Starship";

  };


config = mkIf cfg.enable {

  programs.starship = {
    enable = true;
  };

  home.file.".config/starship.toml" = ./starship.toml

};
}