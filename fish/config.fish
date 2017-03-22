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

function bug
    eval python2 /home/emma/src/pybugs/pybugs $argv
end

function buglist
    set split 0
    set path (realpath ~/tmp/buglist)
    set args (getopt -a -s sh -o sp: -l split,path: -- $argv); or return
    set args (fish -c "for el in $args; printf \"%s\n\" \"\$el\"; end")

    set i 1
    while true
        switch $args[$i]
            case "-s" "--split"
                set split 1
            case "-p" "--path"
                set i (math "$i + 1")
                if ls $args[$i] > /dev/null ^ /dev/null
                    set path $args[$i]
                end
            case "--"
                set i (math "$i + 1")
                if math "$i" \> (count $args) > /dev/null ^ /dev/null;
                    break
                end
                if ls $args[$i] > /dev/null ^ /dev/null
                    set path $args[$i]
                else
                    set_color red
                    echo "Could not read file" $args[$i]
                    set_color yellow
                    echo "Falling back to $path"
                    set_color normal
                end
                break
        end
        set i (math "$i + 1")
    end
    set bugs (cat $path)

    if math $split > /dev/null ^ /dev/null
        for b in $bugs
            if echo $b | grep -v -e '^[[:space:]]*$' > /dev/null ^ /dev/null
                echo $b | cut -d '-' -f2
            end
        end
        return
    end
    for b in $bugs
        set line $line (echo $b | cut -d '-' -f2)
    end
    echo $line
end

function notebugs
    if test (count $argv) = 0
        set bugs (buglist -s)
    else if ls $argv[1] > /dev/null ^ /dev/null
        set bugs (buglist $argv[1] -s)
    else if math (count $argv) \> 0 > /dev/null ^ /dev/null
        set bugs $argv
    end

    for b in $bugs
        bug note $b
    end
end

alias pybugs=bug
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
set -x mfp_ip 'c554.sep.net'
