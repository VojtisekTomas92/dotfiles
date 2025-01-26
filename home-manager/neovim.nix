{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neovide
    neovim
  ];

  home.file.".config/nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink /home/tomas/dotfiles/neovim/init.lua;
  home.file.".config/nvim/lua/config/lazy.lua".source = config.lib.file.mkOutOfStoreSymlink /home/tomas/dotfiles/neovim/lua/config/lazy.lua;
  home.file.".config/nvim/lua/plugins/".source = config.lib.file.mkOutOfStoreSymlink /home/tomas/dotfiles/neovim/lua/config/plugins;
}
