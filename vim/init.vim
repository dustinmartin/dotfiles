" Author: Dustin Martin <dm@dustinmartin.net>
" Source: https://github.com/dustinmartin/dotfiles

" Plugins --------------------------------------------------------- {{{

" Install vim-plug if not yet installed
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.config/nvim/plugged')

" Finding/Navigation
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" Completion and Snippets
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editor Usability
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
" Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'

" Language Support
Plug 'sheerun/vim-polyglot'
Plug 'moll/vim-node'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'fatih/vim-go'

" Color Schemes
Plug 'mhartington/oceanic-next'

" All of your Plugins must be added before the following line
call plug#end()

" }}}
" Vim Settings ---------------------------------------------------- {{{

if (has("termguicolors"))
  set termguicolors
endif

syntax on                                " Enable syntax highlighting
filetype plugin indent on                " Detect and handle filetypes

let mapleader = ","                      " Set leader key to comma
let maplocalleader = "\\"

let g:airline_theme='oceanicnext'
colorscheme OceanicNext

set shell=/bin/zsh                       " Setting shell to zsh
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,mac,dos
set hidden                               " Allow unsaved buffers to be hidden
set nowrap                               " Turn word wrapping off. :set wrap turns it back on.
set tabpagemax=50                        " Increase the number of allowed tabs
set showtabline=2                        " Always show the tabline
set ruler                                " Turn on row,column dislay on status bar
set backspace=2                          " Allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]               " Backspace and cursor keys wrap too
set visualbell                           " Disable 'beep' for wrong commands and do screen flash
" set cursorline                           " Highlights the cursor line
" set cursorcolumn                         " Highlights the cursor column
set laststatus=2                         " Always show the statusline
set textwidth=0                          " Prevent Vim from wrapping lines
set wrapmargin=0                         " Prevent Vim from wrapping lines
set sidescroll=1                         " Number of columns to scroll horizontally
set sidescrolloff=10                     " Number of columns to keep to the left and right of cursor
set scrolloff=1                          " Number of rows to keep above/below the cursor
set mouse=a                              " Enable mouse
set showcmd                              " Show command in bottom right of window
set clipboard=unnamed                    " Default to the system clipboard
set showmode                             " Show the current Vim mode
" Keep this off for now since Neovim has a
" but that, when paired with Airline, causes
" Neovim to not redraw properly when the
" window changes size.
set lazyredraw                         " Don't update the display while executing macros
set wrapscan                             " Set the search scan to wrap around the file
set virtualedit=block                    " Allow the cursor to go in to invalid places in visual block mode
set breakindent
set shortmess+=I                         " Skip the splash screen
set matchtime=3                          " How many tenths of a second to highlight a matching parentheses
set spelllang=en_us                      " Set the spell check dictionary
set number                               " Display line numbers
set relativenumber                       " Use relative line numbers
set shiftwidth=2                         " Number of spaces to use for each step of (auto)indent
set tabstop=2                            " Number of spaces that a <Tab> in the file counts for
set softtabstop=2
set expandtab
set autoindent                           " Copy the indent from the current line when starting a new line
set nosmartindent
set nocindent
set linespace=0
" set switchbuf=newtab                     " Open new buffers always in new tabs
set splitright                           " Split vertical windows right to the current windows
set splitbelow                           " Split horizontal windows below to the current windows
set autoread                             " Automatically reread changed files without asking me anything
set suffixesadd+=.js                     " Help VIM find .js files when using gf
" set list
" set listchars=tab:»\ ,eol:\ ,trail:·,extends:❯,precedes:❮
set linebreak
set showbreak=\ ↪\ 
set ignorecase                           " Makes searches case insensitive if search string is all lower case
set smartcase                            " Makes searches case SENSITIVE if search string contains an uppercase letter
set gdefault                             " Search/replace 'globally' (on a line) by default
set incsearch                            " Start searching before pressing enter
set inccommand=nosplit
set showmatch                            " Highlight the matching bracket when one is inserted
set hlsearch                             " Highlight search results (as you type)
set noswapfile
set nobackup
set undolevels=1000                      " The number of undo levels to allow
set complete-=i
set formatoptions-=r                     " Don't add comment prefix to next line
" set colorcolumn=120
set completeopt=menu,menuone
set diffopt+=vertical

highlight CursorColumn guibg=#383737

" What actions open a fold?
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
" set foldlevel=0
set foldlevelstart=20

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" }}}
" Wildmenu Completion --------------------------------------------- {{{

