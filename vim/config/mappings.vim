" Remap H and L to beginning and end of line
noremap H ^
noremap L $
vnoremap L g_

" Easily change the word under the cursor and repeat
nnoremap c* *Ncgn
nnoremap c# #NcgN

" Flip between two files
nnoremap <silent> <C-e> :e#<cr>
inoremap <silent> <C-e> <esc>:e#<cr>

" Make it easy to jump between panes
tnoremap <c-h> <C-\><C-N><C-w>h
tnoremap <c-j> <C-\><C-N><C-w>j
tnoremap <c-k> <C-\><C-N><C-w>k
tnoremap <c-l> <C-\><C-N><C-w>l
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l

" Disable zE from removing all {
nnoremap zE <nop>
vnoremap zE <nop>

" Move tabs
nnoremap <right> :tabm +1<cr>
nnoremap <left> :tabm -1<cr>

" Select the contents of the current line, excluding indentation.
nnoremap vv ^vg_

" Make ' go to the exact position
noremap ' `

" I accidentally type these
nnoremap Q <nop>
nnoremap U <nop>
vnoremap U <nop>

" Use standard regexes
nnoremap / /\v
vnoremap / /\v

" Keep the result in the center of the screen
nnoremap n nzzzv
nnoremap N Nzzzv
" nnoremap * *zzzv
" nnoremap # #zzzv

" Yank till end of line
nnoremap Y y$

" Keep a block selected after indenting
vnoremap < <gv
vnoremap > >gv

inoremap kj <esc>
inoremap jj <esc>

" Movement by screen line instead of file line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <down> gj
nnoremap <up> gk

" Remap ; to :
vnoremap ; :
nnoremap ; :

" Lookup the word under the cursor
nnoremap K :Ag <C-R><C-W><cr>

" Get the relative path of a file
inoremap <expr> <c-h> fzf#complete(fzf#wrap({ 'reducer': function('GetRelativePath') }))
