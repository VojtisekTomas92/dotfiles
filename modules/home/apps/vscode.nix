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
        tamasfe.even-better-toml
        ms-vscode-remote.remote-ssh

      ];
      userSettings = {
        "workbench.colorTheme" = "One Dark Pro";
        "workbench.iconTheme" = "material-icon-theme";

        "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Droid Sans Mono', 'monospace'";
        "editor.fontLigatures" = true;
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
