function hopup
	hopi c554.sep.net web upload 1234567812345678 0A0243A9 app app/$argv (for i in (git ls-files -m); basename $i; end)
end

function hopall
    hopi c554.sep.net web upload 1234567812345678 0A0243A9 app app/$argv
end

function fish_greeting
	fortune
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

alias pybugs='python2 /home/emma/pybugs/pybugs'
alias python=python3
export EDITOR='subl -n -w'
export mfp_ip='c554.sep.net'
set mfp_ip 'c554.sep.net'
