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
    git
  ];

  programs.steam = {
    enable = true;
  };

  programs.gamemode = {
    enable = true;
  };

  programs.zsh.enable = true;
}
