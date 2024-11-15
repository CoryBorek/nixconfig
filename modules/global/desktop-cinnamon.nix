{ lib, ... }: {

  imports = [
    ./default.nix
  ];

  config.services.cinnamon.enable = true;
  config.display.enable = true;

  config.services.xrdp.enable = true;
  config.services.xrdp.defaultWindowManager = "cinnamon";
  config.networking.firewall.allowedTCPPorts = [ 3389 ];
}
