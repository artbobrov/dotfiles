# Setting $PATH variable from bash.
#  Theme
ZSH_THEME=""
# Enabling auto-correction.
ENABLE_CORRECTION="true"

# Displaying red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"
# Dara format
HIST_STAMPS="mm/dd/yyyy"
# My editor
export EDITOR='vim'
# Plugins included
plugins=(git osx python brew pip sudo)

source $ZSH/oh-my-zsh.sh

# My configuration
case ${TERM} in
    xterm*|screen|cygwin)
        precmd () {echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}"; echo -ne "\007"}
        ;;
    *)
        ;;
esac

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end

autoload -U promptinit; promptinit
prompt pure

# For a full list of active aliases, run `alias`.
# aliases
# notifications for process
alias nt='noti time'
# using trash throw "rm"
alias rm='trash'

alias ..='cd ..'
alias c='clear'
alias la='ls -lAh'

eval $(thefuck --alias)
fpath=(/usr/local/share/zsh-completions $fpath)