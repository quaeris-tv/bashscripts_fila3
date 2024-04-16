#!/bin/bash
<<<<<<< HEAD
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
git add -A && oco && git rebase --continue || git push -uf origin HEAD:$branch && git rebase --continue || git rebase --continue || echo "loop: $i"
=======
echo "N: $1"
for(( i=1; i<=$1; i++ ))
do
git add -A && oco && git rebase --continue || git rebase --continue || git push -u || echo "loop: $i"
>>>>>>> e167c2c6 (up)
done 
