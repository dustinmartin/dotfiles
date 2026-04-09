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
    # set -gx STARSHIP_CONFIG ~/dotfiles/starship.toml
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
    # Short status without ahead/behind counts to stay fast in large repos.
    abbr -a -- gs 'git status -sb --no-ahead-behind'
    abbr -a -- gst 'git status'
    # Readable code-review diff with moved-code highlighting and better hunk grouping.
    abbr -a -- gd 'git diff --color-moved=zebra --diff-algorithm=histogram'
    # Commit graph with stats and relative dates for quick history inspection.
    abbr -a -- gl 'git log --graph --stat --abbrev-commit --date=relative'

    # Git - fetch/pull/push
    abbr -a -- gf 'git fetch'
    abbr -a -- gpl 'git pull'
    abbr -a -- gpu 'git push'
    # Rebase the current branch onto the repo's default branch from origin.
    abbr -a -- gup 'git pull --rebase origin (git_default_branch)'
    # Merge the repo's default branch from origin into the current branch.
    abbr -a -- gum 'git pull origin (git_default_branch)'
    # Push the current branch and set its upstream on origin.
    abbr -a -- gpb 'git push --set-upstream origin (git rev-parse --abbrev-ref HEAD)'
    # Force-push the current branch with lease protection and set upstream.
    abbr -a -- gpbf 'git push --set-upstream --force-with-lease origin (git rev-parse --abbrev-ref HEAD)'

    # Git - staging
    abbr -a -- ga 'git add'
    # Stage all tracked and untracked changes, then show status.
    abbr -a -- gaa 'git add -A && git status'
    # Interactively choose hunks to stage, then show status.
    abbr -a -- gap 'git add -p && git status'
    # Unstage files while leaving working tree changes intact.
    abbr -a -- gua 'git restore --staged'

    # Git - committing
    # Open the commit editor with the verbose diff included below the message.
    abbr -a -- gc 'git commit -v'
    # Commit with an inline message instead of opening the editor.
    abbr -a -- gcm 'git commit -v -m'
    # Stage everything and then open the commit editor.
    abbr -a -- gca 'git add -A && git commit -v'
    # Amend the previous commit without changing its message.
    abbr -a -- gam 'git commit --amend --no-edit'
    # Make a no-verify WIP commit without staging new files automatically.
    abbr -a -- gwip 'git commit --no-verify -m WIP'
    # Stage everything and make a no-verify WIP commit.
    abbr -a -- gwipa 'git add -A && git commit --no-verify -m WIP'

    # Git - branching
    # Switch to another branch using Git's newer branch-specific command.
    abbr -a -- gco 'git checkout'
    # Create and switch to a new branch in one step.
    abbr -a -- gcob 'git switch -c'
    # Pick a local branch from an fzf list with recency and commit context.
    abbr -a -- gb show_branches
    # Force-delete a local branch.
    abbr -a -- gdb 'git branch -D'
    # Delete local branches already merged into the default branch.
    abbr -a -- gcl git_delete_merged_branches

    # Git - rebasing/merging
    abbr -a -- grb 'git rebase'
    abbr -a -- grbc 'git rebase --continue'
    abbr -a -- grba 'git rebase --abort'
    # Start an interactive rebase onto the repo's default branch.
    abbr -a -- gir 'git rebase -i origin/(git_default_branch)'
    abbr -a -- gm 'git merge'

    # Git - stash
    # Stash the current working tree changes.
    abbr -a -- gsp 'git stash push'
    # Stash only the hunks you choose interactively.
    abbr -a -- gspi 'git stash push --patch'
    # Apply and drop the most recent stash entry.
    abbr -a -- gspp 'git stash pop'

    # Git - undo
    # Undo the last commit but keep its changes unstaged in the working tree.
    abbr -a -- gun 'git reset HEAD~1 --mixed'
    # Jump back to the previous HEAD position after a reset or checkout move.
    abbr -a -- gungun 'git reset HEAD@{1}'

    # Tmuxinator
    abbr -a -- mux tmuxinator

    # Rovo
    abbr -a -- rovo 'acli rovodev tui'
    abbr -a -- srovo 'safehouse --append-profile ~/.config/safehouse/rovodev.sb --enable=shell-init acli rovodev tui --yolo'
end
