git submodule foreach $( readlink -f -- "$0"; );
git fsck --full --unreachable
git filter-branch -- --all
git gc --auto --aggressive
git gc --aggressive --prune=now --force
git reflog expire --all --expire=now
git pack-refs --all --prune
git gc --prune=now --aggressive
git repack -A -d
git prune
#read -p "Press [Enter] key to exit..."
echo "-------- END PRUNE[$(pwd)] ----------";

