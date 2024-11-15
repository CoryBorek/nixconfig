{ lib, ... }: {

  imports = [
    ./default.nix
  ];

  config.services.cinnamon.enable = true;
  config.display.enable = true;

  config.services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "cinnamon";
  networking.firewall.allowedTCPPorts = [ 3389 ];
}
