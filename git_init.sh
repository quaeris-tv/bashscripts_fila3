<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> dev
=======
>>>>>>> b3a67b2 (first)
git submodule foreach $( readlink -f -- "$0";)
git config pull.rebase true
git config remote.origin.push HEAD
git config core.autocrlf true
git config core.safecrlf false
git config submodule.recurse true
git config core.fileMode false
git config advice.skippedCherryPicks false
git remote set-branches --add origin master
git push --recurse-submodules=on-demand
git branch --set-upstream-to=origin/master master

<<<<<<< HEAD
<<<<<<< HEAD
=======
#!/bin/sh
git submodule foreach "git config pull.rebase true"
git submodule foreach "git remote set-branches --add origin master"
=======
git submodule foreach $( readlink -f -- "$0";)
>>>>>>> 5eb74ee (.)
git config pull.rebase true
git config remote.origin.push HEAD
git config core.autocrlf true
git config core.safecrlf false
git config submodule.recurse true
git config core.fileMode false
git config advice.skippedCherryPicks false
git remote set-branches --add origin master
git push --recurse-submodules=on-demand
git branch --set-upstream-to=origin/master master
<<<<<<< HEAD
git submodule foreach git branch --set-upstream-to=origin/master master
>>>>>>> a176205 (first)
=======

>>>>>>> 5eb74ee (.)
=======
>>>>>>> dev
=======
#!/bin/sh
git submodule foreach "git config pull.rebase true"
git submodule foreach "git remote set-branches --add origin master"
=======
git submodule foreach $( readlink -f -- "$0";)
>>>>>>> 5eb74ee (.)
git config pull.rebase true
git config remote.origin.push HEAD
git config core.autocrlf true
git config core.safecrlf false
git config submodule.recurse true
git config core.fileMode false
git config advice.skippedCherryPicks false
git remote set-branches --add origin master
git push --recurse-submodules=on-demand
git branch --set-upstream-to=origin/master master
<<<<<<< HEAD
git submodule foreach git branch --set-upstream-to=origin/master master
>>>>>>> a176205 (first)
=======

>>>>>>> 5eb74ee (.)
=======
>>>>>>> b3a67b2 (first)
