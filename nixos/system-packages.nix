{
  config,
  pkgs,
  ...
}:
{
  services.flatpak = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    flatpak
    papirus-icon-theme
    obsidian
    # Gaming related
    protonup-qt
    # Fonts
    nerd-fonts.fira-code
  ];

  programs.steam = {
    enable = true;
  };

  programs.gamemode = {
    enable = true;
  };

  programs.zsh.enable = true;
}
