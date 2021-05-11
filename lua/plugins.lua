return require('packer').startup(function()

    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true }
    -- nvim reload for developing faster
    use 'famiu/nvim-reload'

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

    -- Fuzzy finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
    -- These were all attempts for notes
    -- use 'junegunn/fzf'
    -- use 'junegunn/fzf.vim'
    -- use 'BurntSushi/ripgrep'
    -- Notes
    -- use { "oberblastmeister/neuron.nvim", branch = "unstable"}
    -- use { 'fiatjaf/neuron.vim'}
    -- debugging
    use 'mfussenegger/nvim-dap'

    -- icons
    use 'kyazdani42/nvim-web-devicons'
    use 'ryanoasis/vim-devicons'

    -- lsp
    use { 'neovim/nvim-lspconfig' }
    --use 'glepnir/lspsaga.nvim'
    --use 'onsails/lspkind-nvim'
    --use 'kosayoda/nvim-lightbulb'
    --use 'mfussenegger/nvim-jdtls'
    use 'kabouzeid/nvim-lspinstall'

    -- languages
    use {'omnisharp/omnisharp-vim'}

    -- git
    use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'}
    }

    -- completion
   use { 'hrsh7th/nvim-compe' }
   use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'}
   use {"hrsh7th/vim-vsnip"}
   use {"rafamadriz/friendly-snippets"}

    -- vim dispatch
    use { 'tpope/vim-dispatch' }

    -- navigation
    use 'phaazon/hop.nvim'

    -- commenting
    use 'terrortylor/nvim-comment'

    --python
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
    -- foutain
    use 'kblin/vim-fountain'
end)
