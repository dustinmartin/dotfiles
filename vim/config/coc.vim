" List of coc extensions to install
let g:coc_global_extensions = [
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-tsserver',
      \ 'coc-git',
      \ 'coc-css',
      \ 'coc-json',
      \ 'coc-snippets',
      \ 'coc-yaml',
      \ 'coc-html'
      \ ]


 " Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Allow tabbing through completion menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Rename the symbol under the cursor
" command! -nargs=* RenameSymbol call CocAction('rename') <args>

" Do the suggested quickfix
" command! -nargs=* FixIt call CocAction('doQuickfix') <args>

" Show the diagnostic message (usually an error)
" command! -nargs=* Diagnose call CocAction('diagnosticInfo') <args>

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
