local utils = require('utils')
utils.map('n', '<C-l>', '<cmd>noh<CR>') -- Clear highlights
utils.map('i', 'jk', '<Esc>')           -- jk to escape
utils.map('i', 'jj', '<Esc>')           -- jk to escape
utils.map('i', 'kj', '<Esc>')           -- jk to escape

-- better indenting
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Telescope keybinds

utils.map('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
utils.map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
utils.map('n', '<leader>fb', '<cmd>Telescope buffer<cr>')
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

utils.map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

utils.map('n', '<leader>b', '<cmd>call Black()<cr>')

utils.map('n', '<leader>hw', '<cmd>HopWord<cr>')
utils.map('n', '<leader>hl', '<cmd>HopLine<cr>')
vim.api.nvim_set_keymap('n', '<leader>hp', "<cmd>lua require'hop'.hint_patterns()<cr>", {})
utils.map('n', '<leader>h1', '<cmd>HopChar1<cr>')
utils.map('n', '<leader>h2', '<cmd>HopChar2<cr>')
