{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.programs.bash;

in {

config = mkIf cfg.enable {

  programs.bash.bashrcExtra = ``
  if [! -z ${DISPLAY+x} ]; then

	EDITOR="emacs"
	eval "$(starship init bash)"
  else
	EDITOR="emacs -nw"
	alias emacs="emacs -nw"
  fi
``;
};
}