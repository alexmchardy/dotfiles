#!/bin/bash
# .bash_aliases

alias grep='grep --color'
alias egrep='egrep --color=always'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ll='ls -lart'
alias la='ls -A'

alias tree='tree -C'
alias myip='http https://ifconfig.co/json | jq .'

alias json='jq .'

# Alias git to hub
eval "$(which hub &>/dev/null && hub alias -s)"

alias useful='cat ~useful ~/local/useful'
