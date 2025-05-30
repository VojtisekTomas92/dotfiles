{ config, pkgs, ... }:

{
  home.username = "tomas";
  home.homeDirectory = "/home/tomas";

  # Packages installed for this user only
  home.packages = with pkgs; [
   ];

   # Enable and configure Git
  programs.git = {
    enable = true;
    userName = "VojtisekTomas92";
    userEmail = "vojtisektomas92@gmail.com";
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}