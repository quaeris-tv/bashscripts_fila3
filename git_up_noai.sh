#!/bin/sh
if [ "$1" ]; then
     echo yes
else
    echo 'aggiungere il branch ./bashscripts/git_up_noai.sh  <branch>'
    exit 1
fi
me=$( readlink -f -- "$0";)
branch=$1
where=$(pwd)
git submodule update --progress --init --recursive --force --merge --rebase --remote
git submodule foreach "$me" "$branch"
git config core.fileMode false
git add --renormalize -A
#git add -A && aicommits  || echo '---------------------------empty'
git add -A && git commit -am "up"  || echo '---------------------------empty'
git push origin $branch -u --progress 'origin' || git push --set-upstream origin $branch
echo "-------- END PUSH[$where ($branch)] ----------";
git checkout $branch --
git branch --set-upstream-to=origin/$branch $branch
git branch -u origin/$branch
git merge $branch
echo "-------- END BRANCH[$where ($branch)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout $branch --
git pull origin $branch --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#old branches
#git push origin --delete cs0.2.03
#git push origin --delete cs0.2.04
#git push origin --delete cs0.2.05
#git push origin --delete cs0.2.06
#git push origin --delete cs0.2.07
#git push origin --delete cs0.2.08
#git push origin --delete cs0.2.09
#git push origin --delete cs0.2.10
sed -i -e 's/\r$//' "$me"
echo "-------- END PULL[$where ($branch)] ----------";

