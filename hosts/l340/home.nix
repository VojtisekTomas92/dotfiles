{ config, pkgs, ... }:
{

  home.username = "tomas";
  home.homeDirectory = "/home/tomas";
  home.stateVersion = "25.11";

  imports = [
    ../../modules/home/apps/firefox.nix
    ../../modules/home/apps/git.nix
    ../../modules/home/apps/keepassxc.nix
    ../../modules/home/apps/nixcord.nix
    ../../modules/home/apps/nixvim.nix
    ../../modules/home/apps/vscode.nix
    ../../modules/home/packages.nix
    ../../modules/home/plasma.nix
    ../../modules/home/terminal.nix
  ];

  programs.home-manager.enable = true;

  home.packages = with pkgs; [ nh ]; # Keep this empty to use system packages for now

  programs.nh = {
    enable = true;
    flake = "/home/tomas/dotfiles";
    homeFlake = "/home/tomas/dotfiles";
  };
}
