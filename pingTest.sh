
while read f
do 
    varName=`echo $f | egrep "server"`
    if [ "$?" -eq 0 ] ; then
        echo $f | egrep -o '[[:alnum:]]+' | head -1
        varIP=`echo $f | egrep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'`
        ping $varIP -c 4
        if [ "$?" -eq 0 ] ; then
            echo "Is alive :)"
            varFlag=`echo $f | egrep '(\s[#]|^[#])[[:space:]]*(server)'`
            if [ "$?" -eq 0 ] ; then
                echo "Got # pls delete it"
                f=`echo $f | sed 's/#//g'`

            else
                echo "Everything planned"
            fi
        else
            echo "Is dead :("
            varFlag=`echo $f | egrep '(\s[#]|^[#])[[:space:]]*(server)'`
            if [ "$?" -eq 0 ] ; then
                echo "Everything planned got #"
            else
                echo "Need # because i'm offline"
                f=`echo $f | sed 's/^/#/'`
            fi
        fi
    fi
    echo $f >> outputFile.txt
done < cfg.txt
mv outputFile.txt cfg.txt