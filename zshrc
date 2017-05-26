# Setting $PATH variable from bash.
export PATH=/usr/local/share/python:$HOME/bin:/usr/local/bin:$PATH

# Path to my oh-my-zsh installation.
export ZSH=/Users/macbook/.oh-my-zsh


# Theme
ZSH_THEME="pre"
# Enabling auto-correction.
ENABLE_CORRECTION="true"

# Displaying red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# Dara format
HIST_STAMPS="mm/dd/yyyy"
# My editor
export EDITOR='vim'
# Plugins included
plugins=(git brew pip python sudo)

source $ZSH/oh-my-zsh.sh

# My configuration
case ${TERM} in
    xterm*|screen|cygwin)
        precmd () {echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"}
        ;;
    *)
        ;;
esac

# For a full list of active aliases, run `alias`.
# aliases

# notifications for process
alias nt='noti time'
# using trash throw "rm"
alias rm='trash'

alias ..='cd ..'
alias c='clear'
alias la='ls -lAh'
