# Thanks https://github.com/nicknisi/dotfiles

COLOR_BLACK="\e[0;30m"
COLOR_BLUE="\e[0;34m"
COLOR_GREEN="\e[0;32m"
COLOR_CYAN="\e[0;36m"
COLOR_PINK="\e[0;35m"
COLOR_RED="\e[0;31m"
COLOR_PURPLE="\e[0;35m"
COLOR_BROWN="\e[0;33m"
COLOR_LIGHTGRAY="\e[0;37m"
COLOR_DARKGRAY="\e[1;30m"
COLOR_LIGHTBLUE="\e[1;34m"
COLOR_LIGHTGREEN="\e[1;32m"
COLOR_LIGHTCYAN="\e[1;36m"
COLOR_LIGHTRED="\e[1;31m"
COLOR_LIGHTPURPLE="\e[1;35m"
COLOR_YELLOW="\e[1;33m"
COLOR_WHITE="\e[1;37m"
COLOR_NONE="\e[0m"

# needed to get things like current git branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git # You can add hg too if needed: `git hg`
zstyle ':vcs_info:git*' use-simple true
zstyle ':vcs_info:git*' max-exports 2
zstyle ':vcs_info:git*' formats ' %b' 'x%R'
zstyle ':vcs_info:git*' actionformats ' %b|%a' 'x%R'

autoload colors && colors

git_dirty() {
    # check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    # check if it's dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null;
    if [[ $? -eq 1 ]]; then
        echo "%F{red}✗%f"
    else
        echo "%F{green}✔%f"
    fi
}

# get the status of the current branch and it's remote
# If there are changes upstream, display a ⇣
# If there are changes that have been committed but not yet pushed, display a ⇡
git_arrows() {
    # do nothing if there is no upstream configured
    command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return

    local arrows=""
    local status
    arrow_status="$(command git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)"

    # do nothing if the command failed
    (( !$? )) || return

    # split on tabs
    arrow_status=(${(ps:\t:)arrow_status})
    local left=${arrow_status[1]} right=${arrow_status[2]}

    (( ${right:-0} > 0 )) && arrows+="%F{011}⇣%f"
    (( ${left:-0} > 0 )) && arrows+="%F{012}⇡%f"

    echo $arrows
}


# indicate a job (for example, vim) has been backgrounded
# If there is a job in the background, display a ✱
suspended_jobs() {
    local sj
    sj=$(jobs 2>/dev/null | tail -n 1)
    if [[ $sj == "" ]]; then
        echo ""
    else
        echo "%{$FG[208]%}✱%f"
    fi
}

precmd() {
    vcs_info
    print -P '\n%F{205}%~'
}

export PROMPT='%(?.%F{205}.%F{red})❯%f '
export RPROMPT='`git_dirty`%F{241}$vcs_info_msg_0_%f `git_arrows``suspended_jobs`'

# git aliases
alias ga='git add'
alias gb='git branch'
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias gdc='git diff --cached'
alias gs='git s'
alias gss='git stash save'
alias gsp='git stash pop'
alias gmv='git mv'
alias grm='git rm'
alias grn='git-rename'
alias glog="git l"

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin"
ket () {
  cd ~/plague/vagrant && vagrant up && vagrant ssh -c "docker start \$(docker ps -a | grep nginx-proxy | awk '{print \$1}') && cd /code/ket && docker-compose up -d && docker exec -it ket bash"
}


rene () {
    cd ~/plague/vagrant && vagrant up && vagrant ssh -c "docker start \$(docker ps -a | grep nginx-proxy | awk '{print \$1}') && cd /code/rene && docker-compose up -d && docker exec -it rene_webapp_1 bash"
}

newsroom () {
  cd ~/plague/vagrant && vagrant up && vagrant ssh -c "docker start \$(docker ps -a | grep nginx-proxy | awk '{print \$1}') && cd /code/newsroom/front && docker-compose up -d && docker exec -it newsroom-webapp bash"
}

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# export NVIM_TUI_ENABLE_TRUE_COLOR=1
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'

alias ctags="`brew --prefix`/bin/ctags"
eval "$(hub alias -s)"


export EDITOR='vim'
alias e=$EDITOR

alias ket_vim="cd ~/plague/code/ket && vim ."
alias ket_emacs="cd ~/plague/code/ket && ec ."
alias rne_vim="cd ~/plague/code/rene && vim ."
alias rne_emacs="cd ~/plague/code/rene && ec ."
alias nrm_vim="cd ~/plague/code/newsroom/front && vim ."
alias nrm_emacs="cd ~/plague/code/newsroom/front && ec ."
alias nrd_vim="cd ~/plague/code/nimrod && vim ."
alias nrd_emacs="cd ~/plague/code/nimrod && ec ."
alias sch_vim="cd ~/plague/code/scheduler && vim ."
alias sch_ssh="ssh scheduler"
alias nrm_ssh="ssh newsroom"


# tmux
alias tma="tmux attach -t"
alias tns="tmux new-session -s"

export PATH="/usr/local/bin:$PATH"

# export WORKON_HOME=~/.virtualenvs
# export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
