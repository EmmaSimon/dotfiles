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

setxkbmap -option ctrl:nocaps

alias pybugs=/home/emma/src/programs/pybugs/pybugs
alias bug=/home/emma/src/programs/pybugs/pybugs
alias python=python3
alias appbuild='python /home/emma/src/bmp/pack/app.py bundle'
alias manifest='python /home/emma/src/bmp/pack/manifest_generator.py'
alias bmppack='python2 /home/emma/src/bmp/tada/app.py'
alias ls='exa --group-directories-first'
alias ll='exa -l --group-directories-first --git'
alias lt='exa -lT --group-directories-first --git'
alias lr='exa -lRT --group-directories-first --git'
alias sps='sudo pacman -S'
alias pas='pacaur -S'
alias mx='tmuxinator dev'

set -x PAGER 'most'
set -x VISUAL 'subl -nw'
set -x EDITOR $VISUAL
set -x PATH $PATH /usr/local/go/bin $HOME/src/misc/go/bin $HOME/bin $HOME/src/misc/npm-global/bin
set -x GOPATH $HOME/src/misc/go
set -x GOBIN $HOME/src/misc/go/bin
if not set -q mfp_ip
    set -xg mfp_ip 'c554.sep.net'
end
