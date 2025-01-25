{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    image = pkgs.fetchurl {
      url = "https://w.wallhaven.cc/full/2y/wallhaven-2yr816.jpg";
      sha256 = "sha256-D0RuX2K1mVGsH0I/4XjnjdcMPKyUOeVYoHeCqmGFH+Q=";
    };
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };
}
