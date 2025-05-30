{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nixd
    alejandra
  ];
  programs.vscode = {
    enable = true;
  };

  # Enable and configure Git
  programs.git = {
    enable = true;
    userName = "VojtisekTomas92";
    userEmail = "vojtisektomas92@gmail.com";
  };

  programs.nh = {
    enable = true;
    flake = "/home/tomas/dotfiles/nixos";
  };

  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
    };
  };
}
