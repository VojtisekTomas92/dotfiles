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
    htop
  ];

  home.sessionVariables = {
  };

  home.stateVersion = "24.11";
}
