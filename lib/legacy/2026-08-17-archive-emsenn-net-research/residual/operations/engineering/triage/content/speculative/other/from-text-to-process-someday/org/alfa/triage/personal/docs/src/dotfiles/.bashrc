export PATH=$PATH:/home/emsenn/bin

# Check for an interactive session
[ -z "$PS1" ] && return

alias ls='ls -la --color=auto'
alias gl='ls --color=auto'
PS1='[\u@\h \W]\$ '
