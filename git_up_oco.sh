#!/bin/sh
me=$( readlink -f -- "$0";)
branch=$1
where=$(pwd)
git submodule foreach "$me" "$branch"
echo "-------- START[$where ($branch)] ----------";
oco || echo '--- no changes'
echo "-------- END PUSH[$where ($branch)] ----------";
<<<<<<< HEAD
<<<<<<< HEAD
git checkout $branch -- || git branch $branch && git checkout $branch
=======
git checkout $branch --
>>>>>>> feat(git_up_oco.sh): add script for updating all submodules and performing necessary git operations
=======
git checkout $branch -- || git branch $branch && git checkout $branch
>>>>>>> fix(git_up_oco.sh): handle case where branch does not exist locally by creating and checking out the branch
git merge $branch
echo "-------- END BRANCH[$where ($branch)] ----------";
git pull origin $branch --autostash --allow-unrelated-histories --prune --progress -v 
echo "-------- END PULL[$where ($branch)] ----------";
git status


