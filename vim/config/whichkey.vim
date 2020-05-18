 " Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey ','<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual ','<CR>

let g:which_key_map =  {}

" Don't use floating window
let g:which_key_use_floating_win = 0

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler

let g:which_key_map['O'] = [ ':source ./Session.vim'      , 'open session' ]
let g:which_key_map['S'] = [ ':Obsession .'               , 'save session' ]
let g:which_key_map['a'] = [ ':Ag'                        , 'search text' ]
let g:which_key_map['d'] = [ ':bd'                        , 'delete buffer' ]
let g:which_key_map['e'] = [ ':let @/ = ""'               , 'no highlight' ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['p'] = [ '<Plug>(coc-format)'         , 'format file' ]
let g:which_key_map['t'] = [ ':tabnew'                    , 'new tab' ]
let g:which_key_map['z'] = [ 'zMzvzazAzz'                 , 'focus fold' ]
let g:which_key_map['b'] = [ ':Buffers'                   , 'search buffers' ]
let g:which_key_map['w'] = [ ':w'                         , 'save file' ]

let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Rg'           , 'text'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ }

let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'A' : [':Git add -u .'                                    , 'stage all files'],
      \ 'a' : [':Git add %'                                       , 'stage current file'],
      \ 'b' : [':Git blame'                                       , 'blame'],
      \ 'B' : [':Gbrowse'                                         , 'browse'],
      \ 'w' : [':!git add -A && git commit --no-verify -m "WIP"'  , 'wip commit'],
      \ 'd' : [':Git diff'                                        , 'diff'],
      \ 'D' : [':Gdiffsplit'                                      , 'diff split'],
      \ 's' : [':Gstatus'                                         , 'status'],
      \ 'l' : [':Git log'                                         , 'log'],
      \ 'p' : [':Git push --no-verify'                            , 'push'],
      \ 'P' : [':Git pull'                                        , 'pull'],
      \ 'R' : [':GRemove'                                         , 'remove'],
      \ 'r' : [':Gread'                                           , 'read'],
      \ 'v' : [':GV'                                              , 'view commits'],
      \ 'V' : [':GV!'                                             , 'view buffer commits'],
      \ }

let g:which_key_map.B = {
      \ 'name' : '+buffers' ,
      \ 'x' : ['<C-W>c'                   , 'close window'],
      \ 'd' : [':bd'                      , 'close buffer'],
      \ 'a' : [':bufdo Bdelete'           , 'close all buffers'],
      \ 'o' : [':%bd|e#'                  , 'close other buffers'],
      \ '=' : ['<C-W>='                   , 'balance window panes'] ,
      \ 'h' : ['<C-W>s'                   , 'horizontal split'],
      \ 'v' : ['<C-W>v'                   , 'vertical split'],
      \ 'w' : ['Windows'                  , 'list windows'],
      \ 'b' : [':Buffers'                 , 'list buffers'],
      \ }



let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'list diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : [':CocAction quickfix'                 , 'quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }
                    " CocAction('diagnosticInfo')
let g:which_key_map.u = {
      \ 'name' : '+utils' ,
      \ 'n' : [':set nonumber!'                      , 'line numbers'],
      \ 'r' : [':set norelativenumber!'              , 'relative line numbers'],
      \ 'c' : [':checktime'                          , 'checktime'],
      \ '.' : [':tabe $MYVIMRC'                      , 'open vim config'],
      \ ';' : [':source $MYVIMRC'                    , 'reload vim config'],
      \ 'w' : [':setlocal wrap! linebreak nolist'    , 'wrap line (file)'],
      \ 'W' : [':set wrap! linebreak nolist'         , 'wrap line (all)'],
      \ 't' : [':%s/\s\+$//e'                        , 'trim whitespace'],
      \ 'f' : [':syntax sync fromstart'              , 'fix syntax'],
      \ 's' : [':Finder'                             , 'open in Finder'],
      \ 'p' : [':%!python -m json.tool'              , 'format json'],
      \ 'y' : [':set spell!'                         , 'toggle spell check'],
      \ 'h' : ['zg'                                  , 'add word (public)'],
      \ 'g' : ['2zg'                                 , 'add word (private)'],
      \ }

call which_key#register(',', "g:which_key_map")

" Setup whichkey to work with the 'g' prefix key
" ===========================================================

