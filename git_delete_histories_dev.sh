git checkout --orphan newBranch
git add -A  # Add all files and commit them
git commit -am .
git branch -D dev  # Deletes the dev branch
git branch -m dev  # Rename the current branch to dev
git gc --aggressive --prune=all     # remove the old files
<<<<<<< HEAD
<<<<<<< HEAD:git_delete_history_dev_recursive.sh
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
git push -uf origin dev  # Force push dev branch to github
=======
git push -u origin dev  # Force push dev branch to github
<<<<<<< HEAD
>>>>>>> 1283aaa (first)
=======
git pull origin dev 
>>>>>>> c944ae5 (.)
=======
git push -uf origin dev  # Force push dev branch to github
>>>>>>> fcc9fa2 (rebase 1/2)
=======
git push -uf origin dev  # Force push dev branch to github
>>>>>>> dd31420 (first)
git gc --aggressive --prune=all     # remove the old files
=======
git push -f origin dev  # Force push dev branch to github
git gc --aggressive --prune=all     # remove the old files
git gc --auto
>>>>>>> 176336a24e1a8742876789b7719df64eb92bf7dd:git_delete_histories_dev.sh
=======
git push -f origin dev  # Force push dev branch to github
git gc --aggressive --prune=all     # remove the old files
git gc --auto
>>>>>>> master
