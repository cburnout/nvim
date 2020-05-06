" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

noremap < <gv
noremap > >gv
nnoremap gp p`[v`]
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
map <silent> <F9> :source $HOME/.config/nvim/init.vim<CR>
