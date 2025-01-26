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
      distrobox
      browsh
      direnv
      # for neovim
      luajitPackages.luarocks_bootstrap
      lua
      ripgrep-all
      xclip
      # Filesystems support (maybe some of these are preinstalled?)
      dosfstools
      jfsutils
      btrfs-progs
      exfatprogs
      ntfs3g
      xfsprogs
      # Dev Stuff
      cmake
      autokey #
      ## Godot
      gdtoolkit_4
      # Systemutilities
      lshw
      bleachbit
      tdrop
    ]
    ++ (with kdePackages; [
      # KDE-specific packages
      kruler
      dolphin-plugins
      partitionmanager
      kget
      kcalc
      kolourpaint
      kompare
      kcharselect
      kde-rounded-corners
      kdiskmark
      kbackup
      konsave
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

  # Install firefox.
  programs.firefox.enable = true;
}
