PROMPT='%{$fg[yellow]%}
%n@%m %{$fg[blue]%}(%~) $(git_prompt_info)
%{$fg[yellow]%}=>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="] * %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="]%{$fg[blue]%}"
