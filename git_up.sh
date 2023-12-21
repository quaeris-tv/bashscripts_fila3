<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 5d5b6964 (.)
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
echo "-------- END PUSH[$(pwd)] ----------";
<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD
git checkout master --
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
=======
>>>>>>> 5d5b6964 (.)
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
git checkout master --
<<<<<<< HEAD
=======
=======
git checkout master --
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
>>>>>>> ed812984 (first)
>>>>>>> bb09ef32 (rebase 1/1)
>>>>>>> 5d5b6964 (.)
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout master --
git pull origin master --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
echo "-------- END PULL[$(pwd)] ----------";
<<<<<<< HEAD
=======
=======
git submodule foreach "git add --renormalize -A"
git submodule foreach "git add -A && git commit -am 'up' || git rebase --continue || echo '---------------------------empty' "
git submodule foreach "git push origin master -u --progress 'origin' || git push --set-upstream origin master "

=======
git submodule foreach $( readlink -f -- "$0"; );
>>>>>>> 5049dea8 (up)
git add --renormalize -A 
#git add -A && git commit -am 'up'  || git rebase --continue || echo '---------------------------empty'
=======
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
>>>>>>> d7cfbca7 (Update git_up.sh script and optimize git commands)
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
echo "-------- END PUSH[$(pwd)] ----------";
=======
<<<<<<< HEAD
>>>>>>> bb09ef32 (rebase 1/1)
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
git checkout master --
=======
git checkout master --
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
>>>>>>> ed812984 (first)
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout master --
git pull origin master --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
echo '-------- END PULL ----------';
>>>>>>> 5c7db631 (.)
=======
echo '-------- END PULL[$(pwd)] ----------';
>>>>>>> 5049dea8 (up)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> c44cc4c1 (up)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> c44cc4c1 (up)
>>>>>>> 5d5b6964 (.)
