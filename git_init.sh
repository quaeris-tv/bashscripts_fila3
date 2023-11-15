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
