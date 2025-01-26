{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    stylix.url = "github:danth/stylix";
    kwin-effects-forceblur = {
      url = "github:taj-ny/kwin-effects-forceblur";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    stylix,
    nix-flatpak,
    kwin-effects-forceblur,
    nix-index-database,
    ...
  }: let
    pkgs = nixpkgs.legacyPackages.${inputs.nixpkgs.system};
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixOS/configuration.nix
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          nix-flatpak.nixosModules.nix-flatpak
          nix-index-database.nixosModules.nix-index
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.tomas = import ./home-manager/home.nix;
            home-manager.backupFileExtension = "hm-BACK";
            environment.systemPackages = with pkgs; [
              # Use kwin-effects-forceblur directly from pkgs
              kwin-effects-forceblur
            ];
          }
        ];
      };
    };
  };
}
