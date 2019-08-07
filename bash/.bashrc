set -o vi
alias bye='shutdown'
alias rxvt-unicode='urxvt'
alias rxvt-unicode-256color='urxvt'
alias ls='ls --color=auto'
alias v='vim'

#pywal activation
(cat ~/.cache/wal/sequences &)

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
# ctf-tools: PATH setup
export PATH=/home/kuba/ctf/ctf-tools/bin:$PATH
export EDITOR=vim
