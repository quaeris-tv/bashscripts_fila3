echo "N: $1"
for(( i=1; i<=$1; i++ ))
do
<<<<<<< HEAD
#git add -A && git commit -am "rebase $i" && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
git add -A && aicommits && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
done 
=======
#git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
git add -A && aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
<<<<<<< HEAD
<<<<<<< HEAD
done 
=======
done 
>>>>>>> 1283aaa (first)
<<<<<<< HEAD
>>>>>>> 9146629 (rebase 2)
=======
=======
done 
>>>>>>> dd31420 (first)
>>>>>>> e58576c (rebase 5)
