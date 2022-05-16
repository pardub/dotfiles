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

# Auto correction
ENABLE_CORRECTION="true"

# Open Ranger with CTRL O
bindkey -s '^o' 'ranger\n'

# Commands are added to the history immediately
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "

# Add Timestamp to history
setopt EXTENDED_HISTORY

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null" >> $ZDOTDIR/.zshrc
