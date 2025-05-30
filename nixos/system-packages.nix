{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # Nix specifix stuff
  ];
}
