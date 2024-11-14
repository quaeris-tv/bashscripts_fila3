#!/bin/bash

# Check if organization name is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <new-organization-name>"
    exit 1
fi

NEW_ORG="$1"

# Check if .gitmodules exists
if [ ! -f .gitmodules ]; then
    echo "Error: .gitmodules file not found!"
    exit 1
fi

# Read .gitmodules file and process each submodule
while IFS= read -r line; do
    # Remove carriage return and leading/trailing whitespace
    line=$(echo "$line" | tr -d '\r' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
    
    if [[ $line =~ path\ =\ (.+)$ ]]; then
        # Get submodule path and clean it
        SUBMODULE_PATH="${BASH_REMATCH[1]}"
        SUBMODULE_PATH=$(echo "$SUBMODULE_PATH" | tr -d '\r' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

        echo "Processing submodule: $SUBMODULE_PATH"
        
        # Check if the submodule directory exists
        if [ ! -d "$SUBMODULE_PATH" ]; then
            echo "Warning: Directory $SUBMODULE_PATH does not exist, skipping..."
            continue
        fi
        
        # Enter the submodule directory
        (
            cd "$SUBMODULE_PATH" || { echo "Error: Could not enter directory $SUBMODULE_PATH"; exit 1; }
            
            # Get the repository name from the current remote URL
            REPO_NAME=$(basename "$(git config --get remote.origin.url)" .git)
            
            # Create new remote URL based on the provided organization name
            NEW_REMOTE="https://github.com/$NEW_ORG/$REPO_NAME.git"
            
            echo "Updating submodule: $SUBMODULE_PATH"
            echo "New remote: $NEW_REMOTE"
            
<<<<<<< HEAD
            # Fetch from new remote and merge
<<<<<<< HEAD
            git config advice.mergeConflict false
=======
            # Set git configurations to avoid unnecessary conflicts and enhance pull behavior
            git config pull.rebase true
            git config rebase.autoStash true
>>>>>>> 0fb58d09ee6da0a806d0df1ff8b3e051ae7cd29f
            git config core.fileMode false
            git config advice.mergeConflict false
            
            # Fetch from the new remote and rebase if necessary
            git fetch "$NEW_REMOTE"
<<<<<<< HEAD
            git merge "$NEW_REMOTE/$(git rev-parse --abbrev-ref HEAD)" || echo "Failed to merge changes for $SUBMODULE_PATH"
            git pull --rebase --autostash "$NEW_REMOTE"
=======
            #git fetch "$NEW_REMOTE"
            #git merge "$NEW_REMOTE/$(git rev-parse --abbrev-ref HEAD)" || echo "Failed to merge changes for $SUBMODULE_PATH"
            git config pull.rebase true
            git config rebase.autoStash true
            git config core.fileMode false
            git config advice.mergeConflict false
            git pull --autostash --rebase "$NEW_REMOTE"
<<<<<<< HEAD
<<<<<<< HEAD
            
=======
            git pull "$NEW_REMOTE"
>>>>>>> e54526d1 (.)
=======
            git pull "$NEW_REMOTE"
=======
=======
>>>>>>> 0c4f21f9 (♻️ (git_pull_org.sh): remove unnecessary conflict markers and clean up git pull script for better readability and maintainability)
            git config pull.rebase true
            git config rebase.autoStash true
            git config core.fileMode false
            git config advice.mergeConflict false
            git pull --autostash --rebase "$NEW_REMOTE"
<<<<<<< HEAD
>>>>>>> d3e61bb2 (.)
>>>>>>> 60b6575c (🔧 (fix.txt): resolve conflict in fix.txt file regarding file mode changes)
=======
>>>>>>> 0c4f21f9 (♻️ (git_pull_org.sh): remove unnecessary conflict markers and clean up git pull script for better readability and maintainability)
>>>>>>> 4befc76b89e00cb8e18154037b2b867049d60648
=======
>>>>>>> 548b84aabf0af02f4cd11abead75047cf7240de2
=======
            git pull --autostash --rebase "$NEW_REMOTE" || {
                echo "Error: Failed to update submodule $SUBMODULE_PATH from $NEW_REMOTE"
                return 1
            }
            
>>>>>>> 0fb58d09ee6da0a806d0df1ff8b3e051ae7cd29f
=======
>>>>>>> c3f5d813402c3c65088db71170cc7f01213f01b5
            echo "----------------------------------------"
        )
    fi
done < .gitmodules

echo "All submodules have been updated!"
