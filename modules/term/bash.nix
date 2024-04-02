{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.programs.bash;

in {

config = mkIf cfg.enable {

  programs.bash.bashrcExtra = "
  if [! -z ${DISPLAY+x} ]; then\n
      EDITOR=\"emacs\"\n
      eval \"$(starship init bash)\"\n
  else\n
	EDITOR=\"emacs -nw\"\n
	alias emacs=\"emacs -nw\"\n
  fi\n
";
};
}