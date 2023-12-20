<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> caec2df (Update git scripts and add directory information)
=======
>>>>>>> dev
=======
>>>>>>> caec2df (Update git scripts and add directory information)
=======
>>>>>>> b3a67b2 (first)
=======
>>>>>>> dev
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
#git add -A && git commit -am 'up'  || git rebase --continue || echo '---------------------------empty'
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
echo "-------- END PUSH[$(pwd)] ----------";
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> a176205 (first)
git submodule foreach "git add --renormalize -A"
git submodule foreach "git add -A && git commit -am 'up' || git rebase --continue || echo '---------------------------empty' "
git submodule foreach "git push origin master -u --progress 'origin' || git push --set-upstream origin master "

git add --renormalize -A 
git add -A && git commit -am 'up'  || git rebase --continue || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master  

#git submodule foreach git rebase origin/master --force 
#git rebase origin/master --force 

echo '-------- END PUSH ----------';

#git push --set-upstream origin master
#git submodule foreach git push --set-upstream origin master
#git push origin master
#git submodule foreach git checkout master --
#git submodule foreach git push --progress "origin" master:master
#read -p "Press [Enter] key to exit..."
<<<<<<< HEAD
>>>>>>> a176205 (first)
=======
>>>>>>> caec2df (Update git scripts and add directory information)
=======
>>>>>>> dev
=======
>>>>>>> a176205 (first)
=======
>>>>>>> caec2df (Update git scripts and add directory information)
=======
>>>>>>> b3a67b2 (first)
=======
>>>>>>> dev
