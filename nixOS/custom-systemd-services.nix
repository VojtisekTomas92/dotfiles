{
  config,
  lib,
  pkgs,
  ...
}: {
  systemd.services.pam-kwallet-init = {
    script = ''
      ${pkgs.kdePackages.kwallet-pam}/libexec/pam_kwallet_init
    '';

    type = "oneshot";
    wantedBy = ["multi-user.target"];
  };
}
