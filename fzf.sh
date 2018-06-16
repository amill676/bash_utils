# fzf setup
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Keep C-t for transposing characters
bind '"\C-x\C-t": " \C-u \C-a\C-k`__fzf_select__`\e\C-e\C-y\C-a\C-y\ey\C-h\C-e\er \C-h"'
bind '"\C-t": transpose-chars'
