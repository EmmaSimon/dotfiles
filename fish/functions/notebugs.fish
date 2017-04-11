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
