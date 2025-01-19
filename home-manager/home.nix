{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./stylix.nix
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
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
  };

  services.activitywatch = {
    enable = true;
    package = pkgs.aw-server-rust;
  };

  programs.home-manager.enable = true;
}
