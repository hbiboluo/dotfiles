# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/fzf/bin* ]]; then
  export PATH="$PATH:/opt/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/opt/fzf/shell/key-bindings.bash"
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -l -g ""'

