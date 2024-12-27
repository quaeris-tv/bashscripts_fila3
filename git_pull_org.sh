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
            
            # Configure git settings
            configure_git
            
            # Update the remote origin
            git remote set-url origin "$NEW_REMOTE"
            
            # Fetch and rebase from the new remote
            git fetch origin || {
                echo "Error: Failed to fetch from $NEW_REMOTE"
                exit 1
            }
            
            git pull --rebase || {
                echo "Error: Failed to rebase submodule $SUBMODULE_PATH"
                exit 1
            }
            
            echo "----------------------------------------"
        )
    fi
done < .gitmodules

echo "All submodules have been updated!"