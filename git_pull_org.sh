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
            #git fetch "$NEW_REMOTE"
            #git merge "$NEW_REMOTE/$(git rev-parse --abbrev-ref HEAD)" || echo "Failed to merge changes for $SUBMODULE_PATH"
            git pull "$NEW_REMOTE"
            echo "----------------------------------------"
        )
    fi
done < .gitmodules

echo "All submodules have been updated!"