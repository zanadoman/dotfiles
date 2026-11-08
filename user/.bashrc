[[ $- != *i* ]] && return
HISTCONTROL=ignoreboth
alias clear='clear && fastfetch'
alias hyprland='[ $XDG_SESSION_TYPE = tty ] && hyprland && clear'
alias start-hyprland='[ $XDG_SESSION_TYPE = tty ] && start-hyprland && clear'
export PAGER=less
export VISUAL=nvim
export TERMINAL=foot
export BROWSER=chromium
eval "$(starship init bash)"
eval "$(zoxide init bash --cmd cd)"
eval "$(fzf --bash)"
clear
