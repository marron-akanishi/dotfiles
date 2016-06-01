#! /bin/bash

if [$1 = ""]; then
    echo "Please input commit comment."
    exit -1
fi
git add .
git commit -m $1
git push origin master
