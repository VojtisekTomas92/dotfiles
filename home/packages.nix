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
    rssguard

    # Fonts
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    # Gaming
    faugus-launcher
    # creative
    pixelorama
    aseprite
    tiled
    ldtk
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.MakovWait.Godots"
      "uk.co.powdertoy.tpt"
      "io.github.flattool.Warehouse"
    ];
  };
}
