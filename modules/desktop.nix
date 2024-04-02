{ pkgs, lib, config, ... }: {

  imports = [
    ./default.nix
  ];

  programs.emacs.enable = true;
  programs.kitty.enable = true;
  programs.starship.enable = true;
  config.display.enable = true;
}