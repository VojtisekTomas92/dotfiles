return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" }, -- Load LSP early when a buffer is read or created
        config = function()
            require('lspconfig').nixd.setup{}
        end,
    },
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({
                formatters_by_ft = {
                    lua = "stylua",
                    nix = "alejandra",
                },
                format_on_save = {
                    timeout_s = 500,
                    lsp_format = "fallback",
                },
            })
        end,
    },
}
