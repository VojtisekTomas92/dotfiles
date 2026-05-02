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
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.MakovWait.Godots"
    ];
  };
}
