-- vim.api.nvim_set_keymap('n', '<Space>hs', '<NOP>', {noremap = true, silent = true})
local utils = require('utils')
utils.map('n', '<C-h>', '<cmd>noh<CR>') -- Clear highlights
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
utils.map('n', '<leader>fr', '<cmd>Telescope lsp_references<cr>')
utils.map('n', '<leader>fc', '<cmd>Telescope lsp_code_actions<cr>')
utils.map('n', '<leader>fd', '<cmd>Telescope lsp_document_diagnostics<cr>')
utils.map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
utils.map('n', '<leader>fb', '<cmd>Telescope buffer<cr>')
utils.map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

utils.map('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
-- make it easier w/ the file explorer
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {silent = false})
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n><C-w>h', {silent = true})
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n><C-w>j', {silent = true})
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n><C-w>k', {silent = true})
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n><C-w>l', {silent = true})

vim.api.nvim_set_keymap('i', '<A-h>', '<Esc><C-w>h', {silent = true})
vim.api.nvim_set_keymap('i', '<A-j>', '<Esc><C-w>j', {silent = true})
vim.api.nvim_set_keymap('i', '<A-k>', '<Esc><C-w>k', {silent = true})
vim.api.nvim_set_keymap('i', '<A-l>', '<Esc><C-w>l', {silent = true})

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Down>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<Up>"
  end
end

-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', {silent = true})
vim.api.nvim_set_keymap('i', '<Down>', 'v:lua.tab_complete()', {silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<Up>', 'v:lua.s_tab_complete()', {silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-j>', 'v:lua.tab_complete()', {silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-k>', 'v:lua.s_tab_complete()', {silent = true, expr = true})
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', {silent = true})

utils.map('n', '<leader>cf', '<cmd>call Black()<cr>')

utils.map('n', '<leader>cc', ':CommentToggle<cr>')
utils.map('v', '<leader>cc', ':CommentToggle<cr>')

-- HopPatern and chars doesnt work but the rest is good
utils.map('n', '<leader>hw', '<cmd>HopWord<cr>')
utils.map('n', '<leader>hl', '<cmd>HopLine<cr>')
vim.api.nvim_set_keymap('n', '<leader>hp', "<cmd>HopPattern<cr>", {})
utils.map('n', '<leader>h1', '<cmd>HopChar1<cr>')
utils.map('n', '<leader>h2', '<cmd>HopChar2<cr>')
utils.map('n', '<leader>ls', ':ls<cr>:b ')

vim.api.nvim_set_keymap('n', '<C-PageUp>',   ':BufferLineCyclePrev<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-PageDown>', ':BufferLineCycleNext<cr>', {silent = true})

vim.api.nvim_set_keymap('n', '<A-PageUp>',   ':BufferLineMovePrev<cr>', {silent = true})
vim.api.nvim_set_keymap('n', '<A-PageDown>', ':BufferLineMoveNext<cr>', {silent = true})

vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {silent = true})

-- Better nav for omnicomplete
-- vim.api.nvim_set_keymap('i', '<c-j>', '(\"\\<C-n>\")', {expr = true})
-- vim.api.nvim_set_keymap('i', '<c-k>', '(\"\\<C-p>\")', {expr = true})
-- vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
-- vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
vim.cmd('set whichwrap+=<,>,[,]')
