git submodule foreach $( readlink -f -- "$0";)
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
git checkout master --
#read -p "Press [Enter] key to exit..."
<<<<<<< HEAD
<<<<<<< HEAD
echo "-------- END BRANCH[$(pwd)] ----------";
=======
echo "-------- END BRANCH[$(pwd)] ----------";
>>>>>>> 1283aaa (first)
=======
echo "-------- END BRANCH[$(pwd)] ----------";
>>>>>>> dd31420 (first)
