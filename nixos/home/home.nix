{
  config,
  pkgs,
  lib,
  self,
  ...
}: {
  imports = [
    ./shell.nix
    ./plasma.nix
    ./neovim.nix
  ];

  home.packages = with pkgs; [
    syncthingtray
    htop
  ];

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
