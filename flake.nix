{
  description = "My Nix Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = github:nix-community/home-manager;
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
	      users.cory = ./regular/home-manager/cory.nix;
            };
          }
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
	      users.cory = ./term/home-manager/cory.nix;
            };
          }
        ];
      };
    };
  };
}
