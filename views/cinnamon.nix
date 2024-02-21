{ config, pkgs, ... }:

{

services.xserver = {
  enable = true;
  layout = "us";
  displayManager = {
    lightdm.enable = true;
  };
  desktopManager.cinnamon.enable = true;
};
}