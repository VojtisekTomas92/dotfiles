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
    profiles.tomas = {
      isDefault = true;
      id = 0;
      name = "tomas";
    };
    policies = {
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          default_area = "menupanel";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
      };

      InstallAddonsPermission = {
        Default = true;
      };
    };

  };
}
