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

  programs.fzf = {
    enable = true;
    colors = {
    };
  };

  home.sessionVariables = {
  };

  home.stateVersion = "24.11";
}
