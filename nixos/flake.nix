{
  description = "A simple NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    plasma-manager,
    chaotic,
    nixvim,
    ...
  } @ inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        chaotic.nixosModules.default
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.backupFileExtension = "BACK";
          home-manager.users.tomas = {
            imports = [
              inputs.nixvim.homeModules.nixvim
              nix-flatpak.homeManagerModules.nix-flatpak
              inputs.plasma-manager.homeManagerModules.plasma-manager
              ./home.nix
            ];
          };
        }
        ./system-packages.nix
        ./configuration.nix
      ];
    };
  };
}
