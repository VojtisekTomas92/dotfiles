{ config, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    languagePacks = [
      "en-US"
      "de"
    ];

    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        "{17b1b318-a398-44d0-bfd5-c25538ef8e39}" = {
          installation_mode = "force_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/onedark-pro/latest.xpi";
        };
      };

      InstallAddonsPermission = {
        Default = true;
      };
    };

  };
}
