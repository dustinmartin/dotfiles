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
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tommcdo/vim-fubitive'

" Editor Usability
Plug 'wellle/targets.vim'
Plug 'andymass/vim-matchup'
Plug 'moll/vim-bbye'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'cohama/lexima.vim'
Plug 'alvan/vim-closetag'
Plug 'junegunn/vim-peekaboo'

" Language Support
Plug 'sheerun/vim-polyglot'
Plug 'moll/vim-node'
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
set shortmess+=IA                        " Skip the splash screen, do not show swap file warnings
set spelllang=en_us                      " Set the spell check dictionary
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

" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
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

if has("gui_running")
  set guioptions-=T                        " Hide the toolbar
  set guioptions-=e                        " Don't use GUI tabs
  set guioptions-=L                        " Disable left scrollbar
  set guioptions-=r                        " Disable right scrollbar

  " Window size
  set lines=35 columns=115                 " Set the window size
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

command! Finder call <SID>RevealInFinder()

" }}}
" Custom Commands ------------------------------------------------- {{{

" Helpful commands for handling sessions
command! SaveSession Obsession .
command! KillSession Obsession!
command! OpenSession source ./Session.vim

command! SpellFile tabe ~/dotfiles/vim/custom-dictionary.utf-8.add

command! SpellFileLocal tabe ~/.vim-local-dictionary.utf-8.add

command! FixSyntax syntax sync fromstart

command! CloseOthers %bd|e#

" Create commands for opening files in splits
command! -bar -complete=file -nargs=1 Vedit vsplit|edit <args>
command! -bar -complete=file -nargs=1 Hedit split|edit <args>

" Trim whitespace
command! Trim %s/\s\+$//e

" Word wrap
command! Wrap setlocal wrap! linebreak nolist
command! WrapAll set wrap! linebreak nolist

" Edit Vimrc
command! Vimrc tabe $MYVIMRC
command! Aliases tabe ~/dotfiles/zsh/aliases
command! Zshrc tabe ~/dotfiles/zsh/zshrc
command! Tmuxconf tabe ~/dotfiles/tmux/tmux.conf
command! Reload source $MYVIMRC

" Close all buffers
command! BDA bufdo Bdelete

" Remove \ (Windows line endings) from files
command! RemoveM %s/\//g

" Terminal commands
command! -nargs=* TermHorizontal split | terminal <args>
command! -nargs=* TermVertical vsplit | terminal <args>

" Run ESLint and populate the quick fix list
let local_eslint = findfile('node_modules/.bin/eslint', '.;')
let local_eslint_ignore = findfile('.eslintignore', '.;')

" TODO: Add if statement for when eslint or eslintignore doesn't exist
command! ESLint cexpr system(local_eslint . ' --cache --ext .tsx --ext .ts --ext .jsx --ext .js --ignore-path ' . local_eslint_ignore . ' --fix --format unix .')

" }}}
" Key Mappings ---------------------------------------------------- {{{

" Don't move on *
" I'd use a function for this but Vim clobbers the last search when you're in
" a function so fuck it, practicality beats purity.
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" There are three dictionaries I use for spell checking:
"
"   /usr/share/dict/words
"   Basic stuff.
"
"   ~/.vim/custom-dictionary.utf-8.add
"   Custom words (like my name).  This is in my (version-controlled) dotfiles.
"
"   ~/.vim-local-dictionary.utf-8.add
"   More custom words.  This is *not* version controlled, so I can stick
"   work stuff in here without leaking internal names and shit.
"
" I also remap zG to add to the local dict (vanilla zG is useless anyway).
set dictionary=/usr/share/dict/words
set spellfile=~/dotfiles/vim/custom-dictionary.utf-8.add,~/.vim-local-dictionary.utf-8.add
nnoremap zG 2zg
nnoremap zs :set spell!<cr>

" Easy resizing of panes
nnoremap <m-right> :vertical resize +3<cr>
nnoremap <m-left> :vertical resize -3<cr>
nnoremap <m-up> :resize +3<cr>
nnoremap <m-down> :resize -3<cr>

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

