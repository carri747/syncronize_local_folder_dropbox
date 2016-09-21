#!/bin/bash
sourcen=[path_source /home/user/test]
dropboxuploader=[path where is dropbox-uploader installed]/
dropboxhome=[path where the file will be syncronize in dropbox]
list=/tmp/listado.txt

log=/var/log/backup_dropbox.log

cd $origen

#Find files update in the last 10 minutes
find /path-directorio -amin -10 > $list

cd $dropboxuploader

sizeorigen=$[${#origen}+1]


IFS=$'\n' ; for n in $(cat $list | grep -v -e Listing -e DONE | sed 's/\ \[F\]\ //g');
do
        l=$[${#n}+1]
        targeto=$(echo $n| cut -c$sizeorigen-$l)
        ./dropbox_uploader.sh upload ${n} $dropboxhome${target}
done

rm -r $list
