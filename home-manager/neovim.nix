{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neovide
    neovim
  ];

  home.file.".config/nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink ../neovim/init.lua;
}
