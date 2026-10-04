[[ $- != *i* ]] && return
HISTCONTROL=ignoreboth
PROMPT_COMMAND="history -a; history -n${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
PS1='[\[\033[96m\]\u\[\033[00m\]@\[\033[34m\]\h\[\033[00m\] \[\033[96m\]\W\[\033[00m\]]\$ '
export COLORTERM=truecolor
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias startx='startx && clear'
eval "$(fzf --bash)"
eval "$(zoxide init bash --cmd cd)"
