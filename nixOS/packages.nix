{
  config,
  pkgs,
  ...
}: {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
    [
      #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      #  wget
      discord
      git
      vscode
      home-manager
      nixd
      alejandra
      # Vivaldi needs some workaround for plasma 6
      (vivaldi.overrideAttrs
        (oldAttrs: {
          dontWrapQtApps = false;
          dontPatchELF = true;
          nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
        }))
      keepassxc
      nvd
      nix-output-monitor
      nh
      aseprite
      nix-ld
      obsidian
    ]
    ++ (with kdePackages; [
      # KDE-specific packages
      kruler
    ]);

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.MakovWait.Godots"
      "io.github.flattool.Warehouse"
      "com.github.tchx84.Flatseal"
    ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };
}
