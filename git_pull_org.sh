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

# Function to configure git settings
configure_git() {
    git config pull.rebase true
    git config rebase.autoStash true
    git config core.fileMode false
    git config advice.mergeConflict false
}

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
            
<<<<<<< Updated upstream
            # Configure git settings
            configure_git
=======
            # Fetch from new remote and merge
            git config advice.mergeConflict false
            # Set git configurations to avoid unnecessary conflicts and enhance pull behavior
            git config pull.rebase true
            git config rebase.autoStash true
            git config core.fileMode false
            git config advice.mergeConflict false
>>>>>>> Stashed changes
            
            # Fetch and rebase from the new remote
            git fetch "$NEW_REMOTE"
<<<<<<< Updated upstream
            git pull --rebase --autostash "$NEW_REMOTE" || {
                echo "Error: Failed to update submodule $SUBMODULE_PATH from $NEW_REMOTE"
                return 1
            }
=======
            git merge "$NEW_REMOTE/$(git rev-parse --abbrev-ref HEAD)" || echo "Failed to merge changes for $SUBMODULE_PATH"
            git pull --rebase --autostash "$NEW_REMOTE"
            #git fetch "$NEW_REMOTE"
            #git merge "$NEW_REMOTE/$(git rev-parse --abbrev-ref HEAD)" || echo "Failed to merge changes for $SUBMODULE_PATH"
            # Set git configurations to avoid unnecessary conflicts and enhance pull behavior
            
>>>>>>> Stashed changes
            echo "----------------------------------------"
        )
    fi
done < .gitmodules

echo "All submodules have been updated!"
