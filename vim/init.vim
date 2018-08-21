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
Plug 'tpope/vim-vinegar'

" Completion and Snippets
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'ajh17/VimCompletesMe'

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editor Usability
Plug 'moll/vim-bbye'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'
Plug 'alvan/vim-closetag'
Plug 'rhysd/clever-f.vim'

" Language Support
Plug 'metakirby5/codi.vim'
Plug 'flowtype/vim-flow'
Plug 'sheerun/vim-polyglot'
Plug 'moll/vim-node'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'fatih/vim-go'
Plug 'tpope/vim-scriptease'
Plug 'suy/vim-context-commentstring'

" Color Schemes
Plug 'chriskempson/base16-vim'

" Tmux Support
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" All of your Plugins must be added before the following line
call plug#end()

" }}}
" Vim Settings ---------------------------------------------------- {{{

syntax on                                " Enable syntax highlighting
filetype plugin indent on                " Detect and handle filetypes

let mapleader = ","                      " Set leader key to comma
let maplocalleader = ","

" This block get's 256 colors working with base16
" https://github.com/chriskempson/base16-shell
" https://github.com/aaron-williamson/base16-alacritty
" https://github.com/chriskempson/base16-vim
" https://github.com/chriskempson/base16-iterm2
set notermguicolors
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

set shell=/bin/zsh                       " Setting shell to zsh
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,mac,dos
set hidden                               " Allow unsaved buffers to be hidden
set nowrap                               " Turn word wrapping off. :set wrap turns it back on.
set tabpagemax=50                        " Increase the number of allowed tabs
set showtabline=0                        " Hide tabs
set ruler                                " Turn on row,column dislay on status bar
set backspace=2                          " Allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l,[,]               " Backspace and cursor keys wrap too
set visualbell                           " Disable 'beep' for wrong commands and do screen flash
set laststatus=2                         " Always show the statusline
set textwidth=0                          " Prevent Vim from wrapping lines
set wrapmargin=0                         " Prevent Vim from wrapping lines
set sidescroll=1                         " Number of columns to scroll horizontally
set sidescrolloff=10                     " Number of columns to keep to the left and right of cursor
set scrolloff=1                          " Number of rows to keep above/below the cursor
set mouse=a                              " Enable mouse
set clipboard=unnamed                    " Default to the system clipboard
set showmode                             " Show the current Vim mode
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
set splitright                           " Split vertical windows right to the current windows
set splitbelow                           " Split horizontal windows below to the current windows
set autoread                             " Automatically reread changed files without asking me anything
set suffixesadd+=.js                     " Help VIM find .js files when using gf
set suffixesadd+=.jsx                    " Help VIM find .jsx files when using gf
set linebreak
set showbreak=\ ↪\
set ignorecase                           " Makes searches case insensitive if search string is all lower case
set infercase
set smartcase                            " Makes searches case SENSITIVE if search string contains an uppercase letter
set gdefault                             " Search/replace 'globally' (on a line) by default
set incsearch                            " Start searching before pressing enter
set inccommand=split
set showmatch                            " Highlight the matching bracket when one is inserted
set hlsearch                             " Highlight search results (as you type)
set noswapfile
set nobackup
set undolevels=1000                      " The number of undo levels to allow
set complete-=i
set formatoptions-=r                     " Don't add comment prefix to next line
set completeopt=menu,menuone
set diffopt+=vertical
" set lazyredraw
set synmaxcol=200
set noshowcmd
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%m,%f:%l:%m

" What actions open a fold?
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldlevelstart=20

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

if has("gui_running")
    " Set the tab labels
    set guitablabel=%t\ %m

    set guioptions-=T                        " Hide the toolbar
    set guioptions-=e                        " Don't use GUI tabs
    set guioptions-=L                        " Disable left scrollbar
    set guioptions-=r                        " Disable right scrollbar

    " Window size
    set lines=35 columns=115                 " Set the window size
endif

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
" Zoom ------------------------------------------------------------ {{{

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction

command! ZoomToggle call s:ZoomToggle()

