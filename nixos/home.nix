{
  config,
  pkgs,
  ...
}: {
  programs.zsh.enable = true;

  home.packages = with pkgs; [
    htop
  ];

  home.sessionVariables = {
  };

  home.stateVersion = "24.11";
}
