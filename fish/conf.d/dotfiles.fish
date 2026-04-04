# Homebrew
if test -d /home/linuxbrew/.linuxbrew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"
else if test -d /opt/homebrew
    eval "$(/opt/homebrew/bin/brew shellenv fish)"
end

# fnm must run in all shells (including non-interactive) so tools like Claude Code can find node/npm
fnm env | source

if status is-interactive
    # Editor
    set -gx EDITOR nvim

    # PATH
    fish_add_path ~/dotfiles/bin
    test -d ~/Projects/screensaver/bin; and fish_add_path ~/Projects/screensaver/bin

    # Tool initialization
    zoxide init fish | source
    starship init fish | source

    # Vim
    abbr -a -- vim nvim

    # Navigation
    abbr -a -- .. 'cd ..'
    abbr -a -- ... 'cd ../..'
    abbr -a -- j z
    abbr -a -- reload 'exec fish'

    # Listing
    if command -q eza
        alias ls 'eza -a --icons --grid'
    end

    # Docker
    abbr -a -- dpa 'docker ps -a'

    # Git - basics
    abbr -a -- g git
    abbr -a -- gs 'git status -sb'
    abbr -a -- gst 'git status'
    abbr -a -- gd 'git diff --word-diff'
    abbr -a -- gl 'git log --graph --stat --abbrev-commit --date=relative'

    # Git - fetch/pull/push
    abbr -a -- gf 'git fetch'
    abbr -a -- gpl 'git pull'
    abbr -a -- gpu 'git push'
    abbr -a -- gup 'git pull --rebase origin master'
    abbr -a -- gum 'git pull origin master'
    abbr -a -- gpb 'git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)'
    abbr -a -- gpbf 'git push --set-upstream --force-with-lease origin (git rev-parse --abbrev-ref HEAD)'

    # Git - staging
    abbr -a -- ga 'git add'
    abbr -a -- gaa 'git add -u && git add . && git status'
    abbr -a -- gap 'git add -p && git status'
    abbr -a -- gua 'git reset HEAD --'

    # Git - committing
    abbr -a -- gc 'git commit -v -m'
    abbr -a -- gca 'git add -u && git add . && git commit -m'
    abbr -a -- gam 'git commit --amend --no-edit'
    abbr -a -- gwip 'git commit --no-verify -m WIP'
    abbr -a -- gwipa 'git add -A && git commit --no-verify -m WIP'

    # Git - branching
    abbr -a -- gco 'git checkout'
    abbr -a -- gcob 'git checkout -b'
    abbr -a -- gb show_branches
    abbr -a -- gdb 'git branch -D'
    abbr -a -- gcl "git branch --merged | grep -vE '(^\*|master|dev)' | xargs git branch -d"

    # Git - rebasing/merging
    abbr -a -- grb 'git rebase'
    abbr -a -- grbc 'git rebase --continue'
    abbr -a -- grba 'git rebase --abort'
    abbr -a -- gir 'git rebase -i origin/master'
    abbr -a -- gm 'git merge'

    # Git - stash
    abbr -a -- gsp 'git stash push'
    abbr -a -- gspi 'git stash push --patch'
    abbr -a -- gspp 'git stash pop'

    # Git - undo
    abbr -a -- gun 'git reset HEAD~1 --mixed'
    abbr -a -- gungun 'git reset HEAD@{1}'

    # Tmuxinator
    abbr -a -- mux tmuxinator

    # Rovo
    abbr -a -- rovo 'acli rovodev tui'
    abbr -a -- srovo 'safehouse --append-profile ~/.config/safehouse/rovodev.sb --enable=shell-init acli rovodev tui --yolo'
end
