# fzf setup
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Keep C-t for transposing characters
bind '"\C-x\C-t": " \C-u \C-a\C-k`__fzf_select__`\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'
bind '"\C-t": transpose-chars'

# First try to use ripgrep. If not available, use fd
fd=$(which fd)
rg=$(which rg)
if [ -n "$rg" ]; then
    #export FZF_DEFAULT_COMMAND='echo "hi"'
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules,gsapi}/*" 2> /dev/null'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
elif [ -n "$fd" ]; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi
