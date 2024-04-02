{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.programs.emacs;

in {


config = mkIf cfg.enable {

  home.file.".config/emacs/init.el" = ./init.el;

};
}