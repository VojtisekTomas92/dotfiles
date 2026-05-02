{ pkgs, config, ... }:
let
  commonConfig = {
    paths = [
      "/home/tomas/.ssh"
      "/home/tomas/SyncThingMain"
    ];
    exclude = [
      "/home/tomas/SyncThingMain/Backups"
    ];
    passwordFile = config.sops.secrets.restic_pw.path;
    initialize = true;
    user = "tomas";
    package = pkgs.writeShellScriptBin "restic" ''
      exec /run/wrappers/bin/restic "$@"
    '';
    timerConfig = {
      OnCalendar = "daily";
      Persistent = true;
    };
    pruneOpts = [
      "--keep-daily 7"
      "--keep-weekly 4"
      "--keep-monthly 6"
    ];
  };
in
{
  sops.secrets.restic_pw = { };
  sops.secrets.rclone_gdrive_conf = {
    owner = "tomas";
  };

  security.wrappers.restic = {
    source = "${pkgs.restic}/bin/restic";
    owner = "tomas";
    group = "users";
    permissions = "u=rwx,g=rx,o=rx";
    capabilities = "cap_dac_read_search+ep";
  };

  environment.systemPackages = with pkgs; [
    restic
    restic-browser
    rclone
  ];

  services.restic.backups = {
    syncthing = commonConfig // {
      repository = "/home/tomas/SyncThingMain/Backups";
    };
    google_drive = commonConfig // {
      repository = "rclone:gdrive:Backups";
      extraOptions = [
        "rclone.program='${pkgs.rclone}/bin/rclone'"
        "rclone.args='serve restic --stdio --config ${config.sops.secrets.rclone_gdrive_conf.path}'"
      ];
    };
  };
}
