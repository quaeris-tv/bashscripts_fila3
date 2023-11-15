echo "N: $1"
for(( i=1; i<=$1; i++ ))
do
git add -A && git commit -am "rebase" && git rebase --continue || git rebase --continue || git push -u --force || echo "loop: $i"
done 
