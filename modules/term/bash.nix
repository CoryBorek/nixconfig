{ pkgs, lib, config, ... }:
{

  options = {
    display.enable = lib.mkEnableOption "enables display for bash";
  };
  
  config = {

    programs.bash.bashrcExtra =
      if config.display.enable
      then "EDITOR=\"emacs\"\neval \"$(starship init bash)\"\n"
      else "EDITOR=\"emacs -nw\"\n";
  };
}