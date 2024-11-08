{ lib, config, pkgs, ... }:
with lib;
let

  cfg = config.services.plasma;
in {

  options.services.plasma = {

   enable = mkEnableOption "KDE Plasma Desktop Environment";
  };
config = mkIf cfg.enable {


services = {
 xserver = {
  enable = true;
  xkb.layout = "us";
 };
 displayManager.sddm = {
  enable = true;
  wayland.enable = true;
 };
 desktopManager.plasma6.enable = true;

};
};
}