set wildmenu
set wildmode=full

set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=log/**,node_modules/**,target/**,tmp/**,*.rbc

" }}}
" Tab Line -------------------------------------------------------- {{{

set tabline=%!MyTabLine()

function! MyTabLine()
    let s = ''

    for i in range(tabpagenr('$'))
        " select the highlighting
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif

        " set the tab page number (for mouse clicks)
        let s .= '%' . (i + 1) . 'T'

        let tabNum = i + 1
        let s .= ' '. tabNum . ') '

        " the label is made by MyTabLabel()
        let s .= '%{MyTabLabel(' . (i + 1) . ')}'
    endfor

    " after the last tab fill with TabLineFill and reset tab page nr
    let s .= '%#TabLineFill#%T'

    " right-align the label to close the current tab page
    if tabpagenr('$') > 1
        let s .= '%=%#TabLine#%999X[X]'
    endif

    return s
endfunction

function! MyTabLabel(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    let label  = bufname(buflist[winnr - 1])

    if label == ''
        let label = 'Untitled'
    endif

    let label .= (getbufvar(buflist[winnr - 1], "&mod")?' + ':'   ')

    return fnamemodify(label, ":t")
endfunction

" }}}
" Custom Commands ------------------------------------------------- {{{

command! SaveSession mksession! ~/.vim-sessions/session.vim
command! OpenSession source ~/.vim-sessions/session.vim

" command! Scratch tabe ~/Desktop/Scratch.md

" See all code TODOs
command! TODO Ag TODO|FIXME

" Edit Vimrc
command! Vimrc tabe $MYVIMRC
command! Reload source $MYVIMRC

" Close all buffers
" command! BDA 1,1000 bd
command! BDA %bd

" Format Selected XML
command! -bar ToXML silent %!xmllint --encode UTF-8 --format -
command! SetXML set ft=xml
command! FormatXML ToXML|SetXML

" Remove \ (caret M) from files
command! RemoveM %s/\//g

" Terminal commands
command! -nargs=* TermHorizontal split | terminal <args>
command! -nargs=* TermVertical vsplit | terminal <args>

" }}}
" Key Mappings ---------------------------------------------------- {{{

" Open file in a new split
nnoremap gf <C-W>gf

tnoremap <c-h> <C-\><C-N><C-w>h
tnoremap <c-j> <C-\><C-N><C-w>j
tnoremap <c-k> <C-\><C-N><C-w>k
tnoremap <c-l> <C-\><C-N><C-w>l
" inoremap <c-h> <C-\><C-N><C-w>h
" inoremap <c-j> <C-\><C-N><C-w>j
" inoremap <c-k> <C-\><C-N><C-w>k
" inoremap <c-l> <C-\><C-N><C-w>l
nnoremap <c-h> <C-w>h
nnoremap <c-j> <C-w>j
nnoremap <c-k> <C-w>k
nnoremap <c-l> <C-w>l

" Disable zE from removing all {
nnoremap zE <nop>
vnoremap zE <nop>

" Move tabs
nnoremap <right> :tabm +1<CR>
nnoremap <left> :tabm -1<CR>

" Don't yank to default register when changing something, e.g. ciw, ci(
nnoremap c "xc
xnoremap c "xc

" Select (charwise) the contents of the current line, excluding indentation.
nnoremap vv ^vg_

" Make ' go to the exact position
noremap ' `

" I always accidentally hit K when I mean k
nnoremap K k

" Easier to type, and I never use the default behavior.
" noremap H ^
" noremap L $
" vnoremap L g_

" Use standard regexes
nnoremap / /\v
vnoremap / /\v

" Keep the result in the center of the screen
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv
nnoremap <silent> * *zzzv
nnoremap <silent> # #zzzv
nnoremap <silent> g* g*zzzv
nnoremap <silent> g# g#zzzv

" Yank till end of line
nnoremap Y y$

" U does some weird stuff. Remap to u
nnoremap U u
vnoremap U u

" Keep a block selected after indenting
vnoremap < <gv
vnoremap > >gv

" Visually select the text that was last edited/pasted
" nmap gV `[v`]

" Map ESC
imap jj <ESC>

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

" }}}
" Leader Mappings ------------------------------------------------- {{{

" nmap S <Plug>(easymotion-bd-f)
" nmap s <Plug>(easymotion-bd-w)
" vmap S <Plug>(easymotion-bd-f)
" vmap s <Plug>(easymotion-bd-w)

" Refocus folds
nnoremap <leader>z zMzvzazAzz

" Trim Whitespace
nnoremap <Leader>ws :%s/\s\+$//e<CR>

" Fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>

nnoremap <leader>t :tabnew<CR>
vnoremap <leader>t :tabnew<CR>

nnoremap <leader>ww :set wrap! linebreak nolist<CR>

" Toggle nerdtree
vnoremap <leader>nt <ESC> :NERDTreeToggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

" Open up current file in NERDTree
nnoremap <leader>nf :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :BLines<CR>

" Ag
nnoremap <leader>ag :Ag 

" }}}
" Folding --------------------------------------------------------- {{{


set foldtext=FoldText()

function! FoldText()
  let l:lpadding = &fdc
  redir => l:signs
    execute 'silent sign place buffer='.bufnr('%')
  redir End
  let l:lpadding += l:signs =~ 'id=' ? 2 : 0

  if exists("+relativenumber")
    if (&number)
      let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
    elseif (&relativenumber)
      let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
    endif
  else
    if (&number)
      let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
    endif
  endif

  " expand tabs
  let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
  let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

  let l:info = ' (' . (v:foldend - v:foldstart) . ')'
  let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
  let l:width = winwidth(0) - l:lpadding - l:infolen

  let l:separator = ' … '
  let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
  let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
  let l:text = l:start . ' … ' . l:end

  return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
endfunction

" }}}
" Plugin Settings ------------------------------------------------- {{{

" --- Prettier ------------ {{{

let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" }}}
" --- ALE ----------------- {{{

let g:ale_linters = {
\  'javascript': ['flow', 'eslint']
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)

let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter% says %s'

" }}}
" --- Airline ------------- {{{

let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

" }}}
" --- Ultisnips ----------- {{{

let g:UltiSnipsExpandTrigger="<c-j>"

" }}}
" --- MatchTagAlways ------ {{{

let g:mta_set_default_matchtag_color = 0
let g:mta_use_matchparen_group = 0

highlight MatchTag ctermfg=black ctermbg=darkgrey guifg=black guibg=darkgrey

" }}}
" --- EasyMotion ---------- {{{

" let g:EasyMotion_do_mapping = 0 " Disable default mappings
" let g:EasyMotion_use_smartsign_us = 1
" let g:EasyMotion_smartcase = 1

" hi EasyMotionTarget2First cterm=bold gui=bold ctermbg=none ctermfg=red
" hi EasyMotionTarget2Second cterm=bold gui=bold ctermbg=none ctermfg=lightred

" }}}
" --- Javascript ---------- {{{

set conceallevel=1
let g:javascript_plugin_flow = 1

" }}}
" --- FZF ----------------- {{{

function! s:make_path(path)
  let bPath = expand('%:p:h')
  let fPath = system("realpath " . join(a:path))
  let relPath = system("relative-path " . bPath . " " . fPath)
  let relPathNoExtension = system("strip-extension " . relPath)
  return substitute(relPathNoExtension, '\n\+$', '', '')
endfunction

" Get the relative path of a file
inoremap <expr> <c-h> fzf#complete(fzf#wrap({
  \ 'source':  'ag -g ""',
  \ 'reducer': function('<sid>make_path')}))

" }}}

" }}}
" Autocmd --------------------------------------------------------- {{{

" --- CursorLine ---------- {{{

" Only show cursorline in the current window and in normal mode.
augroup cursor_line
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" }}}
" --- Window Resize ------- {{{

augroup window_resize
    au!
    au VimResized * :wincmd =
augroup END

" }}}
" --- Python -------------- {{{

augroup ft_python
    au!

    au FileType python setlocal foldmethod=indent
augroup END

" }}}
" --- Vim ----------------- {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
augroup END

" }}}
" --- CSS ----------------- {{{

augroup ft_css
    au!

    au BufNewFile,BufRead *.less setlocal filetype=less
    au BufNewFile,BufRead *.scss setlocal filetype=sass
    au BufNewFile,BufRead *.sass setlocal filetype=sass

    au Filetype less,css,sass setlocal foldmethod=marker
    au Filetype less,css,sass setlocal foldmarker={,}
augroup END

" }}}
" --- JSON ---------------- {{{

augroup ft_json
    au!

    au BufNewFile,BufRead *.json setlocal filetype=json

    au FileType json setlocal foldmarker={,}
augroup END

" }}}
" --- Javascript ---------- {{{

augroup ft_javascript
    au!

    au FileType javascript setlocal foldmethod=syntax
augroup END

" }}}
" }}}
