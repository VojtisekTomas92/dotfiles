{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # lsp
    nixd
    lua-language-server
    # formatting
    stylua
    nixfmt
  ];
  programs.nixvim = {

    enable = true;

    opts = {
      number = true;
      cursorline = true;
      mouse = "a";
    };

    colorscheme = "onedark";
    lsp = {
      enable = true;

      inlayHints.enable = true;
    };
    plugins = {
      web-devicons = {
        enable = true;
      };
      lsp = {

        enable = true;
        servers = {
          nixd = {
            enable = true;
          };
          lua_ls.enable = true;
        };
      };
      blink-cmp = {
        enable = true;

        settings = {
          keymap = {
            preset = "default";

            "<Tab>" = [
              "accept"
              "fallback"
            ];
            "<S-Tab>" = [
              "select_prev"
              "fallback"
            ];
            "<Down>" = [
              "select_next"
              "fallback"
            ];
            "<Up>" = [
              "select_prev"
              "fallback"
            ];

          };

          sources = {
            default = [
              "lsp"
              "path"
              "snippets"
              "buffer"
            ];
          };
          signature.enabled = true;

        };
      };

      blink-pairs.enable = true;
      blink-indent.enable = true;

      lualine = {
        enable = true;

      };

      neo-tree = {
        enable = true;
        autoload = true;
        filesystem = {
          filtered_items = {
            visible = true;
            hide_dotfiles = false;
            hide_gitignored = false;
          };
          follow_current_file = {
            enabled = true;
          };
        };
      };

      conform-nvim = {
        enable = true;
        settings = {
          format_on_save = {
            lsp_fallback = true;
            timeout_ms = 500;
          };
          formatters_by_ft = {
            lua = [ "stylua" ];
            nix = [ "nixfmt" ];
          };
        };
      };

      nvim-autopairs = {
        enable = true;
        autoload = true;
      };
    };

    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        name = "OneDarkPro";
        src = pkgs.fetchFromGitHub {
          owner = "olimorris";
          repo = "onedarkpro.nvim";
          tag = "v2.28.0";
          hash = "sha256-55vCi5TZ5n2ZesTsiL1i/BL3GTR7PvHaH+QXLy2y/no=";
        };
      })
    ];
  };
}
