echo "N: $1"
for(( i=1; i<=$1; i++ ))
do
<<<<<<< HEAD
<<<<<<< HEAD
git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
#git add -A && aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
done 
=======
=======
>>>>>>> 0809004 (rebase 7)
<<<<<<< HEAD
git add -A && git commit -am "rebase $i" && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
#git add -A && aicommits && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
done 
=======
git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
#git add -A && aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
done 
>>>>>>> 1283aaa (first)
<<<<<<< HEAD
>>>>>>> 9146629 (rebase 2)
=======
=======
git add -A && git commit -am "rebase $i" && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
#git add -A && aicommits && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
done 
>>>>>>> c219998 (first)
>>>>>>> 0809004 (rebase 7)
