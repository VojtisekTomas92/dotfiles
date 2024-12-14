{
  pkgs,
  inputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    lshw
    git
    pciutils
    keepassxc
    firefox
    vscode
    nixd
    alejandra
    base16-schemes
    flatpak
    discord-canary
    ksystemlog
    nix-output-monitor
    nh
    obsidian

wl-clipboard
    (vivaldi.overrideAttrs
      (oldAttrs: {
        proprietaryCodecs = true;
        enableWidevine = true;
        dontWrapQtApps = false;
        dontPatchELF = true;
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
      }))
  ];

  fonts = {
    packages = with pkgs; [
      nerd-fonts.hasklug
      nerd-fonts.fira-code
      nerd-fonts.fira-mono
    ];
  };

  services.flatpak.packages = [
    "io.github.MakovWait.Godots"
    "im.nheko.Nheko"
  ];
}
