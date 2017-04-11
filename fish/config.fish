function fish_greeting
    fortune-goat
    echo
end

set TF_ALIAS fuck
function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_command $history[1]
    thefuck $fucked_up_command > $eval_script
    . $eval_script
    /bin/rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_command
    end
end

alias pybugs=/home/emma/src/pybugs/pybugs
alias bug=/home/emma/src/pybugs/pybugs
alias python=python3
alias appbuild='python /home/emma/src/bmp/pack/app.py bundle'
alias manifest='python /home/emma/src/bmp/pack/manifest_generator.py'
alias bmppack='python /home/emma/src/bmp/pack/app.py'

setxkbmap -option ctrl:nocaps
tput smkx

set -x PAGER 'most'
set -x VISUAL 'subl -nw'
set -x EDITOR $VISUAL
set -x PATH $PATH /usr/local/go/bin $HOME/src/go/bin $HOME/bin $HOME/src/npm-global/bin
set -x GOPATH $HOME/src/go
set -x GOBIN $HOME/src/go/bin
if not set -q mfp_ip
    set -xg mfp_ip 'c554.sep.net'
end
