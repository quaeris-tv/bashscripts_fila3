git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
<<<<<<< HEAD
<<<<<<< HEAD
#git add -A && aicommits  || echo '---------------------------empty'
git add -A && oco  || echo '---------------------------empty'
=======
git add -A && aicommits  || echo '---------------------------empty'
>>>>>>> 2bf991e (first)
=======
git add -A && aicommits  || echo '---------------------------empty'
>>>>>>> 5f13fe2 (first)
git push origin dev -u --progress 'origin' || git push --set-upstream origin dev
echo "-------- END PUSH[$(pwd)] ----------";
git checkout dev --
git branch --set-upstream-to=origin/dev dev
git branch -u origin/dev
git merge dev
<<<<<<< HEAD
#git merge master 
=======
git merge master 
>>>>>>> 5f13fe2 (first)
echo "-------- END BRANCH[$(pwd)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout dev --
git pull origin dev --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
#read -p "Press [Enter] key to exit..."
<<<<<<< HEAD
<<<<<<< HEAD
echo "-------- END PULL[$(pwd)] ----------";
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> 2bf991e (first)
=======
echo "-------- END PULL[$(pwd)] ----------";
>>>>>>> 5f13fe2 (first)
