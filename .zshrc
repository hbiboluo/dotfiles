export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
core_plugins=(git git-extras git-flow aliases common-aliases sudo tmux rsync copyfile copypath)
lang_plugins=(npm pip pyenv mvn celery conda-env)
tool_plugins=(colored-man-pages colorize)
nav_plugins=(jump)
case "$OSTYPE" in
  darwin*) os_plugins=(brew macos) ;;
  linux*) os_plugins=(command-not-found ubuntu) ;;
  *) os_plugins=() ;;
esac
plugins=( $core_plugins $lang_plugins $tool_plugins $nav_plugins $os_plugins )
source $ZSH/oh-my-zsh.sh

if [[ -f ~/.rc ]]; then
  source ~/.rc
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/conda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
        . "/opt/conda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

