{ pkgs, lib, config, ... }:
{
  config = {

    programs.bash.bashrcExtra =
      if config.display.enable
      then "EDITOR=\"emacs\"\neval \"$(starship init bash)\"\n"
      else "EDITOR=\"emacs -nw\"\n";
  };
}