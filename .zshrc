# To enable autocompletion,
autoload -Uz compinit
compinit

# For autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select

# Load aliases if they exist.
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases"
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases.local" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases.local"
