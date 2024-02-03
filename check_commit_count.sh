#!/bin/bash

function check_commit_count() {
    paths=("$@")
    # Get the git global username
    username=$(git config --global user.name)
    for path in "${paths[@]}"; do
        if [ -d "$path" ]; then
            echo "Checking commits in $path"
            
            cd "$path" || return 1  # Change directory, return if unsuccessful
            
            git_dirs=($(find . -name ".git" -type d))

            for git_dir in "${git_dirs[@]}"; do
                cd "$git_dir/.." || return 1  # Move to the parent directory of .git
                
                commit_count=$(git rev-list --count --author="$username" --since="midnight" HEAD)
                
                if [ "$commit_count" -gt 0 ]; then
                    echo "Commits found in $git_dir. Commit count: $commit_count, Breaking..."
                    return 1  # Return false
                fi
                
                cd - > /dev/null  # Move back to the previous directory
            done
        else
            echo "Directory $path does not exist."
        fi
    done
    echo "None of Git directories have acceptable commit counts. Firing notification"
    return 0  # Return true
}

# Example usage
 check_commit_count "$@"
# check_commit_count "/Users/comviva/SavingCirclesGIT/E2E" "/Users/comviva/SavingCirclesGIT/UMS2.0"
# Echo the result
