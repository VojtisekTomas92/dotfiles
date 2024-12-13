{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      nrebuild = "sudo nixos-rebuild switch --flake /home/tomas/dotfiles/";
    };

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };

    zplug = {
      enable = true;
      plugins = [
        {name = "Aloxaf/fzf-tab";}
      ];
    };
  };
  home.packages = [pkgs.zsh];
}
