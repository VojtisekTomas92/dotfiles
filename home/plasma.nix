{ pkgs, ... }:
{
  programs.plasma = {
    enable = true;

    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Space";
      command = "${pkgs.kdePackages.konsole}/bin/konsole";
    };

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
    };
  };
}
