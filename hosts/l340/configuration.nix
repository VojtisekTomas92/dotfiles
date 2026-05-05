{ pkgs, ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  imports = [
    ./hardware-configuration.nix

    ../../modules/system/hardware/graphics.nix
    ../../modules/system/hardware/sound.nix

    ../../modules/system/services/restic.nix
    ../../modules/system/services/syncthing.nix

    ../../modules/system/packages.nix
    ../../modules/system/sops.nix

  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  console.keyMap = "de";

  services.printing.enable = true;

  users.users.tomas = {
    isNormalUser = true;
    description = "tomas";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
      #  thunderbird
    ];
  };

  nixpkgs.config.allowUnfree = true;

  environment.pathsToLink = [ "/share/zsh" ];
  programs.zsh.enable = true;
  users.users.tomas.shell = pkgs.zsh;

  system.stateVersion = "25.11"; # Did you read the comment?

}
