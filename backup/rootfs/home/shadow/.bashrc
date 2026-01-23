# User bashrc — Project Alpha

GREEN="\[\e[1;32m\]"
BLUE="\[\e[1;34m\]"
RESET="\[\e[0m\]"

PS1="${GREEN}\u@\h${RESET}:${BLUE}\w${RESET}$ "

alias ll='ls -lah --color=auto'
alias grep='grep --color=auto'
alias df='df -h'
alias free='free -h'

echo "Welcome to Project Alpha"
