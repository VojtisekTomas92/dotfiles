{
  config,
  pkgs,
  lib,
  self,
  ...
}: {
  imports = [
    ./zsh.nix
    ./plasma.nix
  ];

  home.packages = with pkgs; [
    htop
  ];

  programs.fzf = {
    enable = true;
    colors = {
    };
  };

  home.sessionVariables = {
  };

  home.stateVersion = "24.11";
}
