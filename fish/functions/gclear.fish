function gclear --description "Reset branch to merge-base with master, keeping changes"
    git reset (git merge-base master (git rev-parse --abbrev-ref HEAD))
end
