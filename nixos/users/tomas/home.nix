{
  home.username = "tomas";
  home.homeDirectory = "/home/tomas";

  imports = [
    ../home-manager/modules/packages/plasma.nix
    ../home-manager/modules/packages/firefox.nix
    ../home-manager/modules/packages/zsh.nix
    ../home-manager/modules/packages/activitywatch.nix
    ../home-manager/modules/packages/keepassxc.nix
    ../home-manager/modules/packages/eza.nix
    ../home-manager/modules/packages/starship.nix
    ../home-manager/modules/packages.nix
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
