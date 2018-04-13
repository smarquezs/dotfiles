# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/smarquezs/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="pygmalion"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias e=$EDITOR
alias git=hub

function kubelog() {
  if [ -n "$1" ]
  then
    local default_limit=100
    local tail_limit=${2:-$default_limit}
    echo "Logging.." $1
    local pod=$(kubectl get pods | grep $1 | head -1 | awk '{print $1}')
    kubectl logs -f --tail=$tail_limit $pod
  fi
}

function kubexec() {
  if [ -n "$1" ]
  then
    local default_limit=100
    local tail_limit=${2:-$default_limit}
    echo "Executing.." $1
    local pod=$(kubectl get pods | grep $1 | head -1 | awk '{print $1}')
    kubectl exec -it $pod bash
  fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -s "/Users/smarquezs/.scm_breeze/scm_breeze.sh" ] && source "/Users/smarquezs/.scm_breeze/scm_breeze.sh"

export DOCKER_HOST=tcp://192.168.99.100:2376
export DOCKER_CERT_PATH=/Users/smarquezs/.docker/machine/machines/dinghy
export DOCKER_TLS_VERIFY=1
export DOCKER_MACHINE_NAME=dinghy

plugins=(
  git
)
