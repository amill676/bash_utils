# fzf setup
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Keep C-t for transposing characters
bind '"\C-x\C-t": " \C-u \C-a\C-k`__fzf_select__`\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'
bind '"\C-t": transpose-chars'

# If fd is available, use instead of find. This will respect .gitignore
fd=$(which fd)
if [ -n "$fd" ]; then
    export FZF_DEFAULT_COMMAND='fd --type f'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
