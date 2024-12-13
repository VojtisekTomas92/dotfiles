{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    colors = {
    };
  };

  home.file.".zshrc".source = ../../.zshrc;
}
