
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
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> <A-PageDown> <Plug>(coc-diagnostic-prev)
nmap <silent> <A-PageUp> <Plug>(coc-diagnostic-next)
"
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
"
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
"
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
"
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
"
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"
augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
"
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
"
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
"
" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
"
" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
"
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
"
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Airline Config

" Fuzzy File Finder Config
" file finder mapping
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" the same, but with the word under the cursor pre filled
nmap ,wg :execute ":BTag " . expand('<cword>')<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" the same, but with the word under the cursor pre filled
nmap ,wG :execute ":Tags " . expand('<cword>')<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wf :execute ":BLines " . expand('<cword>')<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" the same, but with the word under the cursor pre filled
nmap ,wF :execute ":Lines " . expand('<cword>')<CR>
" commands finder mapping
nmap ,c :Commands<CR>

" Black Config

" NerdCommenter Config
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Tagbar config
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

"Colorschemes
colorscheme gruvbox

if has('mouse')
    set mouse=a
endif

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

set number relativenumber

:set autowrite
:au FocusLost * Black
:au FocusLost Isort
:au FocusLost * :wa
set scrolloff=5
