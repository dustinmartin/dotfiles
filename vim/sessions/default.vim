" ~/Config/vim/sessions/default.vim:
" Vim session script.
" Created by session.vim 2.4.8 on 18 August 2013 at 18:00:44.
" Open this file in Vim and run :source % to restore your session.

set guioptions=egm
silent! set guifont=Ubuntu\ Mono:h18
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'molokai' | colorscheme molokai | endif
call setqflist([{'lnum': 974, 'col': 26, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/components.js', 'text': '        else if (snippet.typeCode==''group'') return ''group-snippet-template'';'}, {'lnum': 975, 'col': 26, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/components.js', 'text': '        else if (snippet.typeCode==''object'') return ''object-snippet-template'';'}, {'lnum': 990, 'col': 21, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/components.js', 'text': '        if (snippet.typeCode==''static'') {'}, {'lnum': 1006, 'col': 54, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/components.js', 'text': '            if (text.match(/{%child%}/gi) && snippet.typeCode==''group'') {'}, {'lnum': 9, 'col': 14, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/snippets.js', 'text': '        self.typeCode = ko.observable(attrs.typeCode);'}, {'lnum': 30, 'col': 13, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/snippets.js', 'text': '            typeCode: self.typeCode(),'}, {'lnum': 116, 'col': 83, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/snippets.js', 'text': '            var g = new Snippet({id: self.uuid(), name: name, folderId: folderId, typeCode: ''static''});'}, {'lnum': 9, 'col': 14, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/task-cards.js', 'text': '        self.typeCode = ko.observable(attrs.typeCode);'}, {'lnum': 29, 'col': 13, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/task-cards.js', 'text': '            typeCode: self.typeCode(),'}, {'lnum': 114, 'col': 84, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/task-cards.js', 'text': '            var g = new TaskCard({id: self.uuid(), name: name, folderId: folderId, typeCode: ''static''});'}, {'lnum': 47, 'col': 97, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/snippets.html', 'text': '                                    <select class="fill-up input-transparent" data-bind="value: typeCode">'}, {'lnum': 56, 'col': 78, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/snippets.html', 'text': '                                    <div class="padded"  data-bind="visible: typeCode()==''static''">'}, {'lnum': 59, 'col': 78, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/snippets.html', 'text': '                                    <div class="padded"  data-bind="visible: typeCode()==''object''">'}, {'lnum': 68, 'col': 78, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/snippets.html', 'text': '                                    <div class="padded"  data-bind="visible: typeCode()==''group''">'}, {'lnum': 79, 'col': 67, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/snippets.html', 'text': '                                <div class="span3" data-bind="if: typeCode()==''group''">'}, {'lnum': 51, 'col': 78, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/task-cards.html', 'text': '                                    <div class="padded"  data-bind="visible: typeCode()==''static''">'}, {'lnum': 54, 'col': 78, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/task-cards.html', 'text': '                                    <div class="padded"  data-bind="visible: typeCode()==''object''">'}, {'lnum': 63, 'col': 78, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/task-cards.html', 'text': '                                    <div class="padded"  data-bind="visible: typeCode()==''group''">'}, {'lnum': 52, 'col': 67, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/client/Designer/task-cards.html', 'text': '                                <div class="span3" data-bind="if: typeCode()==''group''">'}, {'lnum': 22, 'col': 4, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/Snippet.js', 'text': '			typeCode: String,'}, {'lnum': 45, 'col': 24, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/lib/Snippet.js', 'text': '	else if (!snippetData.typeCode) callback(''Snippet typeCode is required'');'}, {'lnum': 39, 'col': 90, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Folder.js', 'text': '                                    Snippet.create({id: uuid.v4(), name: ''Test Snippet'', typeCode: ''static''}, function(err, result){'}, {'lnum': 396, 'col': 59, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Folder.js', 'text': '        Snippet.create({id: id, name: ''New Test Snippet'', typeCode: ''static''}, function(err, snippet){'}, {'lnum': 24, 'col': 25, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Snippet.js', 'text': '        Snippet.create({typeCode: ''object'', name: ''Test Snippet''}, function(err, snippet){'}, {'lnum': 31, 'col': 47, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Snippet.js', 'text': '    it(''should not create a snippet without a typeCode'', function(done){'}, {'lnum': 39, 'col': 25, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Snippet.js', 'text': '        Snippet.create({typeCode: ''object''}, function(err, snippet){'}, {'lnum': 78, 'col': 30, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Snippet.js', 'text': '    it(''can modify a snippet typeCode'', function(done){'}, {'lnum': 79, 'col': 21, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Snippet.js', 'text': '        testUpdate(''typeCode'', ''group'', done);'}, {'lnum': 123, 'col': 21, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Snippet.js', 'text': '        var data = {typeCode: ''object'', name: ''Test Snippet 1''};'}, {'lnum': 128, 'col': 43, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Snippet.js', 'text': '            snippet.should.have.property(''typeCode'', ''object'');'}, {'lnum': 136, 'col': 43, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Snippet.js', 'text': '            snippet.should.have.property(''typeCode'', ''object'');'}, {'lnum': 146, 'col': 47, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Snippet.js', 'text': '            snippets[0].should.have.property(''typeCode'', ''object'');'}, {'lnum': 178, 'col': 13, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Snippet.js', 'text': '            typeCode: ''group'','}, {'lnum': 199, 'col': 43, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/Users/dustinmartin/Projects/NextGen/ng7/evo/tests/Snippet.js', 'text': '        testSnippet.should.have.property(''typeCode'');'}])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/Projects/LifeAnchor/Code/Web
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +25 ~/Projects/NextGen/ng7/evo/lib/TaskCard.js
badd +9 ~/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/task-cards.js
badd +19 ~/Projects/NextGen/ng7/evo/lib/client/Designer/task-cards.html
badd +1 ~/.vimrc
badd +1 ~/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/Folder.js
badd +1 ~/Projects/NextGen/ng7/evo/lib/Folder.js
badd +15 ~/Downloads/steve_losh_vimrc
silent! argdel *
edit ~/Projects/NextGen/ng7/evo/lib/client/Designer/task-cards.html
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
" argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 49 - ((36 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
49
normal! 0
tabedit ~/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/task-cards.js
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
" argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
1
silent! normal! zo
23
silent! normal! zo
36
silent! normal! zo
50
silent! normal! zo
103
silent! normal! zo
111
silent! normal! zo
160
silent! normal! zo
let s:l = 107 - ((11 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
107
normal! 041|
tabedit ~/Projects/NextGen/ng7/evo/lib/TaskCard.js
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
" argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabedit ~/Projects/NextGen/ng7/evo/lib/client/Designer/javascripts/Folder.js
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
" argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 44 - ((1 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
44
normal! 0
tabedit ~/Projects/NextGen/ng7/evo/lib/Folder.js
set splitbelow splitright
wincmd t
set winheight=1 winwidth=1
" argglobal
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 22 - ((1 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
22
normal! 0
tabedit ~/Downloads/steve_losh_vimrc
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 69 + 70) / 140)
exe 'vert 2resize ' . ((&columns * 70 + 70) / 140)
" argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
35
silent! normal! zo
35
normal! zc
253
silent! normal! zo
253
normal! zc
608
silent! normal! zo
876
silent! normal! zo
1460
silent! normal! zo
1460
normal! zc
1641
silent! normal! zo
1703
silent! normal! zo
1703
normal! zc
1641
normal! zc
let s:l = 8 - ((7 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 01|
wincmd w
" argglobal
edit ~/.vimrc
setlocal fdm=syntax
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 41 - ((36 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
41
normal! 05|
wincmd w
exe 'vert 1resize ' . ((&columns * 69 + 70) / 140)
exe 'vert 2resize ' . ((&columns * 70 + 70) / 140)
tabnext 6
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

tabnext 6
1wincmd w
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
