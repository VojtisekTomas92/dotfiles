{
  makeDesktopItem,
  stdenv,
  appimageTools,
  lib,
  fetchurl,
  cacert,
  glib-networking,
}: let
  version = "01.09.07.50";
  pname = "bambu-studio";
  name = "${pname}-${version}";

  src = fetchurl {
    url = "https://update.shadow.tech/launcher/prod/linux/ubuntu_18.04/ShadowPC.AppImage";
    hash = "sha256-7afc2ded2da3c7216af4a9b1e0ebd7e0ab9a6eeab67ccd8f5a9dc62366027bf7";
  };
  appimageContents = appimageTools.extractType1 {
    inherit pname name src;
  };
in
  appimageTools.wrapType2 {
    inherit name src;
    extraPkgs = pkgs: with pkgs; [];
    extraInstallCommands = ''
    '';
  }
