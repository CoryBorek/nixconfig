{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.programs.starship;

in {

config = mkIf cfg.enable {

  home.file.".config/starship.toml" = ./starship.toml;
  

};
}