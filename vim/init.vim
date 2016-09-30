" Author: Dustin Martin <dm@dustinmartin.net>
" Source: https://github.com/dustinmartin/dotfiles

" Plugins --------------------------------------------------------- {{{
"
" Load vim-plug
if empty(glob("~/.config/nvim/autoload/plug.vim"))
  execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.config/nvim/plugged')

" Finding/Navigation
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  ['NERDTree', 'NERDTreeToggle', 'NERDTreeFind'] }
Plug 'tpope/vim-unimpaired'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Completion and Snippets
Plug 'SirVer/ultisnips'
" Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Editor Usability
Plug 'kshenoy/vim-signature'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'xolox/vim-session' | Plug 'xolox/vim-misc'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'editorconfig/editorconfig-vim'
Plug 'benekastah/neomake', { 'on':  ['Neomake'] }
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-repeat'
Plug 'chip/vim-fat-finger'
Plug 'tpope/vim-eunuch'
Plug 'easymotion/vim-easymotion'
Plug 'pelodelfuego/vim-swoop'

" Code Modification
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular', { 'on':  'Tabularize' }
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'

" Language Support
Plug 'sheerun/vim-polyglot'
Plug 'othree/javascript-libraries-syntax.vim'

" Color Schemes
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'raphamorim/lucario'
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jacoborus/tender'
Plug 'trevordmiller/nova-vim'
Plug 'mhartington/oceanic-next'

" All of your Plugins must be added before the following line
call plug#end()

" }}}
" Vim Settings ---------------------------------------------------- {{{

" let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on                                " Enable syntax highlighting
filetype plugin indent on                " Detect and handle filetypes

let mapleader = ","                      " Set leader key to comma
let maplocalleader = "\\"

if has('nvim')
    " Fix <ctrl>+h for vim-tmux-navigator
    nmap <BS> <C-W>h

    " Change cursor shape in insert mode
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif

" colorscheme OceanicNext
" set background=dark

let g:seoul256_background = 236
let g:airline_theme='zenburn'
colorscheme seoul256

" colorscheme nova

" colorscheme tender
" let g:airline_theme = 'tender'

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
set cursorline                           " Highlights the cursor line
set laststatus=2                         " Always show the statusline
set textwidth=0                          " Prevent Vim from wrapping lines
set wrapmargin=0                         " Prevent Vim from wrapping lines
set sidescroll=1                         " Number of columns to scroll horizontally
set sidescrolloff=10                     " Number of columns to keep to the left and right of cursor
set scrolloff=1                          " Number of rows to keep above/below the cursor
set mouse=a                              " Enable mouse
set showcmd                              " Show command in bottom right of window
set clipboard=unnamed                    " Default to the system clipboard
set showmode                             " Don't show the current Vim mode
set lazyredraw                           " Don't update the display while executing macros
set wrapscan                             " Set the search scan to wrap around the file
set virtualedit=block                    " Allow the cursor to go in to invalid places in visual block mode
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
set switchbuf=newtab                     " Open new buffers always in new tabs
set splitright                           " Split vertical windows right to the current windows
set splitbelow                           " Split horizontal windows below to the current windows
set autoread                             " Automatically reread changed files without asking me anything
set suffixesadd+=.js                     " Help VIM find .js files when using gf
set list
set listchars=tab:»\ ,eol:\ ,trail:·,extends:❯,precedes:❮
set ignorecase                           " Makes searches case insensitive if search string is all lower case
set smartcase                            " Makes searches case SENSITIVE if search string contains an uppercase letter
set gdefault                             " Search/replace 'globally' (on a line) by default
set incsearch                            " Start searching before pressing enter
set showmatch                            " Highlight the matching bracket when one is inserted
set hlsearch                             " Highlight search results (as you type)
set noswapfile
set nobackup
set undolevels=1000                      " The number of undo levels to allow
set complete-=i
set formatoptions-=r                     " Don't add comment prefix to next line
set colorcolumn=120
set completeopt=menu,menuone

