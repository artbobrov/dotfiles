# Setting $PATH variable from bash.
export PATH=/usr/local/share/python:$HOME/bin:/usr/local/bin:$PATH

export PATH=/usr/local/mysql-8.0.11-macos10.13-x86_64/support-files:/usr/local/mysql-8.0.11-macos10.13-x86_64/bin:$PATH

# Path to my oh-my-zsh installation.
export ZSH=/Users/artembobrov/.oh-my-zsh

# Needed variables
export PW=$HOME/Documents/Personal-Works
export PYTHONPATH=$PYTHONPATH:/Users/artembobrov/models/research:/Users/artembobrov/models/research/slim
# Theme
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
export PATH="/usr/local/opt/opencv@2/bin:$PATH"

eval $(thefuck --alias)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/artembobrov/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/artembobrov/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/artembobrov/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/artembobrov/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
