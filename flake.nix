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
      regular = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [
          ./regular/nixos/configuration.nix
	  home-manager.nixosModules.home-manager
	  {
            home-manager = {
              useUserPackages = true;
	      useGlobalPkgs = true;
	      users.cborek = ./regular/home-manager/cory.nix;
            };
          }
        ];
      };
      default = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [
          ./default/configuration.nix
        ];
      };
      term = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [
          ./term/nixos/configuration.nix
	  home-manager.nixosModules.home-manager
	  {
            home-manager = {
              useUserPackages = true;
	      useGlobalPkgs = true;
	      users.cborek = ./term/home-manager/cory.nix;
            };
          }
        ];
      };
    };
  };
}
