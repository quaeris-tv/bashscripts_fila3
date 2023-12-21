<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> e3ae4588 (Update git_branch.sh and git_push.sh)
=======
>>>>>>> e3ae4588 (Update git_branch.sh and git_push.sh)
>>>>>>> 5d5b6964 (.)
>>>>>>> 37b0029 (first)
git submodule foreach $( readlink -f -- "$0";)
git add --renormalize -A
#git add -A && git commit -am 'up'  || git rebase --continue || echo '---------------------------empty'
git add -A && aicommits  || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master
<<<<<<< HEAD
echo "-------- END PUSH[$(pwd)] ----------";
=======
<<<<<<< HEAD
echo "-------- END PUSH[$(pwd)] ----------";
=======
<<<<<<< HEAD
<<<<<<< HEAD
echo "-------- END PUSH[$(pwd)] ----------";
=======
git submodule foreach "git add --renormalize -A"
git submodule foreach "git add -A && git commit -am 'up' || git rebase --continue || echo '---------------------------empty' "
git submodule foreach "git push origin master -u --progress 'origin' || git push --set-upstream origin master "

=======
git submodule foreach $( readlink -f -- "$0"; );
>>>>>>> c44cc4c1 (up)
=======
git submodule foreach $( readlink -f -- "$0"; );
>>>>>>> c44cc4c1 (up)
git add --renormalize -A 
git add -A && git commit -am 'up'  || git rebase --continue || echo '---------------------------empty'
git push origin master -u --progress 'origin' || git push --set-upstream origin master  
echo "-------- END PUSH[$(pwd)] ----------";

#git push --set-upstream origin master
#git submodule foreach git push --set-upstream origin master
#git push origin master
#git submodule foreach git checkout master --
#git submodule foreach git push --progress "origin" master:master
#read -p "Press [Enter] key to exit..."
>>>>>>> 4f180474 (first)
=======
echo "-------- END PUSH[$(pwd)] ----------";
>>>>>>> e3ae4588 (Update git_branch.sh and git_push.sh)
=======
echo "-------- END PUSH[$(pwd)] ----------";
>>>>>>> e3ae4588 (Update git_branch.sh and git_push.sh)
>>>>>>> 5d5b6964 (.)
>>>>>>> 37b0029 (first)
