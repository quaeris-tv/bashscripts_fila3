git submodule update --progress --init --recursive --force --merge --rebase --remote
git submodule foreach git checkout master --
git submodule foreach git pull origin master --autostash  --allow-unrelated-histories --prune --rebase
git submodule foreach "git submodule foreach 'git pull origin master --rebase --autostash && git rebase origin/master && git merge master && git checkout master --'"
git pull --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase  "origin"
#read -p "Press [Enter] key to exit..."
echo '-------- END PULL ----------';
