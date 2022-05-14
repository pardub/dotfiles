# To enable autocompletion,
autoload -Uz compinit
compinit

# For autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select

# For enabling autocompletion of privileged environments in privileged commands (e.g. if you complete a command starting with sudo
zstyle ':completion::complete:*' gain-privileges 1


# Load aliases if they exist.
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases"
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases.local" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases.local"

bindkey -v

typeset -g -A key
bindkey '^?' backward-delete-char
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Persistent rehash
zstyle ':completion:*' rehash true
