git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
#git add -A && aicommits  || echo '---------------------------empty'
git add -A && git commit -am "up"  || echo '---------------------------empty'
git push origin $1 -u --progress 'origin' || git push --set-upstream origin $1
echo "-------- END PUSH[$(pwd) ($1)] ----------";
git checkout $1 --
git branch --set-upstream-to=origin/$1 $1
git branch -u origin/$1
git merge $1
echo "-------- END BRANCH[$(pwd) ($1)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout $1 --
git pull origin $1 --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
echo "-------- END PULL[$(pwd) ($1)] ----------";


