{pkgs, ...}:

{

  home.homeDirectory = "/home/tomas";
  home.stateVersion = "24.05";
  home.username = "tomas";

  home.packages = [pkgs.alejandra pkgs.nixd, pkgs.cowsay];

  programs = {
    home-manager = {
      enable = true;
    };

    git = {
      enable = true;
      userName = "Tomas";
      userEmail = "vojtisektomas92@gmail.com";
    };

    zsh = {
      enable = true;
    };
  };

}