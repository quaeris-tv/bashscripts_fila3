git submodule foreach $( readlink -f -- "$0";)
git checkout --orphan newBranch
git add --renormalize -A
git add -A  # Add all files and commit them
git commit -am "first"
git branch -D $1  # Deletes the $1 branch
git branch -m $1  # Rename the current branch to $1
git gc --aggressive --prune=all     # remove the old files
git push -uf origin $1  # Force push $1 branch to github
git gc --aggressive --prune=all     # remove the old files
git gc --auto
