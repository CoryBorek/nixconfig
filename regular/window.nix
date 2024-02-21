{ config, pkgs, ... }:

services.xserver = {
  enable = true;
  windowManager.cinmamon.enable = true;
  layout = "us";

  displayManager = {
    lightdm.enable = true;
    autoLogin = {
      enable = false;
      user = "cborek";
    };
  };
};