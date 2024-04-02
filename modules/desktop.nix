{ lib, ... }: {

  imports = [
    ./editor/emacs.nix
    ./term/kitty.nix
    ./term/starship.nix
    ./views/cinnamon.nix
  ];

  programs.emacs.enable = lib.mkDefault true;
  programs.kitty.enable = lib.mkDefault true;
  programs.starship.enable = lib.mkDefault true;
}