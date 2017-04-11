function mfpfwd --description 'Forward MFP ports through intermediate server'
	set user emma
    set server dev6.sec.kmbs.us
    set mfp $argv[1]
    if test -z $mfp
        echo "Usage: mfp_foward MFP_ADDRESS"
        return
    end
    if echo $mfp | grep -q 10.10.221
        set server polaris.sep.net
    end
    sudo ssh -v -L 8090:$mfp:8090 -L8091:$mfp:8091 -L443:$mfp:443 -L80:$mfp:80 -L50003:$mfp:50003 -L50001:$mfp:50001 $user@$server
end
