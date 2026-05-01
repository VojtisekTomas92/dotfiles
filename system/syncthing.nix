{ pkgs, ... }:
let
  secrets = import ../secrets.nix;
in
{
  sops.defaultSopsFile = ../secrets/secrets.yaml;
  sops.age.keyFile = "/home/tomas/.config/sops/age/keys.txt";
  sops.secrets.syncthing_gui_password = {
    owner = "tomas";
  };
  services.syncthing = {
    enable = true;

    guiPasswordFile = "/run/secrets/syncthing_gui_password";
    openDefaultPorts = true;
    user = "tomas";
    group = "users";
    configDir = "/home/tomas/.config/syncthing";
    dataDir = "/home/tomas/.config/syncthing";
    overrideDevices = true;
    overrideFolders = true;
    settings = {
      gui.user = "tomas";
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
