syntax on                                " Enable syntax highlighting
filetype plugin indent on                " Detect and handle filetypes

let mapleader = ","                      " Set leader key to comma
let maplocalleader = ","

set shell=/bin/zsh                       " Setting shell to zsh
set fileencoding=utf-8
set fileformat=unix
set fileformats=unix,mac,dos
set hidden                               " Allow unsaved buffers to be hidden
set showtabline=1                        " Hide tabs
set ruler                                " Turn on row,column dislay on status bar
set whichwrap+=<,>,h,l,[,]               " Backspace and cursor keys wrap too
set laststatus=2                         " Always show the statusline
set sidescroll=1                         " Number of columns to scroll horizontally
set sidescrolloff=10                     " Number of columns to keep to the left and right of cursor
set scrolloff=1                          " Number of rows to keep above/below the cursor
set mouse=a                              " Enable mouse
set clipboard=unnamed                    " Default to the system clipboard
set virtualedit=all                      " Allow the cursor to go in to invalid places in visual block mode
set breakindent
set shortmess+=cIA                        " Skip the splash screen, do not show swap file warnings
set spelllang=en_us                      " Set the spell check dictionary
set nowrap
set number                               " Display line numbers
set relativenumber                       " Use relative line numbers
set splitright                           " Split vertical windows right to the current windows
set splitbelow                           " Split horizontal windows below to the current windows
set autoread                             " Automatically reread changed files without asking me anything
set suffixesadd+=.js                     " Help VIM find JS and TS files when using gf
set suffixesadd+=.jsx
set suffixesadd+=.ts
set suffixesadd+=.tsx
set linebreak
set showbreak=\ ↪\
set ignorecase                           " Makes searches case insensitive if search string is all lower case
set infercase                            " Intelligently make searching case sensitive
set smartcase                            " Makes searches case SENSITIVE if search string contains an uppercase letter
set gdefault                             " Search/replace 'globally' (on a line) by default
set incsearch                            " Start searching before pressing enter
set inccommand=nosplit                   " Show the affect of substitution kjjjas you type it
set showmatch                            " Highlight the matching bracket when one is inserted
set hlsearch                             " Highlight search results (as you type)
set completeopt=menu,menuone
set diffopt+=vertical
set lazyredraw
set synmaxcol=800
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%m,%f:%l:%m
set iskeyword+=-                      	" Treat dash separated words as a word text object

" By default timeoutlen is 1000 ms
set timeoutlen=500

" https://github.com/neoclide/coc.nvim/wiki/F.A.Q#linting-is-slow
set updatetime=300

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

" Protect changes between writes
set swapfile
set directory^=~/.vim/swap/

" Protect against crash-during-write
set writebackup

" But do not persist backup after successful write
set nobackup

" Use rename-and-write-new method whenever safe
set backupcopy=auto

" Persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo/

" What actions open a fold?
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldlevelstart=99

" Default dictionary of all available words
" /usr/share/dict/words
"
" Custom words (like my name). Kept in version control.
" ~/.vim/custom-dictionary.utf-8.add
"
" More custom words.  This is *not* version controlled, so I can stick
" work stuff in here without leaking internal names and shit.
" ~/.vim-local-dictionary.utf-8.add
set dictionary=/usr/share/dict/words
set spellfile=~/dotfiles/vim/custom-dictionary.utf-8.add
set spellfile+=~/.vim-local-dictionary.utf-8.add

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


if has("gui_running")
  set guioptions-=T                        " Hide the toolbar
  set guioptions-=e                        " Don't use GUI tabs
  set guioptions-=L                        " Disable left scrollbar
  set guioptions-=r                        " Disable right scrollbar

  " Window size
  set lines=35 columns=115                 " Set the window size
endif

set tabline=%!MyTabLine()
set foldtext=FoldText()

let g:airline#extensions#coc#enabled = 1
let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx'
let g:vim_markdown_conceal = 0
