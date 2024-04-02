{ pkgs, lib, config, ... }:
{

  options = {
    display.enable = lib.mkEnableOption "Enable Display for Bash";

  };
  config = {

    programs.bash.bashrcExtra =
      if config.display.enable
      then "EDITOR=\"emacs\"\neval \"$(starship init bash)\"\n"
      else "EDITOR=\"emacs -nw\"\n";

    display.enable = lib.mkDefault false;
  };
}