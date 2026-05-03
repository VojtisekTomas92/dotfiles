{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nixd
    nixfmt
    codegrab
    wl-clipboard
    git-crypt
    sops
    age
    pwgen
    obsidian
    uv
    devenv
    # Fonts
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.MakovWait.Godots"
    ];
  };
}
