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
  ];

  home.packages = with pkgs; [
    htop
  ];

  home.sessionVariables = {
  };

  home.stateVersion = "24.11";
}
