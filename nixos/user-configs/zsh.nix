{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
    };
    syntaxHighlighting.enable = true;

    shellAliases = {
      lla = "ls -la";
      nhs = "nh os switch /home/tomas/dotfiles/nixos";
    };
  };
}
