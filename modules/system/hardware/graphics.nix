{ config, ... }:
{

  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    powerManagement = {
      enable = true;
      finegrained = false;
    };
    open = true;
    nvidiaSettings = true;

    prime = {
      sync.enable = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
  environment.variables = {
    "__NV_PRIME_RENDER_OFFLOAD" = "1";
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    "__VK_LAYER_NV_optimus" = "NVIDIA_only";
  };
}
