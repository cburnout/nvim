let g:vimwiki_url_maxsave=0
nmap <F13> <Plug>VimwikiNextLink
nmap <F14> <Plug>VimwikiPrevLink
nmap <F15> <Plug>VimwikiAddHeaderLevel
" Doesnt work wanted to have short urls for normal mode and expanded for insert mode
"function ShowFull()
"    let g:vimwiki_url_maxsave=0
"    redraw
"endfunction

"function HideFull()
"    let g:vimwiki_url_maxsave=1
"    redraw
"endfunction

"autocmd InsertLeave * :call HideFull() 
"autocmd InsertEnter * :call ShowFull()
