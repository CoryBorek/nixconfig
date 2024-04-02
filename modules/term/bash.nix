{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.programs.bash;

in {

config = mkIf cfg.enable {


  home.file.".bashrc" = ./bashrc.bash;

};
}