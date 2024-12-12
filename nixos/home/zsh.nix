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
  };
  home.packages = [pkgs.zsh];
}
