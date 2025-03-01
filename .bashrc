# Init all shell variables and settings

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth
export HISTIGNORE='$:ls:[fb]g:exit:swd:w'
export HISTSIZE=2000
# append instead of overwriting history, and do it in realtime
shopt -s histappend
export PROMPT_COMMAND='history -a'
# add date / time to history entries
export HISTTIMEFORMAT='%b %d %H:%M '

export EDITOR=vim
export GIT_EDITOR=vim
export SVN_EDITOR=vim

# Set command line to vi mode
set -o vi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# Function definitions
if [ -f ~/.bash_functions ]; then
  . ~/.bash_functions
fi

my_time() {
  date +"%T"
}

prepend_path "$HOME/bin"

########################
# Command Prompt
########################

function prompt_command {
    local max_pwd_length=30
    local max_screen_pwd_length=18
    local pwd_length=$(echo -n $PWD | wc -c | tr -d " ")
    if [ $pwd_length -gt $max_pwd_length ]
    then
        shortPWD="--$(echo -n $PWD | sed -e "s/.*\(.\{$max_pwd_length\}\)/\1/")"
    else
        shortPWD="$(echo -n $PWD)"
    fi
    if [ $pwd_length -gt $max_screen_pwd_length ]
    then
        screenPWD="<$(echo -n $PWD | sed -e "s/.*\(.\{$max_screen_pwd_length\}\)/\1/")"
    else
        screenPWD="$(echo -n $PWD)"
    fi

    # If this is an xterm set the title to user@host:dir
    case "$TERM" in
    xterm*|rxvt*)
        echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
        ;;
    screen)
        echo -ne "^[k$screenPWD^[\\"
        ;;
    *)
        ;;
    esac

    # Get the git branch of this dir
    gitbranch="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
}
PROMPT_COMMAND=prompt_command

# <git branch>:<truncated working dir>$
PS1='\[\033[01;93m\]${gitbranch}:\[\033[01;96m\]${shortPWD}\[\033[00m\]\$ '

###############################################################################
# OS specific settings
################################################################################

function load_darwin {
  export PLATFORM='darwin'
  # Suppress zsh warning
  export BASH_SILENCE_DEPRECATION_WARNING=1
  # Fix screen
  alias ls='ls -G'
  alias screen="export SCREENPWD=$(pwd); /usr/bin/screen"

  export BREW_PATH="/opt/homebrew";
  if [ -d $BREW_PATH ]; then
    # Homebrew path
    # prepend_path "$BREW_PATH/bin"
    #prepend_path "$BREW_PATH/sbin"

    # Add homebrew path to the manpath
    # export MANPATH=$BREW_PATH/share/man:$MANPATH

    # Export Homebrew env vars
    eval "$($BREW_PATH/bin/brew shellenv)"
  fi


  # Only try and load the bash completion if it has not already been set.
  if [ -z $BASH_COMPLETION ]; then
    ## Enable programmable completion (if available)
    # Try from homebrew
    if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
      echo "Loading Bash Completions From Homebrew"
      . $(brew --prefix)/share/bash-completion/bash_completion
    fi
  else
    echo "No bash completion"
  fi
  . $HOME/.bash_completion
}

function load_linux
{
  # Only try and load the bash completion if it has not already been set.
  if [ -z $BASH_COMPLETION ];
  then
    #Bash completion settings
    if [ -f /etc/bash_completion ]; then
      BASH_COMPLETION="/etc/bash_completion"
      . /etc/bash_completion
    else
      echo "No bash completion."
    fi
  fi
  . $HOME/.bash_completion

  # Only try and load the bash completion directory if it has not already been set.
  if [ -z $BASH_COMPLETION_DIR ];
  then
    BASH_COMPLETION_DIR="/etc/bash_completion.d"
  fi

  bind "set completion-ignore-case on"
  echo Loaded Linux Settings
  export PLATFORM='linux'
  extend_path '/sbin'
  extend_path '/usr/sbin'
  extend_path '/usr/local/sbin'

  eval `/usr/bin/dircolors ~/.dircolors.ansi-dark`

  # enable color support of ls and also add handy aliases
  if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
  fi

  if [[ -d /home/linuxbrew/.linuxbrew ]];
  then
    BREW_PATH=/home/linuxbrew/.linuxbrew
    prepend_path "$BREW_PATH/bin"
    prepend_path "$BREW_PATH/sbin"
  fi
}

# Load OS specific settings
case "`uname`" in
  'Darwin')
    load_darwin ;;
  'Linux')
    load_linux ;;
esac

bind "set completion-ignore-case on"

# Setup n (node version manager)
export N_PREFIX=/opt/n
prepend_path "$N_PREFIX/bin"

## Set up yarn if installed
if [[ -d $HOME/.yarn ]];
then
  prepend_path "$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
fi

# If we have installed fzf source it!
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash


################################################################################
# Local environment
################################################################################

# Load local configuration settings
if [ -f "$HOME/.local_config/.bash_local" ]; then
  echo Loading local settings
  . "$HOME/.local_config/.bash_local"
fi

################################################################################
#         Run tips at login
################################################################################
if [ -z $VIMRUNTIME ]; then
  tip
fi

