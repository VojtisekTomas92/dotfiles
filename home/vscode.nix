{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
        zhuangtongfa.material-theme
        jnoortheen.nix-ide

      ];
      userSettings = {
        "workbench.colorTheme" = "One Dark Pro";

        "editor.formatOnSave" = true;

        "chat.agent.enabled" = false;
        "chat.disableAIFeatures" = true;

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
