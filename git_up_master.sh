<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> c219998 (first)
=======
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
>>>>>>> 2d9f4fb (Rename git_up.sh and git_up_noai.sh to git_up_master.sh and git_up_master_noai.sh respectively)
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
echo "-------- END PUSH[$(pwd)] ----------";
git checkout master --
git branch --set-upstream-to=origin/master master
git branch -u origin/master
<<<<<<< HEAD
<<<<<<< HEAD
git merge master
=======
<<<<<<< HEAD
<<<<<<< HEAD
git merge master
#git merge dev 
=======
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
echo "-------- END PUSH[$(pwd)] ----------";
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
git checkout master --
>>>>>>> b3a67b2 (first)
=======
git merge master
>>>>>>> 2d9f4fb (Rename git_up.sh and git_up_noai.sh to git_up_master.sh and git_up_master_noai.sh respectively)
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout master --
git pull origin master --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
<<<<<<< HEAD
echo "-------- END PULL[$(pwd)] ----------";
<<<<<<< HEAD
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
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
echo "-------- END PUSH[$(pwd)] ----------";
git branch --set-upstream-to=origin/master master
git branch -u origin/master
>>>>>>> b3a67b2 (first)
git merge master
git checkout master --
>>>>>>> c219998 (first)
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout master --
git pull origin master --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
echo "-------- END PULL[$(pwd)] ----------";
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> 1283aaa (first)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> dd31420 (first)
=======
=======
>>>>>>> eee2a47 (.)
echo '-------- END PULL ----------';
>>>>>>> a176205 (first)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> e65ec99 (up)
<<<<<<< HEAD
>>>>>>> c219998 (first)
=======
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> b3a67b2 (first)
>>>>>>> eee2a47 (.)
=======
>>>>>>> b3a67b2 (first)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> 2d9f4fb (Rename git_up.sh and git_up_noai.sh to git_up_master.sh and git_up_master_noai.sh respectively)