nnoremap <silent><nowait> [G] :<c-u>WhichKey 'g'<cr>
nmap g [G]
let g:which_key_g= {}
let g:which_key_g['<C-G>'] = ['call feedkeys("g\<c-g>", "n")', 'show cursor info']
nnoremap g<c-g> g<c-g>
let g:which_key_g['&'] = ['call feedkeys("g&", "n")', 'repeat last ":s" on all lines']
nnoremap g& g&

let g:which_key_g["'"] = ['call feedkeys("g' . "'" . '", "n")', 'jump to mark']
nnoremap g' g'
let g:which_key_g['`'] = ['call feedkeys("g' . '`' . '", "n")', 'jump to mark']
nnoremap g` g`

let g:which_key_g['+'] = ['call feedkeys("g+", "n")', 'newer text state']
nnoremap g+ g+
let g:which_key_g['-'] = ['call feedkeys("g-", "n")', 'older text state']
nnoremap g- g-
let g:which_key_g[','] = ['call feedkeys("g,", "n")', 'newer position in change list']
nnoremap g, g,
let g:which_key_g[';'] = ['call feedkeys("g;", "n")', 'older position in change list']
nnoremap g; g;
let g:which_key_g['@'] = ['call feedkeys("g@", "n")', 'call operatorfunc']
nnoremap g@ g@

let g:which_key_g['#'] = ['call feedkeys("\<Plug>(incsearch-nohl-g#)")', 'search under cursor backward']
let g:which_key_g['*'] = ['call feedkeys("\<Plug>(incsearch-nohl-g*)")', 'search under cursor forward']
let g:which_key_g['/'] = ['call feedkeys("\<Plug>(incsearch-stay)")', 'stay incsearch']
let g:which_key_g['$'] = ['call feedkeys("g$", "n")', 'go to rightmost character']
nnoremap g$ g$
let g:which_key_g['<End>'] = ['call feedkeys("g$", "n")', 'go to rightmost character']
nnoremap g<End> g<End>
let g:which_key_g['0'] = ['call feedkeys("g0", "n")', 'go to leftmost character']
nnoremap g0 g0
let g:which_key_g['<Home>'] = ['call feedkeys("g0", "n")', 'go to leftmost character']
nnoremap g<Home> g<Home>
let g:which_key_g['e'] = ['call feedkeys("ge", "n")', 'go to end of previous word']
nnoremap ge ge
let g:which_key_g['<'] = ['call feedkeys("g<", "n")', 'last page of previous command output']
nnoremap g< g<
let g:which_key_g['f'] = ['call feedkeys("gf", "n")', 'edit file under cursor']
nnoremap gf gf
let g:which_key_g['F'] = ['call feedkeys("gF", "n")', 'edit file under cursor(jump to line after name)']
nnoremap gF gF
let g:which_key_g['j'] = ['call feedkeys("gj", "n")', 'move cursor down screen line']
nnoremap gj gj
let g:which_key_g['k'] = ['call feedkeys("gk", "n")', 'move cursor up screen line']
nnoremap gk gk
let g:which_key_g['u'] = ['call feedkeys("gu", "n")', 'make motion text lowercase']
nnoremap gu gu
let g:which_key_g['E'] = ['call feedkeys("gE", "n")', 'end of previous word']
nnoremap gE gE
let g:which_key_g['U'] = ['call feedkeys("gU", "n")', 'make motion text uppercase']
nnoremap gU gU
let g:which_key_g['H'] = ['call feedkeys("gH", "n")', 'select line mode']
nnoremap gH gH
let g:which_key_g['h'] = ['call feedkeys("gh", "n")', 'select mode']
nnoremap gh gh
let g:which_key_g['I'] = ['call feedkeys("gI", "n")', 'insert text in column 1']
nnoremap gI gI
let g:which_key_g['i'] = ['call feedkeys("gi", "n")', "insert text after '^ mark"]
nnoremap gi gi
let g:which_key_g['J'] = ['call feedkeys("gJ", "n")', 'join lines without space']
nnoremap gJ gJ
let g:which_key_g['N'] = ['call feedkeys("gN", "n")', 'visually select previous match']
nnoremap gN gN
let g:which_key_g['n'] = ['call feedkeys("gn", "n")', 'visually select next match']
nnoremap gn gn
let g:which_key_g['Q'] = ['call feedkeys("gQ", "n")', 'switch to Ex mode']
nnoremap gQ gQ
let g:which_key_g['q'] = ['call feedkeys("gq", "n")', 'format Nmove text']
nnoremap gq gq
let g:which_key_g['R'] = ['call feedkeys("gR", "n")', 'enter VREPLACE mode']
nnoremap gR gR
let g:which_key_g['T'] = ['call feedkeys("gT", "n")', 'previous tag page']
nnoremap gT gT
let g:which_key_g['t'] = ['call feedkeys("gt", "n")', 'next tag page']
nnoremap gt gt
let g:which_key_g[']'] = ['call feedkeys("g]", "n")', 'tselect cursor tag']
nnoremap g] g]
let g:which_key_g['^'] = ['call feedkeys("g^", "n")', 'go to leftmost no-white character']
nnoremap g^ g^
let g:which_key_g['_'] = ['call feedkeys("g_", "n")', 'go to last char']
nnoremap g_ g_
let g:which_key_g['~'] = ['call feedkeys("g~", "n")', 'swap case for Nmove text']
nnoremap g~ g~
let g:which_key_g['a'] = ['call feedkeys("ga", "n")', 'print ascii value of cursor character']
nnoremap ga ga
let g:which_key_g['g'] = ['call feedkeys("gg", "n")', 'go to line N']
nnoremap gg gg
let g:which_key_g['m'] = ['call feedkeys("gm", "n")', 'go to middle of screenline']
nnoremap gm gm
let g:which_key_g['o'] = ['call feedkeys("go", "n")', 'goto byte N in the buffer']
nnoremap go go
let g:which_key_g.s = ['call feedkeys("gs", "n")', 'sleep N seconds']
nnoremap gs gs
let g:which_key_g['v'] = ['call feedkeys("gv", "n")', 'reselect the previous Visual area']
nnoremap gv gv
let g:which_key_g['<C-]>'] = ['call feedkeys("g<c-]>", "n")', 'jump to tag under cursor']
nnoremap g<c-]> g<c-]>
" let g:which_key_g['d'] = ['call SpaceVim#mapping#gd()', 'goto definition']
" call SpaceVim#mapping#def('nnoremap <silent>', 'gd', ':call SpaceVim#mapping#gd()<CR>', 'Goto declaration', '')

