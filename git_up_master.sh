git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
echo "-------- END PUSH[$(pwd)] ----------";
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> dev
git checkout master --
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
<<<<<<< HEAD
=======
=======
>>>>>>> 5f13fe2 (first)
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
git checkout master --
<<<<<<< HEAD
>>>>>>> 2bf991e (first)
=======
>>>>>>> 5f13fe2 (first)
=======
>>>>>>> dev
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout master --
git pull origin master --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
echo "-------- END PULL[$(pwd)] ----------";
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> 2bf991e (first)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> 5f13fe2 (first)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> dev
