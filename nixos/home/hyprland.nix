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
      source = /home/tomas/dotfiles/hyprland/hyprland.conf
    '';
    plugins = with pkgs.hyprlandPlugins; [
      hyprsplit
    ];
  };

  home.file.".config/waybar/config.jsonc" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/tomas/dotfiles/waybar/config.jsonc";
  };

  home.file.".config/eww/eww.scss" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/tomas/dotfiles/eww/eww.scss";
  };

  home.file.".config/eww/eww.yuck" = {
    source = config.lib.file.mkOutOfStoreSymlink "/home/tomas/dotfiles/eww/eww.yuck";
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  home.packages = with pkgs; [
    eww
  ];
}
