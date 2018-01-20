if [[ `uname -s` == "Linux" ]]; then
  if [[ -e "/etc/lsb-release" ]]; then
    _INSTALLER="apt-get install -y"
    _OS="ubuntu"
  elif [[ -e "/etc/redhat-release" ]]; then
    _INSTALLER="yum install -y"
    _OS="centos"
  fi
elif [[ `uname -s` == "Darwin" ]]; then
  _INSTALLER="brew install"
  _OS="osx"
fi

grep -v "^os:" ./tools.txt  | grep -v "^$" | xargs -n1 -r sudo $_INSTALLER
grep "^os:${_OS}:" ./tools.txt | awk -F: '{print $3}' | xargs -n1 -r sudo $_INSTALLER
