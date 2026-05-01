{
  description = "NixOS and Home Manager Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    nixcord.url = "github:FlameFlag/nixcord";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    sops-nix.url = "github:Mic92/sops-nix";
    sops-nix.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-vscode-extensions,
      nixcord,
      nix-flatpak,
      sops-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [
          inputs.nix-vscode-extensions.overlays.default
        ];
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./system/configuration.nix
          sops-nix.nixosModules.sops
        ];
      };

      homeConfigurations."tomas" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home/home.nix
          inputs.nixcord.homeModules.nixcord
          nix-flatpak.homeManagerModules.nix-flatpak
        ];
      };
    };
}
