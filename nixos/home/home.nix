{
  config,
  pkgs,
  stylix,
  ...
}: {
  imports = [
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    htop
  ];

  stylix.autoEnable = true;

  home.sessionVariables = {
  };

  home.stateVersion = "24.11";
}
