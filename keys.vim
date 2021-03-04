" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

noremap < <gv
noremap > >gv
nnoremap gp p`[v`]
vnoremap J :m '>+1<CR>gv
vnoremap K :m '<-2<CR>gv
map <silent> <F9> :source $HOME/.config/nvim/init.vim<CR>
noremap <silent> <F8> :let @+=expand("%:p")<CR>


map <silent> <F5> :call FormatEverything()<CR>

function! GoToNextIndent(inc)
    " Get the cursor current position
    let currentPos = getpos('.')
    let currentLine = currentPos[1]
    let matchIndent = 0

    " Look for a line with the same indent level whithout going out of the buffer
    while !matchIndent && currentLine != line('$') + 1 && currentLine != -1
        let currentLine += a:inc
        let matchIndent = indent(currentLine) == indent('.')
    endwhile

    " If a line is found go to this line
    if (matchIndent)
        let currentPos[1] = currentLine
        call setpos('.', currentPos)
    endif
endfunction
nnoremap ni :call GoToNextIndent(1)<CR>
nnoremap pi :call GoToNextIndent(-1)<CR>

inoremap <C-H> <C-W>

