# ~/.bashrc for shadow

# Load system bashrc
[ -f /etc/bashrc ] && . /etc/bashrc

# Git branch in prompt
git_branch() {
    git symbolic-ref --short HEAD 2>/dev/null
}

# Prompt colors
BLUE='\[\e[34m\]'
GREEN='\[\e[32m\]'
GRAY='\[\e[90m\]'
RESET='\[\e[0m\]'

# Prompt:
# shadow@host ~/path (git-branch)
PS1="${GREEN}\u${GRAY}@\h ${BLUE}\w${GRAY} \$(git_branch)${RESET}\n$ "

# Useful aliases
alias ll='ls -lah'
alias ..='cd ..'
alias ...='cd ../..'
alias gs='git status'
alias gl='git log --oneline --graph --decorate'

# Editor default
export EDITOR=vi
