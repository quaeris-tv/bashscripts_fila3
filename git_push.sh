git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
#git add -A && git commit -am 'up'  || git rebase --continue || echo '---------------------------empty'
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
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
>>>>>>> e58576c (rebase 5)
