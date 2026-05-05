{ ... }:
{
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.age.keyFile = "/home/tomas/.config/sops/age/keys.txt";

  sops.secrets.syncthing_gui_password = {
    owner = "tomas";
  };

  sops.secrets.keepass_pw = {
    owner = "tomas";
  };
}
