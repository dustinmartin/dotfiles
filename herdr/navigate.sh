#!/bin/sh
# Vim-aware pane navigation for Herdr, like vim-tmux-navigator's tmux side.
# Bound to Ctrl-h/j/k/l in config.toml. If (n)vim or fzf is in the foreground
# of the focused pane, pass the key through so it can move between its own
# splits (nvim calls `herdr pane focus` itself at an edge). Otherwise move
# Herdr's focus to the neighbouring pane.
# Usage: navigate.sh left|down|up|right

direction=$1
case $direction in
left) key=ctrl+h ;;
down) key=ctrl+j ;;
up) key=ctrl+k ;;
right) key=ctrl+l ;;
*)
	echo "usage: navigate.sh left|down|up|right" >&2
	exit 2
	;;
esac

herdr=${HERDR_BIN_PATH:-herdr}
pane=$HERDR_ACTIVE_PANE_ID
[ -n "$pane" ] || exit 0

# Same process names vim-tmux-navigator's is_vim check matches.
if "$herdr" pane process-info --pane "$pane" 2>/dev/null |
	grep -Eq '"name":"g?(view|l?n?vim?x?|fzf)(diff)?"'; then
	exec "$herdr" pane send-keys "$pane" "$key"
fi
exec "$herdr" pane focus --direction "$direction" --pane "$pane"