" What actions open a fold?
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldlevel=0

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
" GUI Settings ---------------------------------------------------- {{{

if has("gui_running")

    " Set the tab labels
    set guitablabel=%t\ %m

    set guioptions-=T                        " Hide the toolbar
    set guioptions-=e                        " Don't use GUI tabs
    set guioptions-=L                        " Disable left scrollbar
    set guioptions-=r                        " Disable right scrollbar

    " Set the font
    set guifont=Source\ Code\ Pro:h17             " Set the font style and size

    " Window size
    " set lines=35 columns=115                 " Set the window size

endif

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

" See all code TODOs
" command! TODO Ag! TODO\|FIXME

" Edit Vimrc
command! Vimrc tabedit $MYVIMRC
command! Reload source $MYVIMRC

" Close all buffers
" command! BDA 1,1000 bd
command! BDA bufdo bd

" Set filetype to Javascript
command! SetJS set ft=javscript
" command! RunJS :!node %

" Format the JSON in the current file
command! -bar ToJSON %!python -m json.tool
command! SetJSON set ft=json
command! FormatJSON ToJSON|SetJSON

" Format Selected XML
command! -bar ToXML silent %!xmllint --encode UTF-8 --format -
command! SetXML set ft=xml
command! FormatXML ToXML|SetXML

" Remove \ (caret M) from files
command! RemoveM %s/\//g

" }}}
" Key Mappings ---------------------------------------------------- {{{

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
noremap H ^
noremap L $
vnoremap L g_

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

" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
imap <C-Up> <esc>[e
imap <C-Down> <esc>]e

" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Keep a block selected after indenting
vnoremap < <gv
vnoremap > >gv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Map ESC
imap jj <ESC>

" Movement by screen line instead of file line
nnoremap j gj
nnoremap k gk

nnoremap <down> gj
nnoremap <up> gk

" Remap ; to :
vnoremap ; :
nnoremap ; :

" }}}
" Leader Mappings ------------------------------------------------- {{{

" Open scratch file
" nnoremap <leader>s :vsplit ~/Desktop/Scratch.txt<CR>

" Refocus folds
nnoremap <leader>z zMzvzazAzz

" Change quotation marks
nnoremap <Leader>"" :%s/'/"<CR>
nnoremap <Leader>'' :%s/"/'<CR>

" Trim Whitespace
nnoremap <Leader>ws :%s/\s\+$//e<CR>

" Fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>

nnoremap <leader>t :tabnew<CR>
vnoremap <leader>t :tabnew<CR>

" nnoremap <Leader>sp :set spell!<CR>

nnoremap <leader>ww :set wrap! linebreak nolist<CR>

" Preserve indentation while pasting text from the os x clipboard
" nnoremap <leader>p :set paste<cr>:put  *<cr>:set nopaste<cr>

" Toggle nerdtree
vnoremap <leader>nt <ESC> :NERDTreeToggle<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

" Open up current file in NERDTree
nnoremap <leader>nf :NERDTree<CR><C-w>p:NERDTreeFind<CR>

" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
" nnoremap <leader>l :Lines<CR>

" nnoremap <leader>b :CtrlPBuffer<CR>
" nnoremap <leader>f :CtrlP<CR>
" nnoremap <leader>d :CtrlPBookmarkDir<CR>
" nnoremap <leader>l :CtrlPLine<CR>

" Tabularize
nnoremap <Leader>a= :Tabularize /=<CR>
vnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a: :Tabularize /:<CR>
vnoremap <Leader>a: :Tabularize /:<CR>
vnoremap <Leader>a, :Tabularize /[^,]\+,<CR>
nnoremap <Leader>a, :Tabularize /[^,]\+,<CR>

" Ag
nnoremap <leader>ag :Ag 

nnoremap <leader>c :checktime<CR>

" }}}
" Folding --------------------------------------------------------- {{{

