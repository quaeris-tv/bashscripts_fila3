echo "N: $1"
for(( i=1; i<=$1; i++ ))
do
<<<<<<< HEAD
<<<<<<< HEAD
git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
#git add -A && aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
=======
=======
>>>>>>> 31fcd80 (rebase 1/3)
<<<<<<< HEAD
git add -A && git commit -am "rebase $i" && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
#git add -A && aicommits && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
=======
git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
#git add -A && aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
>>>>>>> 1283aaa (first)
>>>>>>> 203f2f7 (first)
done 
=======
git add -A && git commit -am "rebase $i" && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
#git add -A && aicommits && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
done 
>>>>>>> 98810cd (rebase 1/3)
