#ZDOTDIR=~/.config/zsh

# Set up a few standard directories based on:
# https://wiki.archlinux.org/title/XDG_Base_Directory

export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"

# Add all local binaries to the system path.
export PATH="${PATH}:${HOME}/.local/bin"

# Default programs to run.
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox"

#export HISTFILE="$ZDOTDIR/.zhistory"          # History filepath
export HISTSIZE=50000                          # Maximum events for internal history
export SAVEHIST=50000                          # Maximum events in history file
#export HISTFILE=~/.cache/zsh/history
export HISTFILE="${HOME}/.cache/zsh/history"   # History filepath

# Configuring $PATH
typeset -U path PATH
path=(~/.local/bin $path)
export PATH
