{ lib, ... }: {

  imports = [
    ./editor/emacs.nix
    ./term/bash.nix
    ./term/kitty.nix
    ./term/starship.nix
  ];
  config = {
    programs.bash.enable = lib.mkDefault true;
    programs.emacs.enable = lib.mkDefault true;
    programs.kitty.enable = lib.mkDefault false;
    programs.starship.enable = lib.mkDefault false;
  };
}
