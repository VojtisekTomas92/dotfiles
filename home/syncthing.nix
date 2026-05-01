{ pkgs, ... }:
let
  secrets = import ../secrets.nix;
in
{
  services.syncthing = {
    enable = true;
    tray = {
      enable = true;
      package = pkgs.syncthingtray;
    };

    settings = {
      devices = {
        "pixel-8-pro" = {
          id = secrets.syncthing.pixel_id;
        };
      };
      folders = {
        "main" = {
          id = secrets.syncthing.pixel_folder_id;
          path = "/home/tomas/SyncThingMain";
          devices = [ "pixel-8-pro" ];
        };
      };
    };
  };
}
