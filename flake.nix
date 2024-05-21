{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

#    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.tor = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
        ./hosts/tor/configuration.nix
        inputs.home-manager.nixosModules.default
      ];
    };
    
    nixosConfigurations.home-workstation = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};
      modules = [
	./hosts/home-workstation/configuration.nix
	inputs.home-manager.nixosModules.default
      ];
    };
  };
}
