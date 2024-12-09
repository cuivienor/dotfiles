# Configure XDG data environment
if [ -f "$HOME/.config/xdg_config.bash" ]; then
	source "$HOME/.config/xdg_config.bash"
fi

# Modify Path
if [ -f "$XDG_CONFIG_HOME/path.bash" ]; then
	source "${XDG_CONFIG_HOME}/path.bash"
fi

# Remove duplicate paths which can happen in nester shell invokations
typeset -U PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="catppuccin"

zstyle ':omz:update' mode reminder  

ZSH_CUSTOM=$HOME/.config/zsh

# AUTOCOMPLETION

# initialize autocompletion
autoload -U compinit && compinit

# history setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

eval "$(zoxide init zsh)"
plugins=(aliases alias-finder git git-auto-fetch gpg-agent sudo zsh-autosuggestions zsh-navigation-tools zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

source <(fzf --zsh)

# Bat integrations

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

