" Syntax folding can be extremely slow so disable
" for long files so disable if over 500 lines
augroup disable_syntax_folding
  autocmd!
  autocmd BufWinEnter *
        \ if line2byte(line("$") + 1) > 500 |
        \    setlocal foldmethod=indent |
        \ endif
augroup END

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Autosave file changes
" augroup autoSaveAndRead
"   autocmd!
"   autocmd TextChanged,InsertLeave,FocusLost * silent! wall
"   autocmd CursorHold * silent! checktime
" augroup END

" Resize panes when the window is resized
augroup window_resize
  autocmd!
  autocmd VimResized * :wincmd =
augroup END

" Remove trailing whitespace
augroup remove_trailing_whitespace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup end

" Automatically reload vim config when saved
augroup reload_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup end

" Autocmds for specific filetypes

augroup filetype_zsh
  autocmd!
  autocmd BufNewFile,BufRead *aliases setlocal filetype=zsh
  autocmd BufNewFile,BufRead *zsh* setlocal filetype=zsh
augroup END

augroup filetype_python
  autocmd!
  autocmd FileType python setlocal foldmethod=indent
augroup END

augroup filetype_css
  autocmd!
  autocmd BufNewFile,BufRead *.less setlocal filetype=less
  autocmd BufNewFile,BufRead *.scss setlocal filetype=sass
  autocmd BufNewFile,BufRead *.sass setlocal filetype=sass
  autocmd Filetype less,css,sass setlocal foldmethod=marker
  autocmd Filetype less,css,sass setlocal foldmarker={,}
augroup END

augroup filetype_json
  autocmd!
  autocmd BufNewFile,BufRead *.json setlocal filetype=json
  autocmd FileType json setlocal foldmethod=syntax
augroup END

augroup filetype_javascript
  autocmd!
  autocmd FileType javascript setlocal foldmethod=syntax
  autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json
  autocmd BufNewFile,BufRead .babelrc setlocal filetype=JavaScript
  autocmd BufNewFile,BufRead *.snap setlocal filetype=JavaScript
augroup END

augroup filetype_typescript
  autocmd!
  autocmd FileType typescript setlocal foldmethod=syntax
  autocmd FileType typescript UltiSnipsAddFiletypes javascript
augroup END
