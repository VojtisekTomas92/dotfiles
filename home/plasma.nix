{ pkgs, ... }:
{
  programs.plasma = {
    enable = true;

    fonts = {
      fixedWidth = {
        family = "FiraCode Nerd Font Mono";
        pointSize = 10;
      };
      general = {
        family = "Fira Sans";
        pointSize = 11;
      };
      windowTitle = {
        family = "Fira Sans";
        pointSize = 11;
      };
      menu = {
        family = "Fira Sans";
        pointSize = 11;
      };
    };

    input = {
      keyboard = {
        numlockOnStartup = "on";
      };
    };

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

    session = {
      sessionRestore = {
        restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };
    };
  };

  programs.konsole = {
    enable = true;
    defaultProfile = "tomas";
    customColorSchemes = {
      "OneDarkPro" = ../resources/konsole/onedarkpro.colorscheme;
    };
    profiles."tomas" = {
      colorScheme = "OneDarkPro";
      font = {
        name = "FiraCode Nerd Font Mono";
        size = 12;
      };
      command = "${pkgs.zsh}/bin/zsh";
    };
  };
}
