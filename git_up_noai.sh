#!/bin/sh
if [ "$1" ]; then
     echo yes
else
    echo 'aggiungere il branch ./bashscripts/git_up_noai.sh  <branch>'
    exit 1
fi
me=$( readlink -f -- "$0";)
branch=$1
where=$(pwd)

# Funzione per copiare e rinominare le cartelle
move_config() {
  local dir_name="$1"  # Il nome della cartella (es. "Config")
  local dir_name_lower=$(echo "$dir_name" | tr '[:upper:]' '[:lower:]')  # Trasforma il nome in minuscolo

  # Verifica che la cartella esista
  if [ -d "$dir_name" ] && [ -d "$dir_name_lower" ]; then
    # Copia tutto il contenuto di dir_name_lower nella cartella passata come parametro
    cp -r "$dir_name_lower"/* "$dir_name"/
    
    # Rinomina dir_name_lower in dir_name e la cartella passata in dir_name_lower
    mv "$dir_name_lower" "$dir_name_lower"_old
    mv "$dir_name" "$dir_name_lower"
    echo "Operazione completata per $dir_name."
  else
    echo "Errore: Le cartelle $dir_name o $dir_name_lower non esistono."
  fi
}



git submodule update --progress --init --recursive --force --merge --rebase --remote
git submodule foreach "$me" "$branch"
find . -type f -name "*:Zone.Identifier" -exec rm -f {} \;
move_config "App"
move_config "Config"
move_config "Database"
move_config "Resources"
move_config "Routes"
move_config "Tests"


git config core.fileMode false
git config advice.submoduleMergeConflict false
git config core.ignorecase false
git add --renormalize -A
#git add -A && aicommits  || echo '---------------------------empty'
git add -A && git commit -am "up"  || echo '---------------------------empty'
git push origin $branch -u --progress 'origin' || git push --set-upstream origin $branch
echo "-------- END PUSH[$where ($branch)] ----------";
git checkout $branch --
git branch --set-upstream-to=origin/$branch $branch
git branch -u origin/$branch
git merge $branch
echo "-------- END BRANCH[$where ($branch)] ----------";
git submodule update --progress --init --recursive --force --merge --rebase --remote
git checkout $branch --
git pull origin $branch --autostash --recurse-submodules --allow-unrelated-histories --prune --progress -v --rebase
<<<<<<< HEAD

=======
#old branches
#git push origin --delete cs0.2.03
#git push origin --delete cs0.2.04
#git push origin --delete cs0.2.05
#git push origin --delete cs0.2.06
#git push origin --delete cs0.2.07
#git push origin --delete cs0.2.08
#git push origin --delete cs0.2.09
#git push origin --delete cs0.2.10
>>>>>>> 30fce8a850f4384ad82e6d4c36deed5f1884866e
sed -i -e 's/\r$//' "$me"
echo "-------- END PULL[$where ($branch)] ----------";