" }}}
" Leader Mappings ------------------------------------------------- {{{

nnoremap <leader>= :wincmd =<cr>
nnoremap <leader>c :checktime<cr>
nnoremap <leader>o :ZoomToggle<cr>
nnoremap <leader>e :noh<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>t :tabnew<cr>

" Refocus folds
nnoremap <leader>z zMzvzazAzz

nnoremap <Leader>p :Prettier<cr>

" Delete the current buffer without killing the pane
nnoremap <leader>x :Bdelete<cr>

" Fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gl :GV!<cr>

" FZF
nnoremap <leader>f :Files<cr>
nnoremap <leader>r :History<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>d :GFiles?<cr>
nnoremap <leader>: :History:<cr>
nnoremap <leader>/ :History/<cr>
nnoremap <leader>? :Helptags<cr>
nnoremap <leader>s :Snippets<cr>

nnoremap <leader>a :Ag!<space>

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

" --- Airline ------------- {{{

let g:airline#extensions#whitespace#enabled = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_detect_paste = 0
let g:airline_section_b = ''
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = airline#section#create(['%{fugitive#head()}'])
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" }}}
" --- Ultisnips ----------- {{{

let g:UltiSnipsExpandTrigger="<c-j>"

" }}}
" --- FZF ----------------- {{{

function! s:all_files()
  return extend(
        \ filter(copy(v:oldfiles),
        \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
        \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

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
" --- CloseTag ------------ {{{

let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx'

" }}}
" --- Markdown ------------ {{{

let g:vim_markdown_conceal = 0

" }}}
" --- COC ----------------- {{{

command! -nargs=0 Prettier :CocCommand prettier.formatFile

let g:coc_global_extensions = [
  \ 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-git',
  \ 'coc-css', 'coc-json', 'coc-ultisnips', 'coc-yaml',
  \ 'coc-html'
  \ ]

" Allow tabbing through completion menu
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Rename the symbol under the cursor
command! -nargs=* RenameSymbol call CocAction('rename') <args>

" Do the suggested quickfix
command! -nargs=* FixIt call CocAction('doQuickfix') <args>

" Show the diagnostic message (usually an error)
command! -nargs=* Diagnose call CocAction('diagnosticInfo') <args>

" Use `[c` and `]c` to view errors reported by COC
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Move to the next changed hunk
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)

" Shortcuts for jumping to definitions and viewing references
" nnoremap <silent> gd :call CocAction('jumpDefinition')<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh <Plug>(coc-diagnostic-info)

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

" }}}

" }}}
" Autocmd --------------------------------------------------------- {{{

" Syntax folding can be extremely slow so disable for long files
augroup disable_syntax_folding
  autocmd!
  autocmd BufWinEnter *
        \ if line2byte(line("$") + 1) > 500 |
        \    setlocal foldmethod=indent |
        \ endif
augroup END

" --- Return to Line ------ {{{

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" --- AutoSave/Read ------- {{{

augroup autoSaveAndRead
  autocmd!
  autocmd TextChanged,InsertLeave,FocusLost * silent! wall
  autocmd CursorHold * silent! checktime
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
  autocmd FileType json setlocal foldmethod=syntax
augroup END

" }}}
" --- Javascript ---------- {{{

augroup ft_javascript
  autocmd!
  autocmd FileType javascript setlocal foldmethod=syntax
  autocmd BufNewFile,BufRead .eslintrc setlocal filetype=JavaScript
  autocmd BufNewFile,BufRead .babelrc setlocal filetype=JavaScript
  autocmd BufNewFile,BufRead *.snap setlocal filetype=JavaScript
augroup END

augroup ft_typescript
  autocmd!
  autocmd FileType typescript setlocal foldmethod=syntax
  autocmd FileType typescript UltiSnipsAddFiletypes javascript
augroup END

" }}}
" --- Shell --------------- {{{

augroup ft_zsh
  autocmd!
  autocmd BufNewFile,BufRead *aliases setlocal filetype=zsh
  autocmd BufNewFile,BufRead *zsh* setlocal filetype=zsh
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
