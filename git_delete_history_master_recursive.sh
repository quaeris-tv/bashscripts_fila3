git submodule foreach $( readlink -f -- "$0";)
git checkout --orphan newBranch
git add --renormalize -A
git add -A  # Add all files and commit them
git commit -am "first"
git branch -D master  # Deletes the master branch
git branch -m master  # Rename the current branch to master
git gc --aggressive --prune=all     # remove the old files
git push -uf origin master  # Force push master branch to github
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
git push -u origin master  # Force push master branch to github
<<<<<<< HEAD
>>>>>>> 1283aaa (first)
=======
git pull origin master
>>>>>>> c944ae5 (.)
=======
>>>>>>> fcc9fa2 (rebase 1/2)
=======
>>>>>>> dd31420 (first)
=======
>>>>>>> c219998 (first)
=======
>>>>>>> b3a67b2 (first)
git gc --aggressive --prune=all     # remove the old files