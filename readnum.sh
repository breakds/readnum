#! /bin/bash
echo "0000000000000${1}" | \
sed -e :a -e "s/\(.*[0-9]\)\([0-9]\)\([0-9]\)\([0-9]\)\([0-9]\)/\1,\2qian\3bai\4shi\5/;ta" \
    -e "s/0\(\(qian\)\|\(bai\)\|\(shi\)\)/0/g" \
    -e :b -e "s/^0\+,*//;tb" -e "s/^1shi/shi/" \
    -e "s/0\+\($\|,\)/\1/g" \
    -e "s/00\+/0/" \
    -e :c -e "s/\(.*\),\([^,]\+\)/\1wan\2/" -e "s/\(.*\),\([^,]\+\)/\1yi\2/;tc"