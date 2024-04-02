{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.services.xserver;
  

in {


config = {

programs.bash.bashrcExtra = if cfg.enable
then  "
      EDITOR=\"emacs\"\n
      eval \"$(starship init bash)\"\n
"
else "EDITOR=\"emacs -nw\"\n";
};
}