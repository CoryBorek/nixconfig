{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.services.xserver;
  

in {


config = if cfg.enable
then {

  programs.bash.bashrcExtra = "
      EDITOR=\"emacs\"\n
      eval \"$(starship init bash)\"\n
";
}
else {
 programs.bash.bashrcExtra = "
    EDITOR=\"emacs -nw\"\n
    ";

};

}