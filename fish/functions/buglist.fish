function buglist
	set split 0
    set path (realpath ~/tmp/buglist)

    getopts $argv | while read -l key value
        switch $key
        case s split
            set split 1
        case p path
            if ls $value > /dev/null ^ /dev/null
                set path $value
            else
                set_color red
                echo "Could not read file" $args[$i]
                set_color yellow
                echo "Falling back to $path"
                set_color normal
            end
        case _
            if ls $value > /dev/null ^ /dev/null
                set path $value
            else
                set_color red
                echo "Could not read file" $args[$i]
                set_color yellow
                echo "Falling back to $path"
                set_color normal
            end
        end
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
