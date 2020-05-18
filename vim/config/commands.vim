" Create commands for opening files in splits
command! -bar -complete=file -nargs=1 Vedit vsplit|edit <args>
command! -bar -complete=file -nargs=1 Hedit split|edit <args>

" Open spell files
command! SpellFile tabe ~/dotfiles/vim/custom-dictionary.utf-8.add
command! SpellFileLocal tabe ~/.vim-local-dictionary.utf-8.add

" Remove \ (Windows line endings) from files
command! RemoveM %s/\//g

" Run ESLint and populate the quick fix list
let local_eslint = findfile('node_modules/.bin/eslint', '.;')
let local_eslint_ignore = findfile('.eslintignore', '.;')

" TODO: Add if statement for when eslint or eslintignore doesn't exist
command! ESLint cexpr system(local_eslint . ' --cache --ext .tsx --ext .ts --ext .jsx --ext .js --ignore-path ' . local_eslint_ignore . ' --fix --format unix .')

command! ZoomToggle call ZoomToggle()

command! Finder call RevealInFinder()
