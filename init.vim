
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
call plug#end()

" Coc Config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-python',
  \ 'coc-git',
  \ 'coc-json',
  \ 'coc-yank'
  \ ]

" Airline Config

" Fuzzy File Finder Config

" Black Config

" NerdCommenter Config

" Tagbar config

"Colorschemes
colorscheme minimalist

if has('mouse')
  set mouse=a
endif

set undofile
set undodir=~/.config/nvim/undos
set undolevels=1000
set undoreload=10000

" If you want to ALWAYS use the clipboard for ALL operations (as opposed
" to interacting with the '+' and/or '*' registers explicitly), set the
" following option:
set clipboard+=unnamed
set clipboard+=unnamedplus

" Default tab config, use spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=100 " Too narrow for my tastes, but satisfies most standards.
set smarttab
set shiftround	" use multiple of shiftwidth when indenting with '<' and '>'
set expandtab

set noswapfile
set nobackup " do not keep a backup file, use persistent versions instead

set title

set ignorecase
set smartcase

set autowriteall
set	autoread
set mousemodel=popup " Make right mouse button work in gvim
set hidden " Don't acutally close buffers, just hide them.

" Make sure I get the expected behavior from ctrl-]
" if cscopetag is set, ctrl-] will try to be too smart
set nocscopetag
set tags=tags,./tags;/

set grepprg=grep\ -n\ -Ir\ --exclude-dir='.git'\ --exclude-dir='.hg'\ --exclude-dir='.svn'\ --exclude-dir='.venv'\ --exclude-dir='.cvs'\ --exclude='*.pyo'\ --exclude='*.pyc'\ --exclude='*~'\ --exclude=TAGS\ --exclude=tags\ $*\ /dev/null

set inccommand=nosplit
" Split vertical to the right by default
set splitright
" Split horizontal below by default
set splitbelow

"Let you wrap up and down lines by just going left or right
set whichwrap+=<,>,[,]

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

noremap < <gv
noremap > >gv
nnoremap gp p`[v`]
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
