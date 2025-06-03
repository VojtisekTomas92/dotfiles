{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # No category yet
    thunderbird
    lazygit
    audacity
    protonup-qt
    obsidian
    papirus-icon-theme
    kdePackages.kate
    pciutils
    discord
    ags
    mumble
    eww
    # Dev St
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
    fd
    ripgrep
    # Fonts
    nerd-fonts.fira-code
  ];

  services.flatpak = {
    enable = true;
    packages = [
      "io.github.MakovWait.Godots"
      "com.github.tchx84.Flatseal"
    ];
  };

  services.easyeffects = {
    enable = true;

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
  };

  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
    };
  };
}