function! CustomFoldText()

    "get first non-blank line
    let fs = v:foldstart

    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile

    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(" ", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))

    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr

endfunction

set foldtext=CustomFoldText()

" }}}
" Plugin Settings ------------------------------------------------- {{{

" --- Session ------------- {{{

" let g:session_autosave = 'yes'
" let g:session_autoload = 'yes'
" let g:session_default_to_last = 1

" }}}
" --- Nerdtree ------------ {{{

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=0

" Show hidden files, too
let NERDTreeShowFiles=1

" Quit on opening files from the tree
let NERDTreeQuitOnOpen=0

" Highlight the selected entry in the tree
let NERDTreeHighlightCursorline=1

" Use a single click to fold/unfold directories and a double click to open files
let NERDTreeMouseMode=2

" Allow NerdTree to change Vim's CD
let NERDTreeChDirMode=2

" Automatically remove a buffer when a file is being deleted or renamed via a context menu command
let NERDTreeAutoDeleteBuffer=1

" }}}
" --- Neomake ------------- {{{

autocmd! BufWritePost * Neomake

let g:neomake_javascript_eslint_exe = $PWD .'/node_modules/.bin/eslint'
let g:neomake_javascript_jscs_exe = $PWD .'/node_modules/.bin/jscs'

let g:neomake_javascript_enabled_makers = ['jscs', 'eslint']

" }}}
" --- CtrlP --------------- {{{

" Search by filename
" let g:ctrlp_by_filename = 1
" let g:ctrlp_tabpage_position= 'al'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_custom_ignore = {
"     \ 'dir':  '\v[\/]\.(git|hg|svn)$|node_modules',
"     \ 'file': '\v\.(jpg|jpeg|png|gif|zip|pdf|dmg)$'
"     \ }

