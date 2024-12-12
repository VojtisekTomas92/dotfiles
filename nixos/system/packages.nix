{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    lshw
    git
    pciutils
    keepassxc
    firefox
    vesktop
    vscode
    nixd
    alejandra
    base16-schemes

    (vivaldi.overrideAttrs
      (oldAttrs: {
        proprietaryCodecs = true;
        enableWidevine = true;
        dontWrapQtApps = false;
        dontPatchELF = true;
        nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [pkgs.kdePackages.wrapQtAppsHook];
      }))
  ];
}
