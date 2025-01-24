{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./plasma-manager.nix
  ];
  home.username = "tomas";
  home.homeDirectory = "/home/tomas";
  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.packages = [
    pkgs.aw-server-rust
  ];

  home.file = {
  };

  home.sessionVariables = {
    FLAKE = "/home/tomas/dotfiles";
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  services.activitywatch = {
    enable = true;
    package = pkgs.aw-server-rust;
  };

  services.nextcloud-client = {
    enable = true;
    startInBackground = true;
  };
  services.syncthing = {
    enable = true;
  };
  programs.home-manager.enable = true;
}
