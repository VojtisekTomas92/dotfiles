{
  pkgs,
  config,
  ...
}:
{

  home.packages = with pkgs; [
    zsh
  ];

  home.file.".zshrc" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/resources/configs/.zshrc";
  };

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      theme = "One Double Dark";
      font-family = "FiraMono Nerd Font Regular";
      font-family-bold = "FiraMono Nerd Font Bold";
    };
  };

  programs.bat = {
    enable = true;
  };
}
