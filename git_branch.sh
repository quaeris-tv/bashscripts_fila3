#!/bin/sh
git submodule foreach "git branch --set-upstream-to=origin/master master"
git submodule foreach "git branch -m master"
git submodule foreach "git merge master"
git submodule foreach "git checkout master --"
git branch --set-upstream-to=origin/master master
git branch -m master
git merge master
git checkout master --
#read -p "Press [Enter] key to exit..."
echo '-------- END BRANCH ----------';
