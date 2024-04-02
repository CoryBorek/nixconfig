{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.programs.emacs;

in {
  options.programs.emacs = {
    enable = mkEnableOption "Enable Emacs";

  };


config = mkIf cfg.enable {

  programs.emacs = {
    enable = true;
  };

  home.file.".config/emacs/init.el" = ./init.el

};
}