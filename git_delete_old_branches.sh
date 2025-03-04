#!/bin/sh

# Ottieni il percorso assoluto dello script
me=$(readlink -f -- "$0")

# Esegui il comando su tutti i submodule
git submodule foreach "$me"

# Definisci i branch da eliminare
branches_to_delete="
    0.0.1
    cs0.1.01
    cs0.2.00
    cs0.2.01
    cs0.2.02
    cs0.2.03
    cs0.2.04
    cs0.2.05
    cs0.2.06
    cs0.2.07
    cs0.2.08
    cs0.2.09
    cs0.2.10
    v0.2.06
    v0.2.07
    v0.2.08
    v0.2.09
    v0.2.10
    v1.x
    gh-pages
    dependabot/github_actions/ramsey/composer-install-3
    dependabot/npm_and_yarn/postcss-nesting-13.0.0
"

# Itera su tutti i remote configurati
for remote in $(git remote); do
    for branch in $branches_to_delete; do
        echo "Deleting branch '$branch' from remote '$remote'..."
        git push "$remote" --delete "$branch"
    done
done
