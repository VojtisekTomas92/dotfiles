{
  config,
  pkgs,
  lib,
  self,
  inputs,
  ...
}: {
  imports = [
    ./shell.nix
    ./plasma.nix
    ./neovim.nix
    ./hyprland.nix
  ];

  home.packages = with pkgs; [
    syncthingtray
    htop
  ];

  home.keyboard.layout = "de";

  programs.waybar = {
    enable = true;
  };

  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
    };
  };

  home.sessionVariables = {
  };

  home.stateVersion = "24.11";
}
