vim.o.number = true

local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    'git', 'clone', '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim', mini_path
  }
  vim.fn.system(clone_cmd)
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })
require('mini.pairs').setup()

MiniDeps.add({
	source = "olimorris/onedarkpro.nvim", 
})

MiniDeps.add("neovim/nvim-lspconfig")

-- Set colorscheme
MiniDeps.now(function() vim.cmd("colorscheme onedark") end)

vim.lsp.inlay_hint.enable()

-- LSP Related stuff

vim.lsp.enable("nixd")

