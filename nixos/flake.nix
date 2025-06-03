{
  description = "My try at a NixOs config :D";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    plasma-manager.url = "github:nix-community/plasma-manager";
    plasma-manager.inputs.nixpkgs.follows = "nixpkgs";
    plasma-manager.inputs.home-manager.follows = "home-manager";
    hyprland.url = "github:hyprwm/Hyprland";
    ags.url = "github:aylur/ags";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-flatpak,
      plasma-manager,
      hyprland,
      ags,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        L340 = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = {
            inherit inputs;
          };

          modules = [
            ./machines/L340/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "BACK";
              home-manager.users.tomas = {
                imports = [
                  nix-flatpak.homeManagerModules.nix-flatpak
                  plasma-manager.homeManagerModules.plasma-manager
                  ./users/tomas/home.nix
                ];
              };
            }
          ];
        };
      };
    };
}
