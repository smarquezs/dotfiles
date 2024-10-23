# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "chivalryq/git-alias"
plug "zap-zsh/fzf"
plug "Aloxaf/fzf-tab"
plug "Freed-Wu/fzf-tab-source"

# Load and initialise completion system
autoload -Uz compinit
compinit

eval "$(jump shell)"

# alias
alias h="heroku"
alias lg="lazygit"
alias ll="exa -l"

# initialize rbenv
eval "$(rbenv init -)"

# initialize direnv
eval "$(direnv hook zsh)"

export EDITOR="zed --wait"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

. /usr/local/opt/asdf/libexec/asdf.sh
