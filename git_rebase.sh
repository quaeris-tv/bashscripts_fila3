if [ "$2" ]; then
     echo yes
else
    echo 'aggiungere il branch ./bashscripts/git_rebase.sh <number> <branch>'
    exit 1
fi
me=$( readlink -f -- "$0";)
branch=$2
where=$(pwd)
number=$1
echo "N: $1"
for(( i=1; i<=$1; i++ ))
do
git add -A && oco && git rebase --continue || git push origin HEAD:$branch && git rebase --continue || git push -u || echo "loop: $i"
done
