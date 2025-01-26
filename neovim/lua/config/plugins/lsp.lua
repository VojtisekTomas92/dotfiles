return {
    "neovim/nvim-lspconfig",
    config = function()    
        local nvim_lsp = require("lspconfig")
        nvim_lsp.nixd.setup({
           cmd = { "nixd" },
           settings = {
              nixd = {
                 nixpkgs = {
                    expr = "import <nixpkgs> { }",
                 },
                 formatting = {
                    command = { "nixfmt" },
                 },
                 options = {
                    nixos = {
                       expr = '(builtins.getFlake ("git+file://" + toString ./.)).nixosConfigurations.k-on.options',
                    },
                    home_manager = {
                       expr = '(builtins.getFlake ("git+file://" + toString ./.)).homeConfigurations."ruixi@k-on".options',
                    },
                 },
              },
           },
        })
    end

}
