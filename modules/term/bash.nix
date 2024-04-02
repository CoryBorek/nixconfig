{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.programs.bash;

in {
  options.programs.bash = {
    enable = mkEnableOption "Enable Bash";

  };


config = mkIf cfg.enable {

  programs.bash = {
    enable = true;
  };

  home.file.".bashrc" = ./bashrc

};
}