call which_key#register('g', "g:which_key_g")

" Setup whichkey to work with the 'z' prefix key
" ===========================================================

nnoremap <silent><nowait> [Z] :<c-u>WhichKey "z"<CR>
nmap z [Z]
let g:which_key_z = {}
let g:which_key_z['<CR>'] = ['call feedkeys("z\<CR>", "n")', 'cursor line to top']
nnoremap z<CR> z<CR>
let g:which_key_z['+'] = ['call feedkeys("z+", "n")', 'cursor to screen top line N']
nnoremap z+ z+
let g:which_key_z['-'] = ['call feedkeys("z-", "n")', 'cursor to screen bottom line N']
nnoremap z- z-
let g:which_key_z['^'] = ['call feedkeys("z^", "n")', 'cursor to screen bottom line N']
nnoremap z^ z^
let g:which_key_z['.'] = ['call feedkeys("z.", "n")', 'cursor line to center']
nnoremap z. z.
let g:which_key_z['='] = ['call feedkeys("z=", "n")', 'spelling suggestions']
nnoremap z= z=
let g:which_key_z['A'] = ['call feedkeys("zA", "n")', 'toggle folds recursively']
nnoremap zA zA
let g:which_key_z['C'] = ['call feedkeys("zC", "n")', 'close folds recursively']
nnoremap zC zC
let g:which_key_z['D'] = ['call feedkeys("zD", "n")', 'delete folds recursively']
nnoremap zD zD
let g:which_key_z['E'] = ['call feedkeys("zE", "n")', 'eliminate all folds']
nnoremap zE zE
let g:which_key_z['F'] = ['call feedkeys("zF", "n")', 'create a fold for N lines']
nnoremap zF zF
let g:which_key_z['G'] = ['call feedkeys("zG", "n")', 'mark good spelled(update internal-wordlist)']
nnoremap zG zG
let g:which_key_z['H'] = ['call feedkeys("zH", "n")', 'scroll half a screenwidth to the right']
nnoremap zH zH
let g:which_key_z['L'] = ['call feedkeys("zL", "n")', 'scroll half a screenwidth to the left']
nnoremap zL zL
let g:which_key_z['M'] = ['call feedkeys("zM", "n")', 'set `foldlevel` to zero']
nnoremap zM zM
let g:which_key_z['N'] = ['call feedkeys("zN", "n")', 'set `foldenable`']
nnoremap zN zN
let g:which_key_z['O'] = ['call feedkeys("zO", "n")', 'open folds recursively']
nnoremap zO zO
let g:which_key_z['R'] = ['call feedkeys("zR", "n")', 'set `foldlevel` to deepest fold']
nnoremap zR zR
let g:which_key_z['W'] = ['call feedkeys("zW", "n")', 'mark wrong spelled']
nnoremap zW zW
let g:which_key_z['X'] = ['call feedkeys("zX", "n")', 're-apply `foldleve`']
nnoremap zX zX
let g:which_key_z['a'] = ['call feedkeys("za", "n")', 'toggle a fold']
nnoremap za za
let g:which_key_z['b'] = ['call feedkeys("zb", "n")', 'redraw, cursor line at bottom']
nnoremap zb zb
let g:which_key_z['c'] = ['call feedkeys("zc", "n")', 'close a fold']
nnoremap zc zc
let g:which_key_z['d'] = ['call feedkeys("zd", "n")', 'delete a fold']
nnoremap zd zd
let g:which_key_z['e'] = ['call feedkeys("ze", "n")', 'right scroll horizontally to cursor position']
nnoremap ze ze
let g:which_key_z['f'] = ['call feedkeys("zf", "n")', 'create a fold for motion']
nnoremap zf zf
let g:which_key_z['g'] = ['call feedkeys("zg", "n")', 'mark good spelled']
nnoremap zg zg
let g:which_key_z['h'] = ['call feedkeys("zh", "n")', 'scroll screen N characters to right']
nnoremap zh zh
let g:which_key_z['<Left>'] = ['call feedkeys("zh", "n")', 'scroll screen N characters to right']
nnoremap z<Left> zh
let g:which_key_z['i'] = ['call feedkeys("zi", "n")', 'toggle foldenable']
nnoremap zi zi
let g:which_key_z['j'] = ['call feedkeys("zj", "n")', 'move to start of next fold']
nnoremap zj zj
let g:which_key_z['J'] = ['call feedkeys("zjzx", "n")', 'move to and open next fold']
nnoremap zJ zjzx
let g:which_key_z['k'] = ['call feedkeys("zk", "n")', 'move to end of previous fold']
nnoremap zk zk
let g:which_key_z['K'] = ['call feedkeys("zkzx", "n")', 'move to and open previous fold']
nnoremap zK zkzx
let g:which_key_z['l'] = ['call feedkeys("zl", "n")', 'scroll screen N characters to left']
nnoremap zl zl
let g:which_key_z['<Right>'] = ['call feedkeys("zl", "n")', 'scroll screen N characters to left']
nnoremap z<Right> zl
let g:which_key_z['m'] = ['call feedkeys("zm", "n")', 'subtract one from `foldlevel`']
nnoremap zm zm
let g:which_key_z['n'] = ['call feedkeys("zn", "n")', 'reset `foldenable`']
nnoremap zn zn
let g:which_key_z['o'] = ['call feedkeys("zo", "n")', 'open fold']
nnoremap zo zo
let g:which_key_z['r'] = ['call feedkeys("zr", "n")', 'add one to `foldlevel`']
nnoremap zr zr
let g:which_key_z.s = ['call feedkeys("zs", "n")', 'left scroll horizontally to cursor position']
nnoremap zs zs
let g:which_key_z['t'] = ['call feedkeys("zt", "n")', 'cursor line at top of window']
nnoremap zt zt
let g:which_key_z['v'] = ['call feedkeys("zv", "n")', 'open enough folds to view cursor line']
nnoremap zv zv
let g:which_key_z['x'] = ['call feedkeys("zx", "n")', 're-apply foldlevel and do "zV"']
nnoremap zx zx
" smart scroll
let g:which_key_z['z'] = ['call feedkeys("zz", "n")', 'smart scroll']
nnoremap zz zz

call which_key#register('z', "g:which_key_z")
