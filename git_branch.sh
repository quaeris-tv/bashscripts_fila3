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
>>>>>>> 5d5b6964 (.)
>>>>>>> 37b0029 (first)
git submodule foreach $( readlink -f -- "$0";)
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
git checkout master --
#read -p "Press [Enter] key to exit..."
echo "-------- END BRANCH[$(pwd)] ----------";
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
=======
#!/bin/sh
git submodule foreach "git branch --set-upstream-to=origin/master master"
git submodule foreach "git branch -m master"
git submodule foreach "git merge master"
git submodule foreach "git checkout master --"
=======
git submodule foreach $( readlink -f -- "$0"; );
>>>>>>> c44cc4c1 (up)
=======
git submodule foreach $( readlink -f -- "$0"; );
>>>>>>> c44cc4c1 (up)
=======
git submodule foreach $( readlink -f -- "$0";)
>>>>>>> e3ae4588 (Update git_branch.sh and git_push.sh)
git branch --set-upstream-to=origin/master master
git branch -u origin/master
git merge master
git checkout master --
#read -p "Press [Enter] key to exit..."
<<<<<<< HEAD
<<<<<<< HEAD
echo '-------- END BRANCH ----------';
>>>>>>> 4f180474 (first)
=======
echo "-------- END BRANCH[$(pwd)] ----------";
>>>>>>> c44cc4c1 (up)
=======
echo "-------- END BRANCH[$(pwd)] ----------";
>>>>>>> c44cc4c1 (up)
>>>>>>> 5d5b6964 (.)
>>>>>>> 37b0029 (first)
