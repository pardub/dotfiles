if [ -f "$HOME"/.cache/zsh/history ] ;then
touch "$HOME"/.cache/zsh/history
fi
# +------------+
# | Completion |
# +------------+

# To enable autocompletion,
autoload -Uz compinit
compinit

# For autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# For enabling autocompletion of privileged environments in privileged commands (e.g. if you complete a command starting with sudo
zstyle ':completion::complete:*' gain-privileges 1

# Zsh git completion
zstyle ':completion:*:*:git:*' script ~/.config/zsh/git-completion.zsh
fpath=($HOME/.config/zsh $fpath)

# +--------+
# | Config |
# +--------+

# Load aliases if they exist.
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases"
[ -f "${XDG_CONFIG_HOME}/zsh/.aliases.local" ] && . "${XDG_CONFIG_HOME}/zsh/.aliases.local"

bindkey -v

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

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
#bindkey -s '^o' '^uranger\n'

# use Ctrl-P to accept suggestion
bindkey '^P' autosuggest-accept

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char


# Use Ranger to switch directories and bind it to ctrl-o // currently not working
#ranger () {
#    tmp="$(mktemp -uq)"
#    trap 'rm -f $tmp >/dev/null 2>&1' HUP INT QUIT TERM PWR EXIT
#    ranger -last-dir-path="$tmp" "$@"
#    if [ -f "$tmp" ]; then
#        dir="$(cat "$tmp")"
#        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
#    fi
#}


# Go directly to folder without typng "cd"
#setopt autocd

# Colors
autoload -Uz colors && colors


# +---------+
# | History |
# +---------+

# Commands are added to the history immediately
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "

# Add Timestamp to history
setopt EXTENDED_HISTORY

# Remove duplicates in history
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Need to add below Docker completion

# Load zsh-syntax-highlighting; should be last.
#source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
#source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

# Rclone config
#source "$HOME"/bin/set-rclone-password

# expand alias with function associated in zsh-functions file
#zle -N expand-alias
#bindkey -M main ' ' expand-alias

# +---------+
# | Plugins |
# +---------+
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
 
# +------------------+
# | Functions config |
# +------------------+

# Useful Functions
source "$ZDOTDIR"/zsh-functions

# globalias function settings defined in file zsh-function
 zle -N globalias

    # space expands all aliases, including global
     bindkey -M emacs " " globalias
     bindkey -M viins " " globalias

     # control-space to make a normal space
     bindkey -M emacs "^ " magic-space
     bindkey -M viins "^ " magic-space

     # normal space during searches
     bindkey -M isearch " " magic-space
