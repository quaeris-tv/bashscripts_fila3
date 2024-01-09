echo "N: $1"
for(( i=1; i<=$1; i++ ))
do
#git add -A && git commit -am "rebase $1" && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
git add -A && aicommits && git rebase --continue || git rebase --continue || git push -uf || echo "loop: $i"
<<<<<<< HEAD
<<<<<<< HEAD
done 
=======
done 
>>>>>>> 1283aaa (first)
=======
done 
>>>>>>> dd31420 (first)