" let g:ctrlp_working_path_mode = 0
" let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"       \ --ignore .git
"       \ --ignore .svn
"       \ --ignore .hg
"       \ --ignore .DS_Store
"       \ --ignore "**/*.pyc"
"       \ -g ""'

" }}}
" --- Airline ------------- {{{

let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep=''
let g:airline_right_sep=''

" }}}
" --- Ultisnips ----------- {{{

let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsListSnippets="<c-s-space>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" }}}
" --- Javascript Lib ------ {{{

let g:used_javascript_libs = 'angularjs,jquery,underscore,chai,react,flux'
let g:jsx_ext_required = 0

" }}}
" --- Indent Guides ------- {{{

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 1

" }}}
" --- MatchTagAlways ------ {{{

let g:mta_set_default_matchtag_color = 0
let g:mta_use_matchparen_group = 0

highlight MatchTag ctermfg=black ctermbg=darkgrey guifg=black guibg=darkgrey

" }}}
" --- Go ------------------ {{{

let g:go_auto_type_info = 1
let g:go_highlight_methods = 1

" }}}
" --- YouCompleteMe ------- {{{

" let g:ycm_collect_identifiers_from_comments_and_strings = 1
" let g:ycm_complete_in_comments = 1

" }}}
" --- EasyMotion ---------- {{{

let g:EasyMotion_do_mapping = 1 " Disable default mappings
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'abcdehijlmnopqrstuvwxyzfgkj'

hi EasyMotionTarget2First cterm=bold gui=bold ctermbg=none ctermfg=red
hi EasyMotionTarget2Second cterm=bold gui=bold ctermbg=none ctermfg=lightred

" }}}
" Autocmd --------------------------------------------------------- {{{

augroup misc_fixes
    " Fix vim/tmux from displaying ^[[o when switching to another tmux pane
    " au FocusGained * silent redraw!
    au FocusGained,BufEnter,CursorHold,CursorHoldI * checktime
augroup END

" Only show cursorline in the current window and in normal mode.
augroup cursor_line
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" --- Window Resize ------- {{{

augroup window_resize
    au!
    au VimResized * :wincmd =
augroup END

" }}}
" --- Vim ----------------- {{{

augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
    " au FileType help setlocal textwidth=78
    " au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
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

    au BufRead,BufNewFile *.css setlocal shiftwidth=4 softtabstop=4
    au BufRead,BufNewFile *.less setlocal shiftwidth=4 softtabstop=4
    au BufRead,BufNewFile *.scss setlocal shiftwidth=4 softtabstop=4
    au BufRead,BufNewFile *.sass setlocal shiftwidth=4 softtabstop=4

    " Use <leader>S to sort properties.  Turns this:
    au BufNewFile,BufRead *.less,*.css,*.scss nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
augroup END

" }}}
" --- Java ---------------- {{{

augroup ft_java
    au!

    au FileType java setlocal foldmethod=marker
    au FileType java setlocal foldmarker={,}
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

    au FileType javascript map <buffer> <F2> :!node % <CR>
    " au FileType javascript setlocal foldmethod=syntax
    au FileType javascript setlocal foldmethod=marker
    au FileType javascript setlocal foldmarker={,}

augroup END

" }}}
" --- Markdown ------------ {{{

augroup ft_markdown
    au!

    au BufNewFile,BufRead *.m*down setlocal filetype=markdown foldlevel=1
    au BufNewFile,BufRead *.md setlocal filetype=markdown foldlevel=1

    " Use <localleader>1/2/3 to add headings.
    au Filetype markdown nnoremap <buffer> <localleader>1 I#<space><ESC>
    au Filetype markdown nnoremap <buffer> <localleader>2 I##<space><ESC>
    au Filetype markdown nnoremap <buffer> <localleader>3 I###<space><ESC>

    au Filetype markdown nnoremap <buffer> <localleader>h mzI#<ESC>`zl

augroup END

" }}}
" --- Ruby ---------------- {{{

augroup ft_ruby
    au!

    au Filetype ruby setlocal foldmethod=syntax

    au BufRead,BufNewFile Gemfile setlocal filetype=ruby
    au BufRead,BufNewFile Capfile setlocal filetype=ruby
    au BufRead,BufNewFile *.rabl setlocal filetype=ruby

    au BufRead,BufNewFile *.rb setlocal shiftwidth=2 softtabstop=2
    au BufRead,BufNewFile *.rabl setlocal shiftwidth=2 softtabstop=2

augroup END

" }}}
" --- Scala --------------- {{{

augroup ft_scala
    au!
    au Filetype scala setlocal foldmethod=marker foldmarker={,}
augroup END

" }}}
" --- Vagrant ------------- {{{

augroup ft_vagrant
    au!
    au BufRead,BufNewFile Vagrantfile setlocal filetype=ruby
augroup END

" }}}
" --- HTML ---------------- {{{

augroup ft_html
    au!

    au FileType html setlocal foldmethod=manual

    " Use <localleader>f to fold the current tag.
    au FileType html nnoremap <buffer> <localleader>f Vatzf

    " Indent tag
    au FileType html nnoremap <buffer> <localleader>= Vat=

    " Don't highlight HTML links
    " au FileType html :hi link htmlLink NONE<CR>

augroup END

" }}}
" --- Yaml ---------------- {{{

augroup ft_yaml
    au!

    au BufNewFile,BufRead *.yml setlocal filetype=yaml

    au Filetype yaml setlocal foldmethod=indent
    au Filetype yaml setlocal shiftwidth=2 softtabstop=2

augroup END

" }}}
" --- Go ------------------ {{{

augroup ft_go
    au!

    au FileType go setlocal foldmethod=marker
    au FileType go setlocal foldmarker={,}

augroup END

" }}}
" --- XML ----------------- {{{

augroup ft_xml
    au!

    au FileType xml setlocal foldmethod=indent
    au Filetype xml setlocal foldmethod=indent
    au Filetype xml setlocal shiftwidth=2 softtabstop=2

augroup END

" }}}

" }}}
