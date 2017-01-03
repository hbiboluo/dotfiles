#!/bin/bash

function pyenv-install(){
  if [[ $# -ne 1 ]]; then
    echo ""
    echo "使用sohu镜像加速pyenv安装，请传入待安装的参数，可以打开http://mirrors.sohu.com/python/查看..."
    echo ""
    echo "Usage: pyenv-install VERSION"
    return
  fi
  if [[ ! -d ~/.pyenv ]]; then
    echo "尚未安装pyenv..."
    return
  fi
  [[ -d ~/.pyenv/cache ]] || mkdir ~/.pyenv/cache
  wget http://mirrors.sohu.com/python/$1/Python-$1.tar.xz -P ~/.pyenv/cache/
  pyenv install $1
}
