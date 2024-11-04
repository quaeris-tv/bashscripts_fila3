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
        SUBMODULE_PATH=$(echo "${BASH_REMATCH[1]}" | tr -d '\r' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        
        echo "Processing submodule: $SUBMODULE_PATH"
        
        # Check if directory exists
        if [ ! -d "$SUBMODULE_PATH" ]; then
            echo "Warning: Directory $SUBMODULE_PATH does not exist, skipping..."
            continue
        fi
        
        # Enter submodule directory
        (
            cd "$SUBMODULE_PATH" || {
                echo "Error: Could not enter directory $SUBMODULE_PATH"
                exit 1
            }
            
            # Get repository name from current remote URL
            REPO_NAME=$(basename "$(git config --get remote.origin.url)" .git)
            
            # Create new remote URL
            NEW_REMOTE="https://github.com/$NEW_ORG/$REPO_NAME.git"
            
            echo "Pulling from: $NEW_REMOTE"
            
            # Fetch from new remote and merge
<<<<<<< HEAD
            git config advice.mergeConflict false
            git config core.fileMode false
            git fetch "$NEW_REMOTE"
            git merge "$NEW_REMOTE/$(git rev-parse --abbrev-ref HEAD)" || echo "Failed to merge changes for $SUBMODULE_PATH"
            git pull --rebase --autostash "$NEW_REMOTE"
=======
            #git fetch "$NEW_REMOTE"
            #git merge "$NEW_REMOTE/$(git rev-parse --abbrev-ref HEAD)" || echo "Failed to merge changes for $SUBMODULE_PATH"
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
            git config pull.rebase true
            git config rebase.autoStash true
            git config core.fileMode false
            git config advice.mergeConflict false
            git pull --autostash --rebase "$NEW_REMOTE"
            
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
            echo "----------------------------------------"
        )
    fi
done < .gitmodules

echo "All submodules have been updated!"