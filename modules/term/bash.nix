{ pkgs, lib, config, ... }:
with lib;

in {

config = {

programs.bash.bashrcExtra = if config.display.enable
then  "
      EDITOR=\"emacs\"\n
      eval \"$(starship init bash)\"\n
"
else "EDITOR=\"emacs -nw\"\n";
};
}