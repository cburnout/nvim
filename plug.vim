
" Stolen from fisa init.vim
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"fuzzy file finder 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Black formating stuff, Pinned to commit cause it might be wrong
Plug 'psf/black', { 'commit': 'ce14fa8b497bae2b50ec48b3bd7022573a59cdb1' } 

" Code commenter
Plug 'preservim/nerdcommenter'

" Class/module browser
Plug 'majutsushi/tagbar'

" Plugin for matching more than just brackets
Plug 'tmhedberg/matchit'

"Plugin for drawing line indents
Plug 'Yggdroot/indentLine'

"Autoformat
Plug 'Chiel92/vim-autoformat'

" COLOR SCHEMES GALLOR
Plug 'rafi/awesome-vim-colorschemes'

"verilog plugin
Plug 'vhda/verilog_systemverilog.vim'

" vim_numbertoggle
Plug 'jeffkreeftmeijer/vim-numbertoggle'

"Isort 
Plug 'stsewd/isort.nvim'

" semshi
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" Goyo
Plug 'junegunn/goyo.vim'

" Limelight
Plug 'junegunn/limelight.vim'

call plug#end()
