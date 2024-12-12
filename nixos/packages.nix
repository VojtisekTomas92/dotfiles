{
  pkgs,
  inputs,
  ...
}: let
  pkgsUnstable = import inputs.nixpkgs-unstable {inherit (pkgs) system config overlays;};
in {
  environment.systemPackages = pkgs.lib.mkMerge [
    (with pkgs; [
      lshw
      git
      pciutils
      keepassxc
    ])
    (with pkgsUnstable; [
      firefox
      vesktop
      vscode
      nixd
      alejandra

      (vivaldi.overrideAttrs
        (oldAttrs: {
          proprietaryCodecs = true;
          enableWidevine = true;
          dontWrapQtApps = false;
          dontPatchELF = true;
          nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
        }))
    ])
  ];
}
