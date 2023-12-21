echo "N: $1"
for(( i=1; i<=$1; i++ ))
do
<<<<<<< HEAD
#git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
git add -A && aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
=======
<<<<<<< HEAD
#git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
git add -A && aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
#git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
git add -A && aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
=======
git add -A && git commit -am "rebase" && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
>>>>>>> 4f180474 (first)
=======
git add -A && git commit -am "rebase" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
>>>>>>> c44cc4c1 (up)
=======
git add -A && git commit -am "rebase" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
>>>>>>> c44cc4c1 (up)
=======
#git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
<<<<<<< HEAD
git add -A && git aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
>>>>>>> f0d63dfd (.)
=======
#git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
git add -A && git aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
>>>>>>> f0d63dfd (.)
=======
git add -A && aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
>>>>>>> 9346d094 (Fix a command typo in git_rebase.sh)
>>>>>>> 5d5b6964 (.)
>>>>>>> 37b0029 (first)
done 
