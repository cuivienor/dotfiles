ZSH_CUSTOM=$HOME/.config/zsh
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

# Source secrets if they exist
if [ -f "$HOME/.env" ]; then
	source "$HOME/.env"
fi

# Source custom aliases
if [ -f "$ZSH_CUSTOM/aliases.bash" ]; then
	source "$ZSH_CUSTOM/aliases.bash"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="catppuccin"

zstyle ':omz:update' mode reminder

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
plugins=(aliases alias-finder git git-auto-fetch gpg-agent sudo zsh-autosuggestions zsh-navigation-tools zsh-syntax-highlighting zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# Enable alias finder plugin
zstyle ':omz:plugins:alias-finder' autoload yes
# zstyle ':omz:plugins:alias-finder' longer yes
zstyle ':omz:plugins:alias-finder' exact yes
# zstyle ':omz:plugins:alias-finder' cheaper yes

export STARSHIP_CONFIG=$XDG_CONFIG_HOME/starship/starship.toml
eval "$(starship init zsh)"

source <(fzf --zsh)

# Bat integrations

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

# Configure ssh agent (Relies on a user systemd service)

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# TODO: Doesn't actually work due to passphrase. Look into integrating with a keyring manager
if [ -z "$(ssh-add -l 2>/dev/null)" ]; then
	ssh-add ~/.ssh/id_ed25519
fi

. "$HOME/.local/share/../bin/env"
