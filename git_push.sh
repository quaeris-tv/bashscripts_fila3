<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
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
<<<<<<< HEAD
>>>>>>> c219998 (first)
=======
=======
>>>>>>> b3a67b2 (first)
>>>>>>> eee2a47 (.)
=======
>>>>>>> b3a67b2 (first)
=======
>>>>>>> 409c33a (.)
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
#git add -A && git commit -am 'up'  || git rebase --continue || echo '---------------------------empty'
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
echo "-------- END PUSH[$(pwd)] ----------";
=======
<<<<<<< HEAD
echo "-------- END PUSH[$(pwd)] ----------";
=======
echo "-------- END PUSH[$(pwd)] ----------";
>>>>>>> 1283aaa (first)
<<<<<<< HEAD
>>>>>>> 9146629 (rebase 2)
=======
=======
echo "-------- END PUSH[$(pwd)] ----------";
>>>>>>> dd31420 (first)
<<<<<<< HEAD
>>>>>>> e58576c (rebase 5)
=======
=======
echo "-------- END PUSH[$(pwd)] ----------";
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
<<<<<<< HEAD
>>>>>>> c219998 (first)
<<<<<<< HEAD
>>>>>>> 0809004 (rebase 7)
=======
=======
=======
>>>>>>> b3a67b2 (first)
>>>>>>> eee2a47 (.)
<<<<<<< HEAD
>>>>>>> b4f13a0 (rebase 8)
=======
=======
echo "-------- END PUSH[$(pwd)] ----------";
>>>>>>> b3a67b2 (first)
>>>>>>> 568344a (rebase 9)
=======
>>>>>>> 8f35797 (up)
=======
echo "-------- END PUSH[$(pwd)] ----------";
>>>>>>> 409c33a (.)
