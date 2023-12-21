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
#git merge master 
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
#git merge master 
=======
git merge master 
>>>>>>> cbb3d89d (Add and update git code for dev branch)
=======
>>>>>>> d05b8561 (Add git_up_dev.sh script for handling dev branch)
=======
#git merge master 
>>>>>>> decf36077db1822c8ffc41d15fd34ecfcdb048d3
>>>>>>> 37b0029 (first)
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout dev --
git pull origin dev --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
<<<<<<< HEAD
echo "-------- END PULL[$(pwd)] ----------";
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
echo "-------- END PULL[$(pwd)] ----------";
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> cbb3d89d (Add and update git code for dev branch)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> d05b8561 (Add git_up_dev.sh script for handling dev branch)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> decf36077db1822c8ffc41d15fd34ecfcdb048d3
>>>>>>> 37b0029 (first)
