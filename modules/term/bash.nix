{ pkgs, lib, config, ... }:
{

  options = {
    display.enable = lib.mkEnableOption "Enable Display for Bash";

  };
  config = {

    programs.bash.bashrcExtra = "EDITOR=\"emacs -nw\"\n";

    display.enable = lib.mkDefault false;
  };
}
