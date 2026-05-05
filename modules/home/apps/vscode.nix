{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
        zhuangtongfa.material-theme
        jnoortheen.nix-ide
        ms-python.python
        ms-python.vscode-pylance
        ms-python.debugpy
        usernamehw.errorlens
        pkief.material-icon-theme

      ];
      userSettings = {
        "workbench.colorTheme" = "One Dark Pro";
        "workbench.iconTheme" = "material-icon-theme";

        "editor.formatOnSave" = true;

        "chat.agent.enabled" = false;
        "chat.disableAIFeatures" = true;

        "explorer.compactFolders" = false;

        "editor.minimap.autohide" = "mouseover";

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "nixd" = {
          "formatting" = {
            "command" = "nixfmt";
          };
          "options" = {
            "nixos" = {
              "expr" = "(builtins.getFlake \"/home/tomas/dotfiles\").nixosConfigurations.nixos.options";
            };
            "home-manager" = {
              "expr" = "(builtins.getFlake \"/home/tomas/dotfiles\").homeConfigurations.tomas.options";
            };
          };
        };

      };

    };
  };
}
