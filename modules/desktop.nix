{ pkgs, lib, config, ... }: {

  imports = [
    ./default.nix
  ];

  programs.emacs.enable = true;
  programs.kitty.enable = true;
  programs.starship.enable = true;
  display.enable = true;
}