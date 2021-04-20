return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true }

    -- Tree sitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use { 'p00f/nvim-ts-rainbow' }
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    use { 'nvim-treesitter/playground' }
    use { 'JoosepAlviste/nvim-ts-context-commentstring' }
    use { 'windwp/nvim-ts-autotag' }

    -- Color scheme stuff
    use {'cburnell/nvcode-color-schemes.vim'}
    use 'norcalli/nvim-colorizer.lua'
    use 'sheerun/vim-polyglot'
    -- use {'numirias/semshi', run = ':UpdateRemotePlugins'}
    
    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- Debugging
    use 'mfussenegger/nvim-dap'
    
    -- Icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- LSP
    use { 'neovim/nvim-lspconfig' }
    --use 'glepnir/lspsaga.nvim'
    --use 'onsails/lspkind-nvim'
    --use 'kosayoda/nvim-lightbulb'
    --use 'mfussenegger/nvim-jdtls'
    use 'kabouzeid/nvim-lspinstall'
 
    -- git
    use {
    'lewis6991/gitsigns.nvim',
    requires = {
        'nvim-lua/plenary.nvim'
    },
    config = function()
        require('gitsigns').setup()
    end
    }
    -- completion
    use { 'hrsh7th/nvim-compe' }

    -- Vim dispatch
    use { 'tpope/vim-dispatch' }

    -- Navigation
    use 'phaazon/hop.nvim'

    -- Commenting
    use 'terrortylor/nvim-comment'
    
    --Python
    use 'a-vrma/black-nvim'
    use'stsewd/isort.nvim'

    -- paren pairing
    use 'windwp/nvim-autopairs'

    -- file explorer
    use 'kyazdani42/nvim-tree.lua'

    -- matching code bits
    use 'andymass/vim-matchup'
    
    -- statusline
    use {
    'glepnir/galaxyline.nvim',
        branch = 'main',
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    -- bufferline
    use {'cburnell/nvim-bufferline.lua', branch = "lcars", requires = 'kyazdani42/nvim-web-devicons'}
end)
