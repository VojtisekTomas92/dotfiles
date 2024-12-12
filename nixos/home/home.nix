{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    htop
  ];

  home.sessionVariables = {
  };

  home.stateVersion = "24.11";
}
