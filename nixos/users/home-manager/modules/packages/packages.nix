{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # No category yet
    thunderbird
    lazygit
    audacity

    # Dev Stuff
    ## Language package managers
    luarocks
    ## Language Servers
    nixd # Nix
    lua-language-server
    ## Formatters
    alejandra # Nix
    nixfmt-rfc-style # Nix
    stylua # Lua
    # System utils
    tlrc
    curl
    # Neovim seems to want it
    ripgrep
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.MakovWait.Godots"
      "com.github.tchx84.Flatseal"
    ];
  };

  programs.vscode = {
    enable = true;
  };

  # Enable and configure Git
  programs.git = {
    enable = true;
    userName = "VojtisekTomas92";
    userEmail = "vojtisektomas92@gmail.com";
  };

  programs.nh = {
    enable = true;
    flake = "/home/tomas/dotfiles/nixos";
  };

  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
    };
  };
}