" }}}
" Visual Macros --------------------------------------------------- {{{

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<cr>

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

" }}}
" Reveal ---------------------------------------------------------- {{{

function! s:RevealInFinder()
  if filereadable(expand("%"))
    let l:command = "open -R " . shellescape("%")
  elseif getftype(expand("%:p:h")) == "dir"
    let l:command = "open " . shellescape("%") . ":p:h"
  else
    let l:command = "open ."
  endif

  execute ":silent! !" . l:command

  " For terminal Vim not to look messed up.
  redraw!
endfunction

command! Reveal call <SID>RevealInFinder()

" }}}
" Flow ------------------------------------------------------------ {{{

" Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'

if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif

if executable(local_flow)
  let g:flow#flowpath = local_flow
endif

let g:flow#showquickfix = 0
let g:flow#autoclose = 1

" }}}
" Custom Commands ------------------------------------------------- {{{
"
command! CloseOthers %bd|e#

" Trim whitespace
command! Trim %s/\s\+$//e

" Word wrap
command! Wrap setlocal wrap! linebreak nolist

" See all code TODOs
command! TODO Ag TODO|FIXME

" Edit Vimrc
command! Vimrc tabe $MYVIMRC
command! Aliases tabe ~/dotfiles/zsh/aliases
command! Zshrc tabe ~/dotfiles/zsh/zshrc
command! Tmuxconf tabe ~/dotfiles/tmux/tmux.conf
command! Reload source $MYVIMRC

" Count the occurences
command! Count :%~n

" Close all buffers
command! BDA bufdo Bdelete

" TODO: move to script
" Remove \ (caret M) from files
command! RemoveM %s/\//g

" Terminal commands
command! -nargs=* TermHorizontal split | terminal <args>
command! -nargs=* TermVertical vsplit | terminal <args>

" }}}
" Key Mappings ---------------------------------------------------- {{{

" Easily change the word under the cursor and repeat
nnoremap c* *Ncgn
nnoremap c# #NcgN

" Duplicate the current selection
vnoremap D y'>p

" Move to the next changed hunk
nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>

" Flip between two files
nnoremap <silent> <C-e> :e#<cr>
inoremap <silent> <C-e> <esc>:e#<cr>

" Move between open buffers.
nnoremap <C-n> :bnext<cr>
nnoremap <C-p> :bprev<cr>

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

" Don't yank to default register when changing something, e.g. ciw, ci(
nnoremap c "xc
xnoremap c "xc

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
nnoremap * *zzzv
nnoremap # #zzzv

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
nnoremap K :Ag \b<C-R><C-W>\b<cr>

" }}}
" Leader Mappings ------------------------------------------------- {{{

nnoremap <leader>c :checktime<cr>

nnoremap <Leader>v :FlowJumpToDef<cr>

nnoremap <Leader>s :Obsession ./.session.vim<cr>
nnoremap <Leader>d :source ./.session.vim<cr>

nnoremap <Leader>p :PrettierAsync<cr>:w<cr>

nnoremap <leader>o :ZoomToggle<cr>

nnoremap <leader>e :noh<cr>

nnoremap <leader>w :w<cr>

" Delete the current buffer without killing the pane
nnoremap <leader>x :Bdelete<cr>

nnoremap <leader>q :bd<cr>

" Refocus folds
nnoremap <leader>z zMzvzazAzz

" Fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>

nnoremap <leader>t :tabnew<cr>

" FZF
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>l :BLines<cr>

" Search
nnoremap <leader>a :Ag<space>

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

let g:prettier#exec_cmd_async = 1
let g:prettier#quickfix_enabled = 0
let g:prettier#autoformat = 0

" }}}
" --- ALE ----------------- {{{

let g:ale_linters = {
\  'javascript': ['flow', 'eslint']
\}

" let g:ale_fix_on_save = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>>'
let g:ale_statusline_format = ['X %d', '? %d', '']
let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_set_highlights = 0
let g:ale_lint_delay = 1000

" }}}
" --- Airline ------------- {{{

