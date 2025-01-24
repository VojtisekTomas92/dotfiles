{
  config,
  lib,
  pkgs,
  ...
}: {
  systemd.services.pam-kwallet-init = {
    enable = true;
    description = "Initialize kwallet using pam?";
    unitConfig = {
      Type = "simple";
    };
    serviceConfig = {
      ExecStart = "${pkgs.kdePackages.kwallet-pam}/libexec/pam_kwallet_init";
    };
    wantedBy = ["multi-user.target"];
  };
  systemd.user.services.keepassxc = {
    enable = true;
    description = "Start keepassxc";
    serviceConfig = {
      ExecStart = "${pkgs.keepassxc}/bin/keepassxc";
    };
    wantedBy = ["multi-user.target"];
  };
}
