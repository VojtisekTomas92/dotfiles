{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;
    settings = {};
    extraConfig = ''
      source = /home/tomas/dotfiles/hyprland.conf
    '';
  };
}
