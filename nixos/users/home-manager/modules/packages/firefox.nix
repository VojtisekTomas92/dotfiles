{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;

    profiles = {
      user = {
        settings = {
          "widget.use-xdg-desktop-portal.file-picker" = 1;
        };
      };
    };

    nativeMessagingHosts = [pkgs.keepassxc];
  };
}
