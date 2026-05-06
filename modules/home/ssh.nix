{ config, ... }:
{
  services.ssh-agent = {
    enable = true;
  };

  home.file.".ssh/id_rsa".source =
    config.lib.file.mkOutOfStoreSymlink "/home/tomas/SyncThingMain/.ssh/id_rsa";

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "melonic" = {
        hostname = "admin.r00t.li";
        user = "suswombat";
        identityFile = "/home/tomas/.ssh/id_rsa";
      };
    };
  };
}
