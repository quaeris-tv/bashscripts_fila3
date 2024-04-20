#!/bin/bash
if [ "$2" ]; then
     echo yes
else
    echo 'aggiungere il branch ./bashscripts/git_rebase.sh <number> <branch>'
    exit 1
fi
me=$( readlink -f -- "$0";)
branch=$2
where=$(pwd)
number=$1
echo "N: $number"
for(( i=1; i<=$number; i++ ))
do
<<<<<<< HEAD
git add -A && git commit -am "rebase $1" && git push origin HEAD:$branch -uf && git rebase --continue || git rebase --continue || git push origin HEAD:$branch -uf || echo "loop: $i"
done 
=======
git add -A && git commit -am "rebase $1" && git push origin HEAD:dev -u && git rebase --continue || git rebase --continue || git push origin HEAD:dev -uf || echo "loop: $i"
done 
>>>>>>> d95479d99794b50c6095c5f6ddf1f05a877b0c9e
