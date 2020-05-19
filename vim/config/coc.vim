" List of coc extensions to install
let g:coc_global_extensions = [
      \ 'coc-prettier',
      \ 'coc-git',
      \ 'coc-eslint',
      \ 'coc-tsserver',
      \ ]

" Allow tabbing through completion menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use `[c` and `]c` to view errors reported by COC
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Move to the next changed hunk
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)

" Shortcuts for jumping to definitions and viewing references
" nnoremap <silent> gd :call CocAction('jumpDefinition')<cr>
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> gh <Plug>(coc-diagnostic-info)

" Show suggestions for Ctrl-Space
inoremap <silent><expr> <c-space> coc#refresh()

" Use K for show documentation in preview window
nnoremap <silent> gK :call <SID>show_documentation()<CR>

" This function will show vim docs for vim files,
" otherwise it'll use COC to find docs
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
