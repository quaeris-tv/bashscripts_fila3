echo "N: $1"
for(( i=1; i<=$1; i++ ))
do
git add -A && oco && git rebase --continue || git rebase --continue || git push -u || echo "loop: $i"
done 
