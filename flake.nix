{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.5.1";
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nix-flatpak,
    plasma-manager,
    hyprland,
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
          ./nixos/system/distrobox.nix
          ./nixos/system/nvidia.nix
          home-manager.nixosModules.home-manager
          nix-flatpak.nixosModules.nix-flatpak
          {
            home-manager.backupFileExtension = "backup";
            home-manager.sharedModules = [plasma-manager.homeManagerModules.plasma-manager];
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.tomas = import ./nixos/home/home.nix;
          }
        ];
      };
    };
  };
}
