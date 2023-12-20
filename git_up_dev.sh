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
<<<<<<< HEAD
#git merge master 
=======
git merge master 
>>>>>>> 7bf24b0 (Add git_up_dev.sh script with necessary commands for updating the dev branch)
=======
git merge master 
>>>>>>> 35d1d97 (Add git_up_dev.sh script with necessary commands for updating the dev branch)
=======
git merge master 
>>>>>>> f9571bd (Add git_up_dev.sh script with necessary commands for updating the dev branch)
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout dev --
git pull origin dev --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
echo "-------- END PULL[$(pwd)] ----------";
