git submodule foreach "git add --renormalize -A"
git submodule foreach "git add -A && git commit -am 'up' || git rebase --continue || echo '---------------------------empty' "
git submodule foreach "git push origin master -u --progress 'origin' || git push --set-upstream origin master "

git add --renormalize -A 
git add -A && git commit -am 'up'  || git rebase --continue || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master  

#git submodule foreach git rebase origin/master --force 
#git rebase origin/master --force 

echo '-------- END PUSH ----------';

git submodule foreach "git branch --set-upstream-to=origin/master master"
git submodule foreach "git branch -m master"
git submodule foreach "git merge master"
git submodule foreach "git checkout master --"
git branch --set-upstream-to=origin/master master
git branch -m master
git merge master
git checkout master --
#read -p "Press [Enter] key to exit..."
echo '-------- END BRANCH ----------';

git submodule update --progress --init --recursive --force --merge --rebase --remote
git submodule foreach git checkout master --
git submodule foreach git pull origin master --autostash  --allow-unrelated-histories --prune --rebase
git submodule foreach "git submodule foreach 'git pull origin master --rebase --autostash && git rebase origin/master && git merge master && git checkout master --'"
git pull --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase  "origin"
#read -p "Press [Enter] key to exit..."
echo '-------- END PULL ----------';
