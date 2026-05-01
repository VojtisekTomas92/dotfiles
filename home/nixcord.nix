{ ... }:
{
  programs.nixcord = {
    enable = true;

    discord = {
      vencord.enable = false;
      equicord = {
        enable = true;
      };

      settings = {
        SKIP_HOST_UPDATE = true;
      };
    };

    config = {
      plugins = {
        splitLargeMessages.enable = true;
        betterFolders.enable = true;
      };
    };
  };
}
