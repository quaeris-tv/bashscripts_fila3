<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
<<<<<<< HEAD
<<<<<<< HEAD
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
echo "-------- END PUSH[$(pwd)] ----------";
git checkout master --
git branch --set-upstream-to=origin/master master
git branch -u origin/master
<<<<<<< HEAD
<<<<<<< HEAD
git merge master
#git merge dev 
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout master --
git pull origin master --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
echo "-------- END PULL[$(pwd)] ----------";
=======
git submodule foreach "git add --renormalize -A"
git submodule foreach "git add -A && git commit -am 'up' || git rebase --continue || echo '---------------------------empty' "
git submodule foreach "git push origin master -u --progress 'origin' || git push --set-upstream origin master "

=======
git submodule foreach $( readlink -f -- "$0";)
>>>>>>> e65ec99 (up)
git add --renormalize -A 
git add -A && git commit -am 'up'  || git rebase --continue || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master  
=======
#git add -A && git commit -am 'up'  || git rebase --continue || echo '---------------------------empty'
=======
>>>>>>> eeec84b (.)
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
>>>>>>> 15ce32a (Improve git_up.sh script)
echo "-------- END PUSH[$(pwd)] ----------";
git branch --set-upstream-to=origin/master master
git branch -u origin/master
=======
>>>>>>> 464e6f0 (Change branch tracking to origin/masterCo-authored-by: Assistant)
=======
>>>>>>> 1030917 (Change branch tracking to origin/masterCo-authored-by: Assistant)
=======
=======
>>>>>>> dev
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
echo "-------- END PUSH[$(pwd)] ----------";
git branch --set-upstream-to=origin/master master
git branch -u origin/master
<<<<<<< HEAD
>>>>>>> b3a67b2 (first)
=======
>>>>>>> dev
git merge master
git checkout master --
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout master --
git pull origin master --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
echo '-------- END PULL ----------';
>>>>>>> a176205 (first)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> e65ec99 (up)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> b3a67b2 (first)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> dev
