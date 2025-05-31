{
  config,
  pkgs,
  ...
}: {
  home.username = "tomas";
  home.homeDirectory = "/home/tomas";

  imports = [
    ./user-packages.nix
    ./user-configs/plasma.nix
    ./user-configs/firefox.nix
    ./user-configs/zsh.nix
    ./user-configs/activitywatch.nix
    ./user-configs/keepassxc.nix
    ./user-configs/eza.nix
  ];

  #neovim

  programs.neovim = {
    enable = true;
    extraLuaConfig = ''
      package.path = "/home/tomas/dotfiles/neovim/lua/?.lua;" ..
                      package.path

      require("init")
    '';
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    themeFile = "OneDark-Pro";
    font = {
      name = "Fira Code";
    };
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "25.11";
}
