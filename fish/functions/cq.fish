function cq
	set search $argv[1..-1]
    cmus-remote -C /(echo $search)
    cmus-remote -C 'win-add-q'
end
