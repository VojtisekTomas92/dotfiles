{ ... }:
{
  programs.emacs = {
    enable = true;
    extraConfig = ''
      (load-file "/home/tomas/dotfiles/resources/configs/emacs/config.el")
    '';
  };
}
