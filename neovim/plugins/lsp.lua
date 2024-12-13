return {
    "neovim/nvim-lspconfig",
    "stevearc/conform.nvim",
    config = function()
        require'lspconfig'.nixd.setup{}

        require("conform").setup({
            formatters_by_ft = {
                lua = "stylua",
                nix = "alejandra"
            },
            format_on_save = {
                timeout_s = 500,
                lsp_format = "fallback",            }
        })
    end
}