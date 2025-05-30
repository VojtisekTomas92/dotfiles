{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    nixd
    alejandra
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.MakovWait.Godots"
      "com.github.tchx84.Flatseal"
    ];
  };

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
