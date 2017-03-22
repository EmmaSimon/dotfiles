function mx
	set session "dev"

    if not tmux has-session -t $session > /dev/null ^&1
        tmux new-session -s $session -d
        tmux rename-window 'dev'
        tmux send-keys -t $session 'cd ~/src/bmp' C-m
        tmux new-window -t $session:99 -n '♪'
        tmux send-keys -t $session:99 'cmus' C-m
        tmux select-window -t 'dev'
    end

    tmux attach -t $session
end
