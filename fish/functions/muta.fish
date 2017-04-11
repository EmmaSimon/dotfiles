function muta
	if begin; not count $argv; or count (echo -n $argv[1] | sed 's/[0-9]//g'); end > /dev/null ^&1
        echo "That doesn't look like a valid app ID..."
        return
    end

    python2 app/meta/build.py
    if math (count $argv) " > 1" > /dev/null ^&1
        mfp u app app/$argv[1] $argv[2..-1]
    else
        mfp u app app/$argv[1]
    end
end
