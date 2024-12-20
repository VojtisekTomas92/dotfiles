{
  pkgs,
  inputs,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
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
      discord
      ksystemlog
      nix-output-monitor
      nh
      obsidian
      kitty
      wofi
      wl-clipboard
      python3
      ags
      nodejs
      jq
      aseprite
      vesktop
      obs-studio
      appimage-run
      # Shadowpc dependencies?
      fuse
      fuse3
      nss

      libva
      libva-utils
      libinput
      glib
      (callPackage ./packages/shadow-pc.nix {})

      (vivaldi.overrideAttrs
        (oldAttrs: {
          proprietaryCodecs = true;
          enableWidevine = true;
          dontWrapQtApps = false;
          dontPatchELF = true;
          nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
        }))
    ]
    ++ (with pkgs.xorg; [
      libX11
      libXcursor
      libXrandr
      libXfixes
      libXext
      libXcomposite
      libXdamage
      libxcb
      libXrender
      libXi
      libXdmcp
      libXau
    ]);

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
