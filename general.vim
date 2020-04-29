if has('mouse')
    set mouse=a
endif

"let mapleader = "\<SPACE>" 

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

set number relativenumber

:set autowrite
:au FocusLost * Black
:au FocusLost * Isort
:au FocusLost * Semshi enable
:au FocusLost * :wa
set scrolloff=5
