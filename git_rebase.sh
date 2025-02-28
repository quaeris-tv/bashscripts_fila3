#!/bin/bash
if [ "$2" ]; then
     echo yes
else
    echo 'aggiungere il branch ./bashscripts/git_rebase.sh  <count> <branch>'
    exit 1
fi
me=$( readlink -f -- "$0";)
count=$1
branch=$2
where=$(pwd)
echo "N: $count"
for(( i=1; i<=$count; i++ ))
do
git add -A && oco --yes && git rebase --continue || git push -uf origin HEAD:$branch && git rebase --continue || git rebase --continue || echo "loop: $i"
done 
