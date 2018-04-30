function fish_greeting
    fortune ~/.tmg
    echo
end

tput smkx
function st_smkx --on-event fish_postexec
    tput smkx
end
function st_rmkx --on-event fish_preexec
    tput rmkx
end

alias python=python3
alias git=lab
alias ls='exa --group-directories-first'
alias ll='exa -l --group-directories-first --git'
alias lt='exa -lT --group-directories-first --git'
alias lr='exa -lRT --group-directories-first --git'
alias sps='sudo pacman-proxy -S'
alias pas='pacaur -S'
alias mx='tmuxinator dev'

set -x PAGER 'most'
set -x VISUAL 'subl -nw'
set -x EDITOR $VISUAL
set -x PATH $PATH $HOME/src/misc/go/bin $HOME/bin $HOME/src/misc/npm-global/bin $HOME/.gem/ruby/2.5.0/bin
set -x GOPATH $HOME/src/misc/go
set -x GOBIN $HOME/src/misc/go/bin
