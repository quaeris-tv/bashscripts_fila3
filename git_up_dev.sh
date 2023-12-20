git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
git add -A && aicommits  || echo '---------------------------empty'
git push origin dev -u --progress 'origin' || git push --set-upstream origin dev
echo "-------- END PUSH[$(pwd)] ----------";
git checkout dev --
git branch --set-upstream-to=origin/dev dev
git branch -u origin/dev
git merge dev
<<<<<<< HEAD
<<<<<<< HEAD
#git merge master 
=======
=======
>>>>>>> 632fcf11 (Add git_up_dev.sh script for handling dev branch)
<<<<<<< HEAD
git merge master 
=======
>>>>>>> d05b8561 (Add git_up_dev.sh script for handling dev branch)
<<<<<<< HEAD
>>>>>>> a93b63c7 (Add git_up_dev.sh script for handling dev branch)
=======
=======
>>>>>>> d05b8561 (Add git_up_dev.sh script for handling dev branch)
>>>>>>> 632fcf11 (Add git_up_dev.sh script for handling dev branch)
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout dev --
git pull origin dev --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
echo "-------- END PULL[$(pwd)] ----------";
