<<<<<<< HEAD
=======
<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 37b0029 (first)
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
=======
=======
=======
>>>>>>> bb09ef32 (rebase 1/1)
=======
>>>>>>> bb09ef32 (rebase 1/1)
>>>>>>> 5d5b6964 (.)
#!/bin/sh
git submodule foreach "git config pull.rebase true"
git submodule foreach "git remote set-branches --add origin master"
git config pull.rebase true
git remote set-branches --add origin master
git config remote.origin.push HEAD
git submodule foreach git config remote.origin.push HEAD
git config --global core.autocrlf true
git config --global core.safecrlf false
git config --global submodule.recurse true
git config --global core.fileMode false
git push --recurse-submodules=on-demand
git config core.filemode false
git config core.autocrlf true
git submodule foreach --recursive git config core.filemode false
git submodule foreach --recursive git config core.autocrlf true
git submodule foreach git config advice.skippedCherryPicks false
git config advice.skippedCherryPicks false
git branch --set-upstream-to=origin/master master
git submodule foreach git branch --set-upstream-to=origin/master master
<<<<<<< HEAD
=======
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 4f180474 (first)
=======
=======
>>>>>>> bb09ef32 (rebase 1/1)
=======
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

>>>>>>> ed812984 (first)
<<<<<<< HEAD
>>>>>>> bb09ef32 (rebase 1/1)
=======
>>>>>>> bb09ef32 (rebase 1/1)
>>>>>>> 5d5b6964 (.)
>>>>>>> 37b0029 (first)
