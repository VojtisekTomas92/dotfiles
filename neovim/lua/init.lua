vim.o.number = true

local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
	vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require("mini.deps").setup({ path = { package = path_package } })
require("mini.pairs").setup()
require("mini.completion").setup()
require("mini.animate").setup()

MiniDeps.add("olimorris/onedarkpro.nvim")
MiniDeps.add("neovim/nvim-lspconfig")
MiniDeps.add("stevearc/conform.nvim")
MiniDeps.add("folke/trouble.nvim")

vim.g.mapleader = ","
-- Set colorscheme
MiniDeps.now(function()
	vim.cmd("colorscheme onedark")
end)

vim.lsp.inlay_hint.enable()

-- LSP Related stuff

vim.lsp.enable("nixd")

require("trouble").setup()

vim.keymap.set("n", "<leader>td", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Toggle Trouble diagnostics" })
-- formatting

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		nix = { "alejandra" },
	},
	format_on_save = {
		timeout = 500,
		lsp_format = "fallback",
	},
})
