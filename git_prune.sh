git submodule foreach 'git submodule foreach git fsck --full --unreachable'
git submodule foreach git fsck --full --unreachable
git fsck --full --unreachable

git submodule foreach 'git submodule foreach git filter-branch -- --all'
git submodule foreach git filter-branch -- --all
git filter-branch -- --all

git submodule foreach 'git submodule foreach git gc --auto --aggressive'
git submodule foreach git gc --auto --aggressive
git gc --auto --aggressive

git submodule foreach 'git submodule foreach git gc --aggressive --prune=now --force'
git submodule foreach git gc --aggressive --prune=now --force
git gc --aggressive --prune=now --force

git submodule foreach 'git submodule foreach git reflog expire --all --expire=now'
git submodule foreach git reflog expire --all --expire=now
git reflog expire --all --expire=now

git submodule foreach 'git submodule foreach git pack-refs --all --prune'
git submodule foreach git pack-refs --all --prune
git pack-refs --all --prune

git submodule foreach 'git submodule foreach git gc --prune=now --aggressive'
git submodule foreach git gc --prune=now --aggressive
git gc --prune=now --aggressive

git submodule foreach 'git submodule foreach git repack -A -d'
git submodule foreach git repack -A -d
git repack -A -d

git submodule foreach 'git submodule foreach git prune'
git submodule foreach git prune
git prune
#read -p "Press [Enter] key to exit..."
echo '-------- END PRUNE ----------';

