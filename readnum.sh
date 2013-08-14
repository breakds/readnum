#! /bin/bash
echo "0000000000000000${1}" | \
sed -e :a -e "s/\(.*[0-9]\)\([0-9]\)\([0-9]\)\([0-9]\)\([0-9]\)/\1,\2qian\3bai\4shi\5/;ta" \ # group by 4 digits and read names
    -e "s/0\(\(qian\)\|\(bai\)\|\(shi\)\)/0/g" \ # silent names
    -e :b -e "s/^0\+,*//;tb" -e "s/^1shi/shi/" \ # leading 0/1 fix
    -e "s/0000\($\|,\)/*\1/g" \ # mark all 0 groups
    -e "s/0\+\($\|,\)/\1/g" \ # eliminate trailing 0s in group
    -e :c -e "s/\(.*\),\([^,]\+\)/\1wan\2/" -e "s/\(.*\),\([^,]\+\)/\1yi\2/;tc" \ # read comma as wan and yi
    -e "s/*wan/0/g" -e :d -e "s/[0*]yi/yi/;td" \ # handle 0yi/0wan
    -e "s/00\+/0/g" -e "s/[0*]\+$//" # compressed 0s and trailing 0s

