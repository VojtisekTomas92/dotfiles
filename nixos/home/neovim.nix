{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;
  };

  home.file.".config/nvim/init.lua".source = ../../neovim/init.lua;
  home.file.".config/nvim/lua/config/lazy.lua".source = ../../neovim/lua/lazy.lua;
  home.file.".config/nvim/lua/plugins/" = {
    source = ../../neovim/lua/plugins;
    recursive = true;
  };
}
