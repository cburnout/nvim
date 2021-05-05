vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = " "
vim.cmd('colorscheme '.. 'lcars')

vim.lsp.set_log_level("debug")

vim.o.termguicolors = true
local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require('settings')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Install plugins
require('plugins')

require('plugins/nvim-reload')

require('plugins/nvim-compe')
require('plugins/telescope')
require('plugins/fzf')
require('plugins/ripgrep')
-- require('plugins/neuron-nvim')
require('plugins/nvim-lspconfig')
require('plugins/nvim-colorizer')
require('plugins/galaxyline')
require('plugins/nvim-tree')

require('plugins/nvim-bufferline')
-- require('plugins/tabline')
require('plugins/nvim-treesitter')
require('plugins/nvim-comment')
require('plugins/nvim-autopairs')
require('plugins/gitsigns')
--require('plugins/vim-vsnip')

vim.cmd('map  <F2>  :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . \'> trans<\' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>')
require('lsp')
require('lsp/python-lsp')
require('lsp/lua-lsp')
require('lsp/omnisharp-lsp')

-- Key mappings
require('keymappings')

