" Install vim-plug if not yet installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  " Once vim-plug is installed, install the plugins
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Finding/Navigation
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'

" Completion and Snippets
" Plug 'SirVer/ultisnips'
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

" Version Control
Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fubitive' " Set Gbrowse to work with Bitbucket
Plug 'junegunn/gv.vim'

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
Plug 'liuchengxu/vim-which-key'

" Language Support
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['markdown']
Plug 'moll/vim-node'
Plug 'suy/vim-context-commentstring'

" Color Schemes
Plug 'chriskempson/base16-vim'

" Tmux Support
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" All of your Plugins must be added before the following line
call plug#end()
