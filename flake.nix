{
  description = "Cory's Nix Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = github:nix-community/home-manager/release-23.11;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
  in
  {
    nixosConfigurations = {
      nixos-desktop = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [
	  ./nixos/configuration.nix
  	  ./hosts/regular/configuration.nix
	  ./modules/global/desktop.nix
	  home-manager.nixosModules.home-manager
	  {
            home-manager = {
              useUserPackages = true;
	      useGlobalPkgs = true;
	      users.cborek = ./hosts/regular/home-manager/cory.nix;
            };
          }
	];
      };
      nixos-term = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [
          ./nixos/configuration.nix
          ./hosts/term/configuration.nix
	  ./modules/global/default.nix
	  home-manager.nixosModules.home-manager
	  {
            home-manager = {
              useUserPackages = true;
	      useGlobalPkgs = true;
	      users.cborek = ./hosts/term/home-manager/cory.nix;
            };
          }
        ];
      };
    };
  };
}
