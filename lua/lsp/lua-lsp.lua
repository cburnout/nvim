require'lspconfig'.lua.setup {
    -- ... other configs
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim', 'use' }
            }
        }
    }
}
