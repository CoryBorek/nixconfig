{ lib, config, pkgs, ... }:
with lib;
let

  cfg = config.services.cinnamon;
in {

  options.services.cfg = {

   enable = mkEnableOption "Cinnamon Desktop Environment";
  };
config = mkIf cfg.enable {


services.xserver = {
  enable = true;
  layout = "us";
  displayManager = {
    lightdm.enable = true;
  };
  desktopManager.cinnamon.enable = true;
};
};
}