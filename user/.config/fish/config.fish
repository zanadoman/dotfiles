not status is-interactive && return
set -U fish_greeting
set -g fish_cursor_default beam
alias clear='clear && fastfetch'
alias hyprland='test $XDG_SESSION_TYPE = tty && command hyprland && clear'
alias start-hyprland='test $XDG_SESSION_TYPE = tty && command start-hyprland && clear'
set -x PAGER less
set -x VISUAL nvim
set -x TERMINAL foot
set -x BROWSER chromium
starship init fish | source
zoxide init fish --cmd cd | source
fzf --fish | source
clear