let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_paste = 0
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create(['%{fugitive#head()}'])

" }}}
" --- Ultisnips ----------- {{{

let g:UltiSnipsExpandTrigger="<c-j>"

" }}}
" --- MatchTagAlways ------ {{{

let g:mta_set_default_matchtag_color = 0
let g:mta_use_matchparen_group = 0

highlight MatchTag ctermfg=black ctermbg=darkgrey guifg=black guibg=darkgrey

" }}}
" --- Javascript ---------- {{{

set conceallevel=1
let g:javascript_plugin_flow = 1

" }}}
" --- FZF ----------------- {{{

function! s:GetRelativePath(targetFile)
  " When a file is chozen from FZF, the script gets the file path
  " relative to Vim's current working directory of vim (pwd). It
  " passes in an array. We need to join that array together before
  " operating on it.
  let targetFilePath = join(a:targetFile)

  " Convert the relative path to a full path
  let targetFileAbsolutePath = fnamemodify(targetFilePath, ':p')

  " Get the directory of the current open buffer
  let currentFileDirectory = expand('%:p:h')

  " Now call the Golang script (in dotfiles) that calculates
  " the relative path between the two paths
  let relativePath = system("relative-path " . currentFileDirectory . " " . targetFileAbsolutePath)

  " Now strip the extentions off the file
  let relPathNoExtension = system("strip-extension " . relativePath)

  " Remove any new lines from the path
  return substitute(relPathNoExtension, '\n\+$', '', '')
endfunction

" Get the relative path of a file
inoremap <expr> <c-h> fzf#complete(fzf#wrap({ 'reducer': function('<sid>GetRelativePath') }))

" }}}
" --- GitGutter ----------- {{{

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '-'


" }}}
" --- CloseTag ------------ {{{

let g:closetag_filenames = '*.html,*.xhtml,*.jsx'

" }}}
" --- Markdown ------------ {{{

let g:vim_markdown_conceal = 0

" }}}
" --- YouCompleteMe ------- {{{

" let b:vcm_tab_complete = "omni"
" let g:ycm_auto_trigger = 1

" }}}

" }}}
" Autocmd --------------------------------------------------------- {{{

" --- AutoSave/Read ------- {{{

augroup autoSaveAndRead
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold * silent! checktime
augroup END

" }}}
" --- CursorLine ---------- {{{

" Only show cursorline in the current window and in normal mode.
augroup cursor_line
    autocmd!
    autocmd WinEnter,InsertLeave * set cursorline
augroup END

" }}}
" --- Window Resize ------- {{{

" Resize panes when the window is resized
augroup window_resize
    autocmd!
    autocmd VimResized * :wincmd =
augroup END

" }}}
" --- Python -------------- {{{

augroup ft_python
    autocmd!
    autocmd FileType python setlocal foldmethod=indent
augroup END

" }}}
" --- Vim ----------------- {{{

augroup ft_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}
" --- CSS ----------------- {{{

augroup ft_css
    autocmd!
    autocmd BufNewFile,BufRead *.less setlocal filetype=less
    autocmd BufNewFile,BufRead *.scss setlocal filetype=sass
    autocmd BufNewFile,BufRead *.sass setlocal filetype=sass
    autocmd Filetype less,css,sass setlocal foldmethod=marker
    autocmd Filetype less,css,sass setlocal foldmarker={,}
augroup END

" }}}
" --- JSON ---------------- {{{

augroup ft_json
    autocmd!
    autocmd BufNewFile,BufRead *.json setlocal filetype=json
    autocmd FileType json setlocal foldmarker={,}
augroup END

" }}}
" --- Javascript ---------- {{{

augroup ft_javascript
    autocmd!
    autocmd FileType javascript setlocal foldmethod=syntax
augroup END

" }}}
" --- Misc ---------- {{{

" Remove trailing whitespace
augroup remove_trailing_whitespace
    autocmd!
    autocmd BufWritePre * :%s/\s\+$//e
augroup end

augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup end

" }}}

" }}}
