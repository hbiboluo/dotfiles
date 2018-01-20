# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
if [[ `uname -s` == 'Darwin' ]]; then
  ZSH_THEME="amuse"
else
  ZSH_THEME="gnzh"
fi
# ZSH_THEME="gnzh" # 远程首选，带hostname
# ZSH_THEME="crunch"
# ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
if [[ -d ~/.zsh-custom ]]; then
    ZSH_CUSTOM=~/.zsh-custom
fi

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(aliases bower celery common-aliases copyfile django docker encode64 fabric git git-extras git-flow github gitignore jump npm pip python pyenv rsync sudo urltools virtualenv tmux tmuxinator zsh_reload)
if [[ `uname -s` == 'Darwin' ]]; then
    plugins+=(brew brewcask osx)
elif [[ `uname -s` == 'Linux' && -e "/etc/lsb-release" ]]; then
    plugins+=(ubuntu)
elif [[ `uname -s` == 'Linux' && -e "/etc/redhat-release" ]]; then
    plugins+=(yum)
fi


source $ZSH/oh-my-zsh.sh

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:/usr/local/bin:$PATH"
eval "$(pyenv init -)"

# load my scipts
[[ -d ~/.hscript ]] && source ~/.hscript/*.sh
# load aliases
[[ -f ~/.aliases ]] && source ~/.aliases
# use .zshrc_local config the local settings
if [[ -f ~/.zshrc_local ]]; then
    source ~/.zshrc_local
else
    touch ~/.zshrc_local
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# thefuck config
F() {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_ALIAS=F;
    export TF_HISTORY="$(fc -ln -10)";
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@) && eval $TF_CMD;
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    test -n "$TF_CMD" && print -s $TF_CMD
}
