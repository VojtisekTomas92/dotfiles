{ config, pkgs, ... }:
{

  home.username = "tomas";
  home.homeDirectory = "/home/tomas";
  home.stateVersion = "25.11";

  imports = [
    ./vscode.nix
    ./packages.nix
    ./nixcord.nix
    ./firefox.nix
    ./git.nix
    ./keepassxc.nix
    ./plasma.nix
    ./zsh.nix
    ./nixvim.nix
  ];

  programs.home-manager.enable = true;

  home.packages = with pkgs; [ nh ]; # Keep this empty to use system packages for now

  programs.nh = {
    enable = true;
    flake = "/home/tomas/dotfiles";
    homeFlake = "/home/tomas/dotfiles";
  };
}
