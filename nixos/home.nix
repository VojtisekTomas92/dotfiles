{
  config,
  pkgs,
  ...
}: {
  home.username = "tomas";
  home.homeDirectory = "/home/tomas";

  imports = [./user-packages.nix ./plasma.nix ./firefox.nix ./zsh.nix];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
