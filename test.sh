#! /bin/bash

function readnum::test {
    rec=$(./readnum.sh ${1})
    if [[ ${2} = ${rec} ]]; then
        echo -e "[\e[32mPASS\e[39m] ${1} reads ${rec} "
    else
        echo -e "[\e[31mFAIL\e[39m] ${1} reads ${rec} "
    fi
}

readnum::test 1 1
readnum::test 5 5
readnum::test 10 shi
readnum::test 18 shi8
readnum::test 22 2shi2
readnum::test 100 1bai
readnum::test 105 1bai05
readnum::test 2001 2qian01
readnum::test 2010 2qian01shi
readnum::test 5555 5qian5bai5shi5
readnum::test 6600 6qian6bai
readnum::test 120301 shi2wan03bai01
readnum::test 31009019 3qian1baiwan9qian01shi9
readnum::test 2031009019 2shiyi3qian1baiwan9qian01shi9
readnum::test 10122031009019 shiwan1qian2bai2shiyi3qian1baiwan9qian01shi9