if [[ ! -f ~/.antigen.zsh ]]; then
  curl -L git.io/antigen > ~/.antigen.zsh
fi

source ~/.antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh
# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git 
antigen bundle git-extras 
antigen bundle git-flow
antigen bundle aliases
antigen bundle common-aliases
antigen bundle copyfile
antigen bundle rsync
antigen bundle sudo
antigen bundle tmux
antigen bundle jump
antigen bundle npm
antigen bundle pip 
antigen bundle pyenv 
antigen bundle zsh_reload
antigen bundle mvn

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# 不同操作系统使用不同配置
# 备选主题：(crunch ys)
if [[ `uname -s` == 'Darwin' ]]; then
  antigen bundle brew
  #antigen bundle osx
  antigen theme amuse
elif [[ `uname -s` == 'Linux' ]]; then
  antigen theme gnzh
  if [[ -f /etc/lsb-release ]]; then
    antigen bundle ubuntu
  elif [[ -f /etc/redhat-release ]]; then
    antigen bundle yum
  fi
fi

# Tell Antigen that you're done.
antigen apply

if [[ -d ~/.zsh-custom ]]; then
  ZSH_CUSTOM=~/.zsh-custom
fi

if [[ -f ~/.rc ]]; then
  source ~/.rc
fi
h.welcome
