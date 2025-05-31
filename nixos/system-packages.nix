{
  config,
  pkgs,
  ...
}: {
  services.flatpak = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    flatpak

    papirus-icon-theme

    # Gaming related
    protonup-qt
  ];

  programs.steam = {
    enable = true;
  };

  programs.gamemode = {
    enable = true;
  };

  programs.zsh.enable = true;
}
