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
