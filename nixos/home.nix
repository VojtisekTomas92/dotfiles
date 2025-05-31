{
  config,
  pkgs,
  ...
}: {
  home.username = "tomas";
  home.homeDirectory = "/home/tomas";

  imports = [./user-packages.nix ./user-configs/plasma.nix ./user-configs/firefox.nix ./user-configs/zsh.nix];

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
