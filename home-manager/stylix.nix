{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    image =
      pkgs.fetchurl {
        url = "https://w.wallhaven.cc/full/rr/wallhaven-rrl1kj.jpg";
        sha256 = "1y29rigkmwmg4nxn6pzgkz91ch9cdslrqnfxa6l1h3bjm269saxr
";
      };
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/onedark.yaml";
  };
}
