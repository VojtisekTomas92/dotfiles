{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      # Replace 'hostname' with your actual system hostname
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./nixos/system/system.nix
          ./nixos/system/packages.nix
          ./nixos/system/nvidia.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useUserPackages = true;
            home-manager.users.tomas = import ./nixos/home/home.nix;
          }
        ];
      };
    };
  };
}
