function show_branches --description "FZF-powered git branch selection"
    set -l branch (git branch -v --sort=-committerdate | grep -v HEAD | fzf +m | awk '{print $1}' | sed 's/.* //')
    and git checkout $branch
end